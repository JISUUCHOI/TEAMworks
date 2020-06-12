package com.kh.teamworks.mail.controller;

import java.io.File;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeUtility;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.FileSystemResource;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.google.gson.Gson;
import com.kh.teamworks.common.model.vo.PageInfo;
import com.kh.teamworks.common.template.Pagination;
import com.kh.teamworks.employee.model.service.EmployeeService;
import com.kh.teamworks.employee.model.vo.Employee;
import com.kh.teamworks.mail.model.service.MailService;
import com.kh.teamworks.mail.model.vo.Mail;
import com.kh.teamworks.mail.model.vo.MailAddress;
import com.kh.teamworks.mail.model.vo.MailAttachment;
import com.kh.teamworks.mail.model.vo.MailDTO;
import com.kh.teamworks.mail.model.vo.SearchMailCondition;
import com.kh.teamworks.management.model.vo.Department;

@Controller
public class MailController {
	
	@Autowired
	private MailService emService;
	@Autowired
	private JavaMailSender mailSender;
	
	@RequestMapping("rlist.ma")
	public String InboxMailList(HttpSession session, int currentPage, Model model) {
		
		Employee e = (Employee)session.getAttribute("loginUser");
		
		if(e !=null) {
			int listCount = emService.selectInboxListCount(e.getEmpId());
			PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 10, 10);
			ArrayList<MailDTO> rList = emService.selectInboxList(pi, e.getEmpId());
			model.addAttribute("pi", pi);
			model.addAttribute("rList", rList);
			return "mail/receiveMailList";
		}else {
			model.addAttribute("msg", "로그인 후 이용하세요.");
			return "common/errorPage";
		}
	}

	/**
	 * 받은 메일 검색 메소드
	 * @param sc
	 * @param currentPage
	 * @param session
	 * @param model
	 * @return
	 */
	@RequestMapping("search.ma")
	public String searchInboxMail(SearchMailCondition sc, int currentPage,  HttpSession session, Model model) {
		
		Employee e = (Employee)session.getAttribute("loginUser");
		sc.setEmpId(e.getEmpId());
		
		if(sc.getReadStatus()!=null && sc.getCondition() == null) {
			int listCount = emService.searchReadListCount(sc);
			PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 10, 10);
			ArrayList<MailDTO> rList = emService.searchReadList(sc, pi);
			model.addAttribute("pi", pi);
			model.addAttribute("rList", rList);
			model.addAttribute("sc", sc);
			
			return "mail/receiveMailList";
			
		}
		
		if(sc.getKeyword() != null && sc.getReadStatus() == null) {
			switch(sc.getCondition()) {
			case "title" : sc.setTitle(sc.getKeyword()); break;
			case "content" : sc.setContent(sc.getKeyword()); break;
			case "sender" : sc.setSender(sc.getKeyword()); break;
			}
			
			int listCount = emService.searchKeyListCount(sc);
			PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 10, 10);
			ArrayList<MailDTO> rList = emService.searchKeyList(sc, pi);
			
			model.addAttribute("pi", pi);
			model.addAttribute("rList", rList);
			model.addAttribute("sc", sc);
			return "mail/receiveMailList";
		}
		
		if(sc.getKeyword()!=null && sc.getReadStatus()!=null) {
			//System.out.println(sc);
			switch(sc.getCondition()) {
			case "title" : sc.setTitle(sc.getKeyword()); break;
			case "content" : sc.setContent(sc.getKeyword()); break;
			case "sender" : sc.setSender(sc.getKeyword()); break;
			}
			int listCount = emService.searchListCount(sc);
			PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 10, 10);
			ArrayList<MailDTO> rList = emService.searchList(sc, pi);
			model.addAttribute("pi", pi);
			model.addAttribute("rList", rList);
			model.addAttribute("sc", sc);
			return "mail/receiveMailList";
		}
		
		return "redirect:rList.ma";
	}
	
	@RequestMapping("slist.ma")
	public String outboxMailList(SearchMailCondition sc, int currentPage,  HttpSession session, Model model) {
		
		Employee e = (Employee)session.getAttribute("loginUser");
		
		if(e !=null) {
			int listCount = emService.selectOutboxListCount(e.getEmpId());
			PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 10, 10);
			ArrayList<MailDTO> sList = emService.selectOutboxList(pi, e.getEmpId());
			model.addAttribute("pi", pi);
			model.addAttribute("sList", sList);
			return "mail/sendMailList";
		}else {
			model.addAttribute("msg", "로그인 후 이용하세요.");
			return "common/errorPage";
		}
	}
	
	@RequestMapping("outboxSearch.ma")
	public String searchOutboxMail(SearchMailCondition sc, int currentPage,  HttpSession session, Model model) {
		Employee e = (Employee)session.getAttribute("loginUser");
		sc.setEmpId(e.getEmpId());
		if(sc.getKeyword()!=null) {
			switch(sc.getCondition()) {
			case "recipients" : sc.setRecipients(sc.getKeyword()); break;
			case "title" : sc.setTitle(sc.getKeyword()); break;
			case "content" : sc.setContent(sc.getKeyword()); break;
			}
		}
		int listCount = emService.searchOutboxListCount(sc);
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 10, 10);
		ArrayList<MailDTO> sList = emService.searchOutboxList(sc,pi);
		model.addAttribute("pi", pi);
		model.addAttribute("sList", sList);
		model.addAttribute("sc", sc);
		return "mail/sendMailList";
	}
	
	@ResponseBody
	@RequestMapping(value="changeRead",method = RequestMethod.POST, produces="text/html; charset=utf-8")
	public String changeReadStatus(@RequestParam(value="emailNo[]") String[] emailNo, HttpSession session){
		Employee e = (Employee)session.getAttribute("loginUser");
		
		ArrayList<Mail> list = new ArrayList<>();
		
		for(int i=0; i<emailNo.length; i++) {
			Mail mail = new Mail();
			mail.setRecipients(e.getEmpId());
			mail.setEmailNo(Integer.parseInt(emailNo[i]));
			
			list.add(mail);
		}
		
		// System.out.println(list);
		int result = 0;
		for(Mail m : list) {
			
			result = emService.changeReadStatus(m);
		}
		if(result>0) {
			return "success";
		}else {
			return "fail";
		}
		//System.out.println(emailNo[0]);
		
	}
	
	@ResponseBody
	@RequestMapping(value="deleteMail", produces="text/html; charset=utf-8")
	public String deleteMail(@RequestParam(value="emailNo[]") String[] emailNo, HttpSession session) {
		Employee e = (Employee)session.getAttribute("loginUser");
		
		ArrayList<Mail> list = new ArrayList<>();
		
		for(int i=0; i<emailNo.length; i++) {
			Mail mail = new Mail();
			mail.setRecipients(e.getEmpId());
			mail.setEmailNo(Integer.parseInt(emailNo[i]));
			
			list.add(mail);
		}
		int result = 0;
		for(Mail m : list) {
			
			result = emService.deleteMail(m);
		}
		if(result>0) {
			return "success";
		}else {
			return "fail";
		}
		
	}
	
	@RequestMapping("trash.ma")
	public String selectTrahMailList(HttpSession session, int currentPage, Model model) {
		Employee e = (Employee)session.getAttribute("loginUser");
		
		if(e !=null) {
			int listCount = emService.selectTrashListCount(e.getEmpId());
			PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 10, 10);
			ArrayList<MailDTO> tList = emService.selectTrashList(pi, e.getEmpId());
			model.addAttribute("pi", pi);
			model.addAttribute("tList", tList);
			return "mail/mailTrashListView";
		}else {
			model.addAttribute("msg", "로그인 후 이용하세요.");
			return "common/errorPage";
		}
	}
	
	@RequestMapping("trashSearch.ma")
	public String searchTrashList(SearchMailCondition sc, int currentPage,  HttpSession session, Model model) {
		Employee e = (Employee)session.getAttribute("loginUser");
		sc.setEmpId(e.getEmpId());
		if(sc.getKeyword()!=null) {
			switch(sc.getCondition()) {
			case "sender" : sc.setSender(sc.getKeyword()); break;
			case "title" : sc.setTitle(sc.getKeyword()); break;
			case "content" : sc.setContent(sc.getKeyword()); break;
			}
		}
		int listCount = emService.searchTrashListCount(sc);
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 10, 10);
		ArrayList<MailDTO> tList = emService.searchTrashList(sc,pi);
		model.addAttribute("pi", pi);
		model.addAttribute("tList", tList);
		model.addAttribute("sc", sc);
		return "mail/mailTrashListView";
	}
	
	@ResponseBody
	@RequestMapping(value="smailDel", produces="text/html; charset=utf-8")
	public String deleteSendMail(@RequestParam(value="emailNo[]") String[] emailNo, HttpSession session) {
		Employee e = (Employee)session.getAttribute("loginUser");
		
		ArrayList<Mail> list = new ArrayList<>();
		
		for(int i=0; i<emailNo.length; i++) {
			Mail mail = new Mail();
			mail.setSender(e.getEmpId());
			mail.setEmailNo(Integer.parseInt(emailNo[i]));
			
			list.add(mail);
		}
		int result = 0;
		for(Mail m : list) {
			
			result = emService.deleteSendMail(m);
		}
		if(result>0) {
			return "success";
		}else {
			return "fail";
		}
		
	}
	
	@ResponseBody
	@RequestMapping(value="revoke", produces="text/html; charset=utf-8")
	public String revokeMail(@RequestParam(value="emailNo[]") String[] emailNo, HttpSession session) {
		Employee e = (Employee)session.getAttribute("loginUser");
		ArrayList<MailDTO> list = new ArrayList<>();
		
		
		ArrayList<MailDTO> tList = emService.selectTrashAllList(e.getEmpId());
		
		for(int i=0; i<emailNo.length; i++) {
			MailDTO revoke = new MailDTO();
			for(MailDTO t : tList) {
				if(t.getEmailNo()==Integer.parseInt(emailNo[i])) {
					revoke.setSenderStatus(t.getSenderStatus()); // 보낸 편지 삭제된 상태
					revoke.setEmailStatus(t.getEmailStatus()); // 받은 편지 삭제된 상태 
					revoke.setEmpId(e.getEmpId());
					revoke.setEmailNo(Integer.parseInt(emailNo[i]));
				}
			}
			
			list.add(revoke);
		}
		int result = 0;
		
		for(MailDTO m : list) {
			
			result = emService.revokeMail(m);
		}
		if(result>0) {
			return "success";
		}else {
			return "fail";
		}
		
	}
	
	@RequestMapping("sendForm.ma")
	public String sendMailForm(Model model) {
		
		ArrayList<Department> deptList = emService.selectDeptList();
		ArrayList<Employee> empList = emService.selectEmpList();
		
		model.addAttribute("deptList", deptList);
		model.addAttribute("empList", empList);
		
		return "mail/sendMailForm";
	}
	
	@ResponseBody
	@RequestMapping("sendMail")
	public String sendMail(Mail m, HttpServletRequest request, HttpSession session, HttpServletResponse response,
			            @RequestParam(name="uploadFile", required=false) MultipartFile[] file) {
		Employee sender = (Employee)session.getAttribute("loginUser");
		ArrayList<MailAttachment> attachList = new ArrayList<>();
		
		// 첨부 파일 있으면 서버에 올리고 
		if(file.length>0) {
			String resources = request.getSession().getServletContext().getRealPath("resources"); 
			String savePath = resources + "\\mailUploadFiles\\";
			
			for(int i=0; i<file.length; i++) {
				MailAttachment ma = new MailAttachment();
				ma.setOriginFileName(file[i].getOriginalFilename());
				String changeName = uploadeMailFile(file[i], request);
				ma.setChangeFileName(changeName);
				ma.setFilePath(savePath + changeName);
				ma.setFilesize(file[i].getSize());
				attachList.add(ma);
			}
		}
		// 실제 메일 보내고 
		try {
			
			request.setCharacterEncoding("utf-8");
			response.setContentType("text/html; charset=utf-8");
			MimeMessage message = mailSender.createMimeMessage();
			MimeMessageHelper messageHelper = new MimeMessageHelper(message, true, "UTF-8");
			
			messageHelper.setFrom(m.getSender());
			messageHelper.setTo(m.getStrTo());
			if(!m.getStrCc().equals("")) {
				messageHelper.setCc(m.getStrCc());;
			}
			if(!m.getStrBcc().equals("")) {
				messageHelper.setBcc(m.getStrBcc());;
			}
			messageHelper.setSubject(m.getMailTitle());
			StringBuffer sb = new StringBuffer();
			sb.append("<html><body>");
			sb.append("<meta http-equiv='Content-Type' content='text/html; charset=euc-kr'>");
			sb.append(m.getMailContent());
			sb.append("</body></html>");
			String str = sb.toString();
			messageHelper.setText(str, true);
			
			if(attachList.size()>0) {
				 
				for(MailAttachment ma: attachList) {
					FileSystemResource fsr = new FileSystemResource(ma.getFilePath());
					messageHelper.addAttachment(MimeUtility.encodeText(ma.getOriginFileName(), "UTF-8","B"),fsr);
				}
			}
			
			mailSender.send(message);
		} catch (MessagingException e) {
			e.printStackTrace();
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		
		Mail mail = new Mail();
		mail.setMailTitle(m.getMailTitle());
		mail.setMailContent(m.getMailContent());
		mail.setSenderId(sender.getEmpId());
		
		int result = emService.insertMail(mail);
		
		
		if(result>0) {
			// int resultTo = emService.insertMailAddress();
			Employee to = emService.selectUser(m.getStrTo());
			String toId = to.getEmpId();
			int toResult = emService.insertMailAddressTo(toId);
			int ccResult =0;
			int bccResult=0;
			int fileResult=0;
			if(!m.getStrCc().equals("")) {
				Employee cc = emService.selectUser(m.getStrCc());
				String ccId=cc.getEmpId();
				ccResult = emService.insertMailAddressCc(ccId);
			}
			if(!m.getStrBcc().equals("")) {
				Employee bcc = emService.selectUser(m.getStrBcc());
				String bcId=bcc.getEmpId();
				bccResult = emService.insertMailAddressBcc(bcId);
			}
			if(toResult>0) {
				if(attachList.size()>0) {
					for(MailAttachment ma : attachList) {
						fileResult = emService.insetMailAttachment(ma);
					}
				}
			}
			return "success";
		}else {
			return "fail";
		}
		// 디비에 insert 
	}
	
	@RequestMapping(value="userMail", produces="application/json; charset=utf-8", method=RequestMethod.GET)
	public @ResponseBody String searchUserMail(@RequestParam("keyword") String keyword,
			 			                       HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		response.setContentType("text/html; charset=utf-8");
		response.setCharacterEncoding("utf-8");
		
		if(keyword == null || keyword.equals("")) {
			return null;
		}
		
		keyword = keyword.toLowerCase();
		ArrayList<Employee> keywordList = emService.searchUserMail(keyword);
		
		//System.out.println(keywordList);
		//JSONObject jObj = new JSONObject();
		//jObj.put("keyword", keywordList);
		//String jsonInfo = jObj.toString();
		
		return new Gson().toJson(keywordList);
	}
	
	public String uploadeMailFile(MultipartFile file, HttpServletRequest request) {
		String resources = request.getSession().getServletContext().getRealPath("resources"); 
		String savePath = resources + "\\mailUploadFiles\\";
		String originName = file.getOriginalFilename();
		
		String currentTime = new SimpleDateFormat("yyyyMMddHHmmss").format(new Date());
		int ranNum = (int)(Math.random() * 90000+ 10000);
		
		String ext = originName.substring(originName.lastIndexOf(".")); //".jpg"
		
		String changeName = "m"+ currentTime + ranNum + ext; // 20200522202011.jpg
		
		try {
			file.transferTo(new File(savePath + changeName));
			
		} catch (IllegalStateException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		return changeName;
	}
	
	
	@RequestMapping("receiveDetail.ma")
	public String detailMail(HttpSession session, int emailNo, int no, Model model) {
		Employee e  = (Employee)session.getAttribute("loginUser");
		
		Mail mail = new Mail();
		mail.setRecipients(e.getEmpId());
		mail.setEmailNo(emailNo);
		
		if(no==1) {
			int result = emService.changeReadStatus(mail); // 읽음 처리
			
			if(result>0) {
				// sender
//				Mail mailList = emService.selectMail(emailNo); // 메일 조회 
//				//Employee sender = new Employee();
//				// System.out.println(mailList.getSender());
//				Employee senderEmp = emService.selectUserId(mailList.getSender());
//				mailList.setSender(senderEmp.getEmail());
				
				ArrayList<MailDTO> mailList = emService.selectMail(emailNo);
				
//				ArrayList<MailAddress> mailAddList = emService.selectMailAddress(emailNo);
//				for(MailAddress m : mailAddList) {
//					Employee r = emService.selectUserId(m.getReceiver());
//					
//				}
//				
				ArrayList<MailAttachment> attachList = emService.selectMailAttachment(emailNo);
				
				model.addAttribute("mailList", mailList);
//				model.addAttribute("mailAddList", mailAddList);
				model.addAttribute("attachList", attachList);
				// System.out.println(attachList);
			}
			
			return "mail/receiveDetailView";
			
		}else {
			ArrayList<MailDTO> mailList = emService.selectMail(emailNo);
			ArrayList<MailAttachment> attachList = emService.selectMailAttachment(emailNo);
			model.addAttribute("mailList", mailList);
			model.addAttribute("attachList", attachList);
			return "mail/sendDetailView";
		}
		
	}
	
	@ResponseBody
	@RequestMapping("delMail")
	public String deleteRmail(int emailNo, String empId) {
		//System.out.println(emailNo);
		//System.out.println(empId);
		
		Mail mail = new Mail();
		mail.setRecipients(empId);
		mail.setEmailNo(emailNo);
		
		int result = emService.deleteMail(mail);
		
		if(result>0) {
			return "success" ;
		}else {
			return "fail" ;
		}
	}
}

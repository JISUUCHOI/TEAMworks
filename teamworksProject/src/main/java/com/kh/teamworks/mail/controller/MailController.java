package com.kh.teamworks.mail.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.concurrent.SuccessCallback;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.teamworks.common.model.vo.PageInfo;
import com.kh.teamworks.common.template.Pagination;
import com.kh.teamworks.employee.model.vo.Employee;
import com.kh.teamworks.mail.model.service.MailService;
import com.kh.teamworks.mail.model.vo.MailDTO;
import com.kh.teamworks.mail.model.vo.SearchMailCondition;

@Controller
public class MailController {
	
	@Autowired
	private MailService emService;
	
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
	
}

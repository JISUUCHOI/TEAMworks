package com.kh.teamworks.employee.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.Random;

import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.GsonBuilder;
import com.kh.teamworks.employee.model.service.EmployeeService;
import com.kh.teamworks.employee.model.vo.Attendance;
import com.kh.teamworks.employee.model.vo.Employee;
import com.kh.teamworks.employee.model.vo.SearchEmpAttCondition;
import com.kh.teamworks.employee.model.vo.SearchEmpAttendance;
import com.kh.teamworks.employee.model.vo.SearchMyAttendance;

@Controller
public class EmployeeController {

	@Autowired
	private EmployeeService eService;
	@Autowired
	private BCryptPasswordEncoder bcryptPasswordEncoder;
	@Autowired
	private JavaMailSender mailSender;
	
	@RequestMapping("login.em")
	public ModelAndView loginEmployee(Employee e, HttpSession session, ModelAndView mv) {
		
		// System.out.println(e.getEmpId());
		// System.out.println(e.getEmpPwd());
		Employee loginUser = eService.loginEmployee(e);
		
		// System.out.println(loginUser.getEmpPwd());
		if(loginUser != null && bcryptPasswordEncoder.matches(e.getEmpPwd(), loginUser.getEmpPwd())) {
			session.setAttribute("loginUser", loginUser);
			mv.setViewName("redirect:/");
		}else {
			mv.addObject("msg", "로그인 실패").setViewName("common/errorPage");
		}
		
		return mv;
	}
	
	@RequestMapping("logout.em")
	public String logoutEmployee(HttpSession session) { //메소드명 수정
		
		session.invalidate();
		return "redirect:/";
	}
	
	@RequestMapping("myPage.em")
	public String myPage() {
		return "employee/myPage";
	}
	
	@RequestMapping("profile.em")
	public String insertProfile(Employee e,HttpServletRequest request, HttpSession session, Model model,
						        @RequestParam(name="empProfile", required=false) MultipartFile file) {
		
		// System.out.println(e);
		if(!file.getOriginalFilename().equals("")) {
			String changeName = saveFile(file, request);
			
			e.setOriginName(file.getOriginalFilename());
			e.setChangeName(changeName);
		}
		
		int result = eService.insertProfile(e);
		
		if(result>0) {
			session.setAttribute("loginUser", eService.loginEmployee(e));
			session.setAttribute("msg","이미지 등록 성공");
			return "redirect:/myPage.em";
		}else {
			model.addAttribute("msg", "이미지 등록 실패 !");
			return "redirect:common/errorPage";
		}
	}
	
	@RequestMapping("updateProfile.em")
	public String updateProfile(Employee e,HttpServletRequest request, HttpSession session, Model model,
	                            @RequestParam(name="empProfile", required=false) MultipartFile file) {
		
		if(!file.getOriginalFilename().equals("")) {
			
			if(e.getChangeName() != null) {
				deleteFile(e.getChangeName(), request);
			}
			String changeName = saveFile(file, request);
			
			e.setOriginName(file.getOriginalFilename());
			e.setChangeName(changeName);
		}
		
		int result = eService.insertProfile(e);
		if(result>0) {
			session.setAttribute("loginUser", eService.loginEmployee(e));
			session.setAttribute("msg","이미지 등록 성공");
			return "redirect:/myPage.em";
		}else {
			model.addAttribute("msg", "이미지 등록 실패 !");
			return "redirect:common/errorPage";
		}
	}
	
	@RequestMapping("updateMyPage.em")
	public String updateEmployee(Employee e, HttpSession session, Model model ) { // 메소드명 수정
		// System.out.println(e);
		int result = eService.myPageUpdateEmployee(e);
		
		if(result>0) {
			session.setAttribute("loginUser", eService.loginEmployee(e));
			session.setAttribute("msg","개인 정보 수정 성공 ! ");
			return "redirect:/myPage.em";
		}else {
			model.addAttribute("msg", "이미지 등록 실패 !");
			return "redirect:common/errorPage";
		}
	}
	
	@RequestMapping("myPwdForm.em")
	public String myPwdForm() {
		return "employee/myPasswordForm";
	}
	
	@ResponseBody
	@RequestMapping("confirmPwd.em")
	public String confirmPwd(Employee e) {
		
		Employee loginUser = eService.loginEmployee(e);
		
		if(loginUser != null && bcryptPasswordEncoder.matches(e.getEmpPwd(), loginUser.getEmpPwd())) {
			return "success";
		}else {
			
			return "fail";
		}
		
	}
	
	@RequestMapping("searchPwd.em")
	public String searchPwdForm() {
		return "employee/searchPwdForm";
	}
	
	@ResponseBody
	@RequestMapping("checkId.em")
	public String checkId(Employee e) {
		
		Employee searchUser = eService.loginEmployee(e);
		
		if(searchUser != null) { // 사원번호 조회 성공
			
			if(e.getEmail().equals(searchUser.getEmail())) {// 등록된 이메일과 같음
				return "success";
			}else { // 등록된 이메일과 다름
				return "fail";
			}
		}else { // 사원번호 조회 실패
			return "none";
		}
		
	}
	
	@ResponseBody
	@RequestMapping("auth.em")
	public String authMailSending(String email) {
		
		Random r = new Random();
		int dice = r.nextInt() + 50106;
		
		String setfrom = "twgroupware@gmail.com";
		String tomail=email;
		String title="TEAMworks 인증 메일 입니다.";
		String content =
		
			   System.getProperty("line.separator")+
			   "인증번호는 " + dice + " 입니다." +
			   System.getProperty("line.separator")+
			   "받으신 인증번호를 사이트에서 입력하시면 비밀번호를 변경하실 수 있습니다.";
		
		try {
			MimeMessage message = mailSender.createMimeMessage();
			MimeMessageHelper messageHelper = new MimeMessageHelper(message, true, "UTF-8");
			
			messageHelper.setFrom(setfrom);
			messageHelper.setTo(tomail);
			messageHelper.setSubject(title);
			messageHelper.setText(content);
			
			mailSender.send(message);
			
		} catch (MessagingException e) {
			e.printStackTrace();
		}
		
		return String.valueOf(dice);
	}
	
	@ResponseBody
	@RequestMapping("changePwd.em")
	public String changePwd(Employee e) {
		
		String encPwd = bcryptPasswordEncoder.encode(e.getEmpPwd());
		e.setEmpPwd(encPwd);
		int result = eService.myUpdatePwd(e);
		
		if(result>0) {
			
			return "success";
		}else {
			
			return "fail";
		}
	}
	
	@RequestMapping("updatePwd.em")
	public String myUpdatePwd(Employee e, Model model, HttpServletRequest request) {
		
		String encPwd = bcryptPasswordEncoder.encode(e.getEmpPwd());
		e.setEmpPwd(encPwd);
		int result = eService.myUpdatePwd(e);
		
		if(result>0) {
			request.setAttribute("msg", "비밀번호 변경 성공 !! 다시 로그인 해주세요.");
			return "redirect:logout.em";
		}else {
			model.addAttribute("msg", "비밀번호 변경 실패");
			return "common/errorPqge";
		}
	}
	
	public String saveFile(MultipartFile file,  HttpServletRequest request) {
		String resources = request.getSession().getServletContext().getRealPath("resources");
		String savePath = resources + "\\empUploadFiles\\";
		
		String originName = file.getOriginalFilename();
		
		String currentTime = new SimpleDateFormat("yyyyMMddHHmmss").format(new Date());
		
		String ext = originName.substring(originName.lastIndexOf("."));
		
		String changeName = "tw"+currentTime+ext;
		
		try {
			file.transferTo(new File(savePath + changeName));
		} catch (IllegalStateException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		return changeName;
	}
	
	
	public void deleteFile(String fileName, HttpServletRequest request) {
		String resources = request.getSession().getServletContext().getRealPath("resources");
		String savePath = resources + "\\empUploadFiles\\";
		
		File deleteFile = new File(savePath + fileName);
		deleteFile.delete();
	}
	
	//내근태현황가기
	@RequestMapping("myAtt.em")
	public String myAtt() {
		return "employee/myAttendance";
	}
	
	//출근도장 
	@ResponseBody
	@RequestMapping("attinsert.em")
	public String attInsert(Attendance att) {
		//System.out.println(att);
		int result = eService.attInsert(att);
		
		if(result >0) {
			return "success";
		}else {
			return "fail";
		}
	}
	//출근 퇴근 시간 갱신
	@ResponseBody
	@RequestMapping(value="todayAtt.em", produces="application/json; charset=utf-8")
	public String selectAttTime(String empId) {
		
		Attendance att =  eService.selectAttTime(empId);
	
		return new GsonBuilder().create().toJson(att);
	}
	//퇴근 도장
		@ResponseBody
		@RequestMapping("attupdate.em")
		public String attUpdate(Attendance att) {
			//System.out.println(att);
			int result = eService.attUpdate(att);
			
			if(result >0) {
				
				return "success";
			}else {
				return "fail";
			}
		}
	// 내 근태 
		
		@ResponseBody
		@RequestMapping(value="selectAtt.em", produces="application/json; charset=utf-8")
		public String selectAtt(String empId) {
			
			Attendance att =  eService.selectAtt(empId);
		
			return new GsonBuilder().create().toJson(att);
		}
		
		@RequestMapping("qr.em")
	    public ModelAndView createCode(@RequestParam String content){
	           //ModelAndView 바로 리턴
	           return new ModelAndView("qrcodeview", "content", content);
	    }
		
		@RequestMapping("QRAtt.em")
		public String QRAtt() {
			return "employee/QRAtt";
		}
		@RequestMapping("QRLogin.em")
		public String QRView() {
			return "employee/QRLogin";
		}
		
		@ResponseBody
		@RequestMapping("QRattinsert.em")
		public String QRattInsert(String empId) {
			
			System.out.println(empId);
			int result = eService.QRattInsert(empId);
			
			if(result >0) {
				return "success";
			}else {
				return "fail";
			}
		}
		
		@ResponseBody
		@RequestMapping("schmyatt.em")
		public ModelAndView selectSchMyAtt(@RequestParam("searchStartDate") String startDate,@RequestParam("searchEndDate") String endDate,String empId, ModelAndView mv) {
			//System.out.println(startDate);
			SearchMyAttendance sma = new SearchMyAttendance();
			sma.setStartDate(startDate);
			sma.setEndDate(endDate);
			sma.setEmpId(empId);
			//System.out.println(sma);
			ArrayList<Attendance> list = eService.selectSchMyAtt(sma);
			//System.out.println(list);
			mv.addObject("list", list);
			mv.setViewName("employee/myAttendance");
			return mv;
		}
		
		@RequestMapping("empAtt.em")
		public String empAttGo() {
			return "employee/empAttendanceSch";
		}
		
		@ResponseBody
		@RequestMapping("empAttSch.em")
		public ModelAndView selectSchEmpAtt(@RequestParam ("searchStartDate") String startDate,@RequestParam("searchEndDate") String endDate,@RequestParam(name="empName", required=false) String empName, ModelAndView mv,@RequestParam(name="condition", required=false) String condition) {
			//System.out.println(startDate);
			//System.out.println(condition);
			
			SearchEmpAttCondition seac = new SearchEmpAttCondition();
			seac.setStartDate(startDate);
			seac.setEndDate(endDate);
			seac.setEmpName(empName);
			seac.setCondition(condition);
			System.out.println(seac);
			//System.out.println(sma);
			ArrayList<SearchEmpAttendance> list = eService.selectSchEmpAtt(seac);
			System.out.println(list);
			mv.addObject("list", list);
			mv.setViewName("employee/empAttendanceSch");
			return mv;
		}
}

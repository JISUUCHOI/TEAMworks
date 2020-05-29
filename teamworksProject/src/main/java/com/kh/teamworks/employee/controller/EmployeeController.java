package com.kh.teamworks.employee.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.kh.teamworks.employee.model.service.EmployeeService;
import com.kh.teamworks.employee.model.vo.Attendance;
import com.kh.teamworks.employee.model.vo.Employee;

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
	@RequestMapping(value="attinsert.em")
	public String attInsert(Attendance att) {
		System.out.println(att);
		int result = eService.attInsert(att);
		
		if(result >0) {
			return "success";
		}else {
			return "fail";
		}
	}
}

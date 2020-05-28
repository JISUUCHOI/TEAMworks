package com.kh.teamworks.employee.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.kh.teamworks.employee.model.service.EmployeeService;
import com.kh.teamworks.employee.model.vo.Employee;

@Controller
public class EmployeeController {

	@Autowired
	private EmployeeService eService;
	@Autowired
	private BCryptPasswordEncoder bcryptPasswordEncoder;
	
	
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
	public String logoutEemployee(HttpSession session) {
		
		session.invalidate();
		return "redirect:/";
	}
	
	@RequestMapping("myPage.em")
	public String myPage() {
		return "employee/myPage";
	}
	
	@RequestMapping("profile.em")
	public String insertProfile(Employee e,HttpServletRequest request, HttpSession session,
						        @RequestParam(name="empProfile", required=false) MultipartFile file) {
		if(!file.getOriginalFilename().equals("")) {
			String changeName = saveFile(file, request);
			
			e.setOriginName(file.getOriginalFilename());
			e.setChangeName(changeName);
		}
		
		int result = eService.insertProfile(e);
		return "redirect:/";
	}
	@RequestMapping("update.em")
	public String updateEMployee() {
		return "redirect:/";
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
}

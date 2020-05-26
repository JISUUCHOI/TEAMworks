package com.kh.teamworks.employee.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
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
}

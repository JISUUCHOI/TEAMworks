package com.kh.teamworks.mail.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.teamworks.employee.model.vo.Employee;
import com.kh.teamworks.mail.model.service.MailService;
import com.kh.teamworks.mail.model.vo.MailInfo;

@Controller
public class MailController {
	
	@Autowired
	private MailService emService;
	
	@RequestMapping("rlist.ma")
	public String receiveMailList(HttpSession session, Model model) {
		Employee e = (Employee)session.getAttribute("loginUser");
		// System.out.println(e);
		MailInfo empMailInfo = emService.selectMailInfo(e.getEmpId()); 
		
		if(empMailInfo == null) {
			
			return "mail/mailInfoGuide";
		}
		return "mail/receiveMailList";
	}
	
	@RequestMapping("InfoList.ma")
	public String mailInfoList(HttpSession session, Model model) {
		Employee e = (Employee)session.getAttribute("loginUser");
		MailInfo empMailInfo = emService.selectMailInfo(e.getEmpId()); 
		
		model.addAttribute("empMailInfo", empMailInfo);
		
		return "mail/mailInfoList";
		
	}
	
	@RequestMapping("InfoForm.ma")
	public String mailInfoForm(HttpSession session, Model model) {
		Employee e = (Employee)session.getAttribute("loginUser");
		MailInfo empMailInfo = emService.selectMailInfo(e.getEmpId()); 
		
		model.addAttribute("empMailInfo", empMailInfo);
		
		return "mail/mailInfoForm";
	}
	
}

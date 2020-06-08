package com.kh.teamworks.mail.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.teamworks.common.model.vo.PageInfo;
import com.kh.teamworks.common.template.Pagination;
import com.kh.teamworks.employee.model.vo.Employee;
import com.kh.teamworks.mail.model.service.MailService;
import com.kh.teamworks.mail.model.vo.MailDTO;

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
	
}

package com.kh.teamworks.approval.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.teamworks.approval.model.service.ReqApprovalService;
import com.kh.teamworks.employee.model.vo.Employee;

@Controller
public class requestApprovalController {

	@Autowired
	private ReqApprovalService raService;
	
	// 경조비신청서
	@RequestMapping("familyEvent.rap")
	public String familyEventtForm(HttpServletRequest request) {
		
		//String empId = ((Employee)request.getSession().getAttribute("loginUser")).getEmpId();
		//int docDepartment = ((Employee)request.getSession().getAttribute("loginUser")).getDeptCode();
		
		/*
		Employee loginUser = (Employee)request.getSession().getAttribute("loginUser");
		String docSc = "경조비신청서";
		
		int result = raService.insertDocNo(login);
		
		if(result > 0) {
			raService.selectDocNo();
		}*/
		
		return "approval/familyEventForm";
	}
	
	// 휴가신청서
	@RequestMapping("vacation.rap")
	public String vacationForm() {
		return "approval/vacationForm";
	}
	
}

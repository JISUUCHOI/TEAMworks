package com.kh.teamworks.management.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;


import com.kh.teamworks.management.model.service.ManagementService;
import com.kh.teamworks.management.model.vo.Job;

@Controller
public class ManagementController {
	
	@Autowired
	private ManagementService mgService;
	
	//회사 정보
	@RequestMapping("main.mg")
	public String selectCompanyInfo(){
		return "management/companyMainInfo";
	}
	
	//인사 정보 등록
	@RequestMapping("enrollEmp.mg")
	public String employeeEnroll() {
		return "management/companyMemberInfo";
	}
	
	//사원 명부
	@RequestMapping("empList.mg")
	public String empList() {
		return "management/companyMemberList";
	}
	
	//휴가 관리
	@RequestMapping("vacationList.mg")
	public String vacationList() {
		return "management/companyVacationList";
	}
	
	//증명서 발급
	@RequestMapping("empDocument.mg")
	public String empDocument() {
		return "management/companyMemberDocument";
	}
	
	//조직도
	@RequestMapping("org.mg")
	public String orgList() {
		return "management/companyOrganization";
	}
	
	//직급 관리
	@RequestMapping("orgJobCode.mg")
	public String orgJobCode(Model model) {
		
		ArrayList<Job> list = mgService.selectJobList();
		
		model.addAttribute("list", list);
		
		return "management/companyOrganizationOrder";
	}
	
	

	

}
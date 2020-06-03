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

@Controller
public class ManagementController {
	
	@Autowired
	private ManagementService mgService;
	
	@RequestMapping("main.mg")
	public String selectCompanyInfo(){
		return "management/companyMainInfo";
	}
	
	@RequestMapping("enrollEmp.mg")
	public String employeeEnroll() {
		return "management/companyMemberInfo";
	}
	
	@RequestMapping("empList.mg")
	public String empList() {
		return "management/companyMemberList";
	}
	
	@RequestMapping("org.mg")
	public String orgList() {
		return "management/companyOrganization";
	}
	
	@RequestMapping("orgJobCode.mg")
	public String orgJobCode() {
		return "management/companyOrganizationOrder";
	}
	
}
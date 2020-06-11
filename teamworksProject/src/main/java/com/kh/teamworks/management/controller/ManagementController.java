package com.kh.teamworks.management.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.kh.teamworks.common.model.vo.PageInfo;
import com.kh.teamworks.common.template.Pagination;
import com.kh.teamworks.employee.model.vo.Employee;
import com.kh.teamworks.management.model.service.ManagementServiceImpl;
import com.kh.teamworks.management.model.vo.CompanyBsns;
import com.kh.teamworks.management.model.vo.CompanyInfo;
import com.kh.teamworks.management.model.vo.Job;
import com.kh.teamworks.management.model.vo.empSearchCondition;

@Controller
public class ManagementController {
	
	@Autowired
	private ManagementServiceImpl mgService;
	
	@Autowired
	private BCryptPasswordEncoder bcryptPasswordEncoder;
	
	// 회사 정보 화면
	@RequestMapping("main.mg")
	public String selectCompanyInfo(HttpServletRequest request, Model model){
		
		HttpSession session = request.getSession();
		Employee e = (Employee) session.getAttribute("loginUser");
		
		String homNo = e.getHomNo();
		
		CompanyInfo companyInfo = mgService.selectCompanyInfo(homNo);
		CompanyBsns companyBsns = mgService.selectCompanyBsns(homNo);
		
		model.addAttribute("companyInfo", companyInfo);
		model.addAttribute("companyBsns", companyBsns);
		
		return "management/companyMainInfo";
	}
	
	// 인사 정보 등록 화면
	@RequestMapping("enrollEmp.mg")
	public String employeeEnroll() {
		return "management/companyEnrollMemberInfo";
	}
	
	// 인사 정보 등록
	@RequestMapping("insertEmp.mg")
	public String insertEmployee(Employee e, Model model, HttpSession session) {
		
		String tempPwd = e.getEmpNo().substring(0, 6);
		String encPwd = bcryptPasswordEncoder.encode(tempPwd);
		
		e.setEmpPwd(encPwd);
		
		
		int result = mgService.insertEmployee(e);
		
		if(result>0) {
			session.setAttribute("msg", "인사 정보 등록 성공!!");
			return "management/companyEnrollMemberInfo";
		}else {
			model.addAttribute("msg", "인사 정보 등록 실패!!");
			return "common/errorPage";
		}
		
	}
	
	// 사원 번호 중복 체크
	@ResponseBody
	@RequestMapping(value="empIdCheck.mg")
	public String idCheck(String empId) {
		
		int count = mgService.idCheck(empId);
		
		if(count>0) {
			return "fail";
		}else {
			return "success";
		}
	}
	
	
	//사원 명부
	@RequestMapping("empList.mg")
	public String empList(int currentPage, Model model) {
		
		int listCount = mgService.selectEmpCount();
		
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 5, 10);
		
		ArrayList<Employee> empList = mgService.selectEmpList(pi);
		
		model.addAttribute("empList", empList);
		model.addAttribute("pi", pi);
		
		return "management/companyMemberList";
	}
	
	// 사원 명부 검색
	@RequestMapping("empListSearch.mg")
	public String empListKeyword(int currentPage, empSearchCondition sc, Model model) {
		
		if(sc.getKeyword()!=null) {
			switch(sc.getCondition()) {
			case "empId" : sc.setEmpId(sc.getKeyword()); break;
			case "empName" : sc.setEmpName(sc.getKeyword()); break;
			case "deptName" : sc.setDeptName(sc.getKeyword()); break;
			}
			
		}else {
			sc.setEmpId(null);
			sc.setEmpName(null);
			sc.setDeptName(null);
		}
		
		int listCount = mgService.selectEmpCount(sc);
		
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 5, 10);
		
		ArrayList<Employee> empSearchList = mgService.selectEmpListKeyword(sc, pi);
		
		model.addAttribute("empSearchList", empSearchList);
		model.addAttribute("pi", pi);
		model.addAttribute("sc", sc);
		
		System.out.println(empSearchList);

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
	@RequestMapping("orgJobList.mg")
	public String selectJobList(Model model) {
		ArrayList<Job> jobList = mgService.selectJobList();
		model.addAttribute("jobList", jobList);

		return "management/companyOrganizationOrder";
	}
	
	

	

}
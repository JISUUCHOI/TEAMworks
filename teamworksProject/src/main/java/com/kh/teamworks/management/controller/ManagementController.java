package com.kh.teamworks.management.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;
import com.google.gson.JsonIOException;
import com.kh.teamworks.employee.model.vo.Employee;
import com.kh.teamworks.management.model.service.ManagementServiceImpl;
import com.kh.teamworks.management.model.vo.CompanyBsns;
import com.kh.teamworks.management.model.vo.CompanyInfo;
import com.kh.teamworks.management.model.vo.Department;
import com.kh.teamworks.management.model.vo.Job;

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
	public String empList(Model model) {
		
		ArrayList<Employee> empList = mgService.selectEmpList();
		model.addAttribute("empList", empList);
		
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
	
	//최지수_조직도
	@RequestMapping("org.mg")
	public String orgList(Model model) {
		
		ArrayList<Department> deptList = mgService.selectDeptList();
		ArrayList<Employee> empList = mgService.selectEmpList();
		
		model.addAttribute("deptList", deptList);
		model.addAttribute("empList", empList);
		
		return "management/companyOrganization";
	}
	
	// 최지수_조직도
	// 페이지 로딩 시 전체 사원 목록 조회하는 ajax 통신용 서비스
	@ResponseBody
	@RequestMapping(value="allEmpList.mg", method=RequestMethod.POST)
	public void allEmpList(HttpServletResponse response) throws JsonIOException, IOException {
		
		ArrayList<Employee> empList = mgService.selectEmpList();
		
		response.setContentType("application/json; charset=utf-8");
		new Gson().toJson(empList, response.getWriter());
	}
	
	// 최지수_조직도
	// 부서명 클릭 시 해당 부서에 소속된 사원 목록 조회하는 ajax 통신용 서비스
	@ResponseBody
	@RequestMapping(value="orgEmpList.mg", method=RequestMethod.POST)
	public void orgEmpList(int deptCode, HttpServletResponse response) throws JsonIOException, IOException {
		
		ArrayList<Employee> orgEmpList = mgService.selectEmpList(deptCode);
		
		response.setContentType("application/json; charset=utf-8");
		new Gson().toJson(orgEmpList, response.getWriter());
	}
	
	// 최지수_조직도
	// 부서 등록
	@RequestMapping("insertDept.mg")
	public String insertDept(String deptName, HttpSession session, Model model) {
		
		int result = mgService.insertDept(deptName);
		
		if(result > 0) { // 부서 등록 성공 --> 다시 조직도 페이지
			
			session.setAttribute("msg", "부서가 성공적으로 등록되었습니다.");
			return "redirect:org.mg";
			
		}else { // 부서 등록 실패 --> 에러페이지
			
			model.addAttribute("msg", "부서 등록에 실패했습니다. 다시 시도해주세요.");
			return "common/errorPage";
		}
	}
	
	// 최지수_조직도
	// 부서 수정
	@RequestMapping("updateDept.mg")
	public String updateDept(Department dept, HttpSession session, Model model) {
		
		int result = mgService.updateDept(dept);
		
		if(result > 0) { // 부서 수정 성공 --> 다시 조직도 페이지
			
			session.setAttribute("msg", "부서가 성공적으로 수정되었습니다.");
			return "redirect:org.mg";
			
		}else {	// 부서 수정 실패 --> 에러페이지
			
			model.addAttribute("msg", "부서 수정에 실패했습니다. 다시 시도해주세요.");
			return "common/errorPage";
		}
		
	}
	
	
	//직급 관리
	@RequestMapping("orgJobList.mg")
	public String selectJobList(Model model) {
		ArrayList<Job> jobList = mgService.selectJobList();
		model.addAttribute("jobList", jobList);

		return "management/companyOrganizationOrder";
	}
	
	

	

}
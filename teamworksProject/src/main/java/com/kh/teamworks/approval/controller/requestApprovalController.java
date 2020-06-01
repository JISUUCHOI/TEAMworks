package com.kh.teamworks.approval.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;
import com.kh.teamworks.approval.model.service.ReqApprovalService;
import com.kh.teamworks.approval.model.vo.ApproveSearchCondition;
import com.kh.teamworks.approval.model.vo.Document;
import com.kh.teamworks.employee.model.vo.Employee;

@Controller
public class requestApprovalController {

	@Autowired
	private ReqApprovalService raService;
	
	// 1. 문서 작성 전, 화면에 보여 줄 기본 사원정보(사원명, 소속부서명) & 조직도 select
	@RequestMapping("insertDoc.rap")
	public String selectEmpInfo(HttpServletRequest request, Model model, String doc) {
		
		System.out.println(doc);
		
		// 1_1. 문서 작성 전, 화면에 보여 줄 기본 사원정보(사원명, 소속부서명) select
		String empId = ((Employee)request.getSession().getAttribute("loginUser")).getEmpId();
		Employee emp = raService.selectEmpInfo(empId);
		
		// 1_2. 결재선/참조자 조직도 부서 select용
		ArrayList<Employee> dept = raService.selectDeptName();
		
		// 1_3. 결재선/참조자 조직도 사원 select용
		ArrayList<Employee> list = raService.selectOrgChart();
		
		model.addAttribute("emp", emp);
		model.addAttribute("dept", dept);
		model.addAttribute("list", list);
		
		// if/else구문 걸어서 화면단에서 넘어온 값이 경조사면 familyEvetForm으로 return, 휴가면 vacationForm으로 return
		if(doc.equals("경조비신청서")) {
			return "approval/familyEventForm";
		}else {
			return "approval/vacationForm";
		}
	}
	
	// 2. 결재선/참조자 사원 검색 select
	@ResponseBody
	@RequestMapping(value="empSch.rap", produces="application/json; charset=utf-8")
	public String selectEmpSch(String keyword) {
		
		ApproveSearchCondition sc = new ApproveSearchCondition();
		
		if(keyword.contains("경영") || keyword.contains("지원") || keyword.contains("개발") || keyword.contains("팀")) {
			sc.setDeptName(keyword);
		}else if(keyword.contains("대표") || keyword.contains("이사") || keyword.contains("팀장") || keyword.contains("사원")) {
			sc.setJobName(keyword);
		}else {
			sc.setEmpName(keyword);
		}
		
		ArrayList<Employee> schEmp = raService.selectEmpSch(sc);

		return new Gson().toJson(schEmp);
		
	}
	
	// 3. 경조비신청서 insert
	@RequestMapping("requestFe.rap")
	public String insertFamilyEvent(Document d) {
		int result = raService.insertFamilyEvent(d);
		
		if(result > 0) {
			return "approval/selectApprovalForm";
		}else {
			return "common/errorPage";
		}
	}
	
	// 4. 결재대기함, 결재진행함, 결재완료함, 반려문서함, 회수요청함, 결재회수함 연결
	@RequestMapping("docList.rap")
	public String documentListView(int approveStatus, Model model) {
		model.addAttribute("sts", approveStatus);
		return "approval/documentList";
	}
	
	
	
	// 휴가신청서
	/*
	@RequestMapping("vacation.rap")
	public String vacationForm() {
		//selectEmpInfo(request, model);
		return "approval/vacationForm";
	}
	*/
}

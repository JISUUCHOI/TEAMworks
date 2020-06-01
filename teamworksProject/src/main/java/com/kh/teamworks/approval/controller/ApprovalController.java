package com.kh.teamworks.approval.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.google.gson.Gson;
import com.kh.teamworks.approval.model.service.ApprovalService;
import com.kh.teamworks.approval.model.vo.ApproveLine;
import com.kh.teamworks.approval.model.vo.ApproveSearchCondition;
import com.kh.teamworks.approval.model.vo.Document;
import com.kh.teamworks.employee.model.vo.Employee;

@Controller
public class ApprovalController {

	
	@Autowired
    private ApprovalService aService;
	
	@RequestMapping("formList.ap")
	public String selectFormList() {
		return "approval/selectApprovalForm";
	}
	

	

	
	// 1. 문서 작성 전, 화면에 보여 줄 기본 사원정보(사원명, 소속부서명) & 조직도 select
	@RequestMapping("insertDoc.ap")
	public String selectEmpInfo(HttpServletRequest request, Model model, String doc) {
		
		// 1_1. 문서 작성 전, 화면에 보여 줄 기본 사원정보(사원명, 소속부서명) select
		String empId = ((Employee)request.getSession().getAttribute("loginUser")).getEmpId();
		Employee emp = aService.selectEmpInfo(empId);
		
		// 1_2. 결재선/참조자 조직도 부서 select용
		ArrayList<Employee> dept = aService.selectDeptName();
		
		// 1_3. 결재선/참조자 조직도 사원 select용
		ArrayList<Employee> list = aService.selectOrgChart();
		
		model.addAttribute("emp", emp);
		model.addAttribute("dept", dept);
		model.addAttribute("list", list);
		
		// if/else구문 걸어서 화면단에서 넘어온 값이 경조사면 familyEvetForm으로 return, 휴가면 vacationForm으로 return		
		if(doc.equals("기안서")) {
			return "approval/writeDraftForm";
		}else {
			return "approval/proofForm";
		}
	}
	
	// 2. 결재선/참조자 사원 검색 select
		@ResponseBody
		@RequestMapping(value="empSch.ap", produces="application/json; charset=utf-8")
		public String selectEmpSch(String keyword) {
			
			ApproveSearchCondition sc = new ApproveSearchCondition();
			
			if(keyword.contains("경영") || keyword.contains("지원") || keyword.contains("개발") || keyword.contains("팀")) {
				sc.setDeptName(keyword);
			}else if(keyword.contains("대표") || keyword.contains("이사") || keyword.contains("팀장") || keyword.contains("사원")) {
				sc.setJobName(keyword);
			}else {
				sc.setEmpName(keyword);
			}
			
			ArrayList<Employee> schEmp = aService.selectEmpSch(sc);

			return new Gson().toJson(schEmp);
			
		}	
	// 제증명신청서 insert
	@RequestMapping("proofInsert.ap")
	public String insertProof(Document d, Model model, HttpSession session) {
		
		 // System.out.println(d);
				
	     int result = aService.insertProof(d);
	  
	   if(result > 0) {	    	
	    	model.addAttribute("msg", "제출완료");
		   return "approval/selectApprovalForm";
	    }else {
	    	return "common/errorPage";
	    }	
	}
	
	// 기안서 insert
	@RequestMapping("draftInsert.ap")
	public String insertDraft(Document d, Model model, HttpSession session) {
		
		 System.out.println(d);
				
	     int result = aService.insertDraft(d);
	  
	   if(result > 0) {	    	
	    	model.addAttribute("msg", "제출완료");
		   return "approval/selectApprovalForm";
	    }else {
	    	return "common/errorPage";
	    }
	
	// 결재선 insert
	
	
	


	
	// 기안문insert
	// @RequestMapping("draftInsert.ap")
	// public String insertDraft
	
	
	
	
	}
}

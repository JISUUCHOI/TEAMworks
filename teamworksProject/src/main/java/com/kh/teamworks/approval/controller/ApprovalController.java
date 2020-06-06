package com.kh.teamworks.approval.controller;

import java.util.ArrayList;
import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Iterator;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
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
		
		/* 문서번호 발생 */
		Date now = new Date();
		SimpleDateFormat sf = new SimpleDateFormat("yyyyMMdd");
		String today = sf.format(now);
		
		int ran = (int)(Math.random()*899999 + 100000);
		
		String docNo = today + "-" + ran;
		d.setDocNo(docNo); 
		
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
	public String insertDraft(Document d, Model model, HttpServletRequest request, HttpSession session, 
							  MultipartHttpServletRequest mtfRequest) {					  
								  
		/* 문서번호 발생 */
		Date now = new Date();
		SimpleDateFormat sf = new SimpleDateFormat("yyyyMMdd");
		String today = sf.format(now);
		
		int ran = (int)(Math.random()*899999 + 100000);
		
		String docNo = today + "-" + ran;
		d.setDocNo(docNo);
		
		List<MultipartFile> fileList = mtfRequest.getFiles("uploadFile");
		String fileName = "";
		for (MultipartFile file : fileList) {
			if(!file.getOriginalFilename().equals("")) {
				String changeName = saveFile(file, request);
				
				fileName = fileName + file.getOriginalFilename() + ";";
			}
		}
		
		d.setFileName(fileName); 
		
		/*
		if(!file.getOriginalFilename().equals("")) {
			String changeName = saveFile(file, request);
			
			d.setFileName(file.getOriginalFilename());
		}
		*/
		
		System.out.println(d);
	 
		 int result = aService.insertDraft(d);
	  
	   if(result > 0) {	    	
	    	model.addAttribute("msg", "제출완료");
		   return "approval/selectApprovalForm";
	    }else {
	    	return "common/errorPage";
	    }
	}
	
	@RequestMapping("dragInsert.ap")
	public String insertDrag(Document d, Model model, HttpServletRequest request, HttpSession session, 
							  @RequestParam(name="uploadFile", required=false) MultipartFile file) {
		


			saveFile(file, request);
			

		
		

		return null;
	 

	  

	}
	
	// 결재요청함, 참조문서함 연결
	@RequestMapping("docList.ap")
	public String documentListView(int approveStatus, Model model) {
		model.addAttribute("sts", approveStatus);
		
		//ArrayList<Document> list = raService.selectDocList(approveStatus);
		
		return "approval/refDocListjsp";
	}
	
	
	


	
	// 기안문insert
	// @RequestMapping("draftInsert.ap")
	// public String insertDraft
	   


	
	    	// 파일
		public String saveFile(MultipartFile file,  HttpServletRequest request) {
			String resources = request.getSession().getServletContext().getRealPath("resources");
			String savePath = resources + "\\approveUploadFiles\\";
			
			String originName = file.getOriginalFilename();
			
			String currentTime = new SimpleDateFormat("yyyyMMddHHmmss").format(new Date());
			

			
			String changeName = currentTime;
			
			try {
				file.transferTo(new File(savePath + changeName));
			} catch (IllegalStateException e) {
				e.printStackTrace();
			} catch (IOException e) {
				e.printStackTrace();
			}
			
			return changeName;
		}
		

		
		
		
		
	    
}

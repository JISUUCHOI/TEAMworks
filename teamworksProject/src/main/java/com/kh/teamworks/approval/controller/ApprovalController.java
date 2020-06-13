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
import org.springframework.web.multipart.MultipartRequest;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.kh.teamworks.approval.model.service.ApprovalService;
import com.kh.teamworks.approval.model.vo.ApproveLine;
import com.kh.teamworks.approval.model.vo.ApproveSearchCondition;
import com.kh.teamworks.approval.model.vo.Document;
import com.kh.teamworks.common.model.vo.PageInfo;
import com.kh.teamworks.common.template.Pagination;
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
		}else if(doc.equals("경조비신청서")){
			return "approval/familyEventForm";
		}else if(doc.equals("휴가신청서")){
			return "approval/vacationForm";
		}else if(doc.equals("제증명신청서")){
			return "approval/proofForm";
		}else {
			return "";
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
				
	     int result1 = aService.insertProof(d);
	  
	     /* 결재선 insert */
		String approver = d.getApprover();
		
		String[] aList = null;
		
		if(approver != null) {
			aList = approver.split(",");
		}
		
		ApproveLine l = null;
		int result2 = 0;
		
		for(int i=0; i<aList.length; i++) {
			if(i==0) {
				l = new ApproveLine(aList[i], docNo, i, "진행", 0);
			}else {
				l = new ApproveLine(aList[i], docNo, i, "미결", 0);
			}
			
			result2 = aService.insertApproveLine(l);
		}
	     
	     
	   if(result1 * result2 > 0) {	    	
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

		for (MultipartFile file : fileList) {
			if(!file.getOriginalFilename().equals("")) {
				
				if(d.getChangeName() != null) {
					deleteFile(d.getChangeName(), request);
				}
				
				String changeName = saveFile(file, request);
				d.setOriginName(file.getOriginalFilename());
				d.setChangeName(changeName);
			}
		}
		
		// System.out.println(d);
	 
		 int result1 = aService.insertDraft(d);
		 
		 
		 /* 결재선 insert */
			String approver = d.getApprover();
			
			String[] aList = null;
			
			if(approver != null) {
				aList = approver.split(",");
			}
			
			ApproveLine l = null;
			int result2 = 0;
			
			for(int i=0; i<aList.length; i++) {
				if(i==0) {
					l = new ApproveLine(aList[i], docNo, i, "진행", 0);
				}else {
					l = new ApproveLine(aList[i], docNo, i, "미결", 0);
				}
				
				result2 = aService.insertApproveLine(l);
			}
		 
	  
	   if(result1 * result2 > 0) {	    	
	    	model.addAttribute("msg", "제출완료");
		   return "approval/selectApprovalForm";
	    }else {
	    	return "common/errorPage";
	    }
	}
	
	// 결재요청함 연결
	@RequestMapping("docList.ap")
	public String documentListView(Model model, HttpServletRequest request, int approveStatus) {
		
		String empId = ((Employee)request.getSession().getAttribute("loginUser")).getEmpId();
		Document d = new Document();
		
		d.setEmpId(empId); 
		d.setApproveStatus(approveStatus);
		
		ArrayList<Document> list = aService.docList(d);		 
		model.addAttribute("list", list);
		model.addAttribute("sts", approveStatus);

		// System.out.println(list);
		 
		return "approval/refDocListjsp";
		
	}
	
	// 참조문서함 연결
	@RequestMapping("referenceList.ap")
	public String referenceListView(Model model, HttpServletRequest request) {

	      String empId = ((Employee)request.getSession().getAttribute("loginUser")).getEmpId();
	      Document d = new Document();
	      
	      d.setEmpId(empId); 
	            
	      ArrayList<Document> list = aService.referenceList(d);       
	      model.addAttribute("list", list);
	            
	      return "approval/referenceList";
	   }
	
	// 상세조회
	@RequestMapping("docDetail.ap")
	public String detailDoc(Document d, Model model, HttpServletRequest request) {
		
		ArrayList<Document> doc = new ArrayList<Document>();
		
		String docNo = d.getDocNo();
		d.setDocNo(docNo);
		
		// 결재 코멘트 개수
		int count = aService.selectComment(d);
		model.addAttribute("count", count);
		
		if(d.getDocSc().equals("기안서")) {		
			doc = aService.draftDetail(d);
			model.addAttribute("d", doc);
			return "approval/draftSubmit";
		
		}else if(d.getDocSc().equals("제증명신청서")) {
			doc = aService.proofDetail(d);
			model.addAttribute("d", doc);
			// System.out.println(d);
			return "approval/proofSubmit";
		
		}else if(d.getDocSc().equals("경조비신청서")){
			doc = aService.familyEventDetail(d);
			model.addAttribute("d", doc);
			return "approval/familyEventSubmit";
		
		}else {
			doc = aService.vacationDetail(d);
			model.addAttribute("d", doc);
			return "approval/vacationSubmit";
		}
		
		
	
	}
	
	// 제증명 삭제
	@RequestMapping("deleteProof.ap")		
	public String deleteProof(String dno, HttpServletRequest request, Model model) {
		int result = aService.deleteProof(dno);
		
		if(result>0) {
			model.addAttribute("msg", "삭제완료");
			return "redirect:docList.ap?approveStatus=11";
		}else {
			model.addAttribute("msg", "삭제 실패");
			return "common/errorPage";
		}
		
	}
	
	// 기안서 수정 폼
	@RequestMapping("updateForm.ap")
	public ModelAndView updateForm(String dno, String dsc, Model model, HttpServletRequest request, ModelAndView mv) {
		
		if(dsc.equals("기안서")) {
			Document d = aService.updateDraftForm(dno);
			 System.out.println(d);
			mv.addObject("d", d);
			mv.setViewName("approval/draftUpdateForm");		
		
		}else if(dsc.equals("제증명신청서")) {
			Document d = aService.updateProofForm(dno);
			 System.out.println(d);
			mv.addObject("d", d);
			mv.setViewName("approval/proofUpdateForm");	
			
		}else if(dsc.equals("경조비신청서")) {
			Document d = aService.updateFamilyEventForm(dno);
			 System.out.println(d);
			mv.addObject("d", d);
			mv.setViewName("approval/familyEventUpdateForm");	
			
		}else {
			Document d = aService.updateVacationForm(dno);
			 System.out.println(d);
			mv.addObject("d", d);
			mv.setViewName("approval/vacationUpdateForm");	
		}
		return mv;
	}
	
	// 기안서 삭제
	@RequestMapping("deleteDraft.ap")
	public String deleteDraft(String dno, String fileName, HttpServletRequest request, Model model) {
		int result = aService.deleteDraft(dno);
		
		if(result > 0) {
			if(!fileName.equals("")) {
				deleteFile(fileName, request);				
			}
			model.addAttribute("msg", "삭제완료");
			return "redirect:docList.ap?approveStatus=11";
		}else {
			model.addAttribute("msg", "삭제 실패");
			return "common/errorPage";
		}
		
	}
		
	
	// 경조비 삭제
	@RequestMapping("deleteFamilyEvent.ap")
	public String deletefamilyEvent(String dno, HttpServletRequest request, Model model) {
		int result = aService.deletefamilyEvent(dno);
		
		if(result>0) {
			model.addAttribute("msg", "삭제완료");
			return "redirect:docList.ap?approveStatus=11";

		}else {
			model.addAttribute("msg", "삭제 실패");
			return "common/errorPage";
		}
	}
	
	// 휴가신청서 삭제
	@RequestMapping("deleteVacation.ap")
	public String deleteVacation(String dno, HttpServletRequest request, Model model) {
		int result = aService.deleteVacation(dno);
		
		if(result>0) {
			model.addAttribute("msg", "삭제완료");
			return "redirect:docList.ap?approveStatus=11";
		}else {
			model.addAttribute("msg", "삭제 실패");
			return "common/errorPage";
		}
	}

	// 파일
	public String saveFile(MultipartFile file,  HttpServletRequest request) {
		
		String resources = request.getSession().getServletContext().getRealPath("resources");
		String savePath = resources + "\\approveUploadFiles\\";
		
		String originName = file.getOriginalFilename();
		
		String currentTime = new SimpleDateFormat("yyyyMMddHHmmss").format(new Date());
		String ext = originName.substring(originName.lastIndexOf("."));
				
		String changeName = currentTime+ext;

		try {
			file.transferTo(new File(savePath + changeName));
		} catch (IllegalStateException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		return changeName;
	}
	
	// 기안문 검색
	@RequestMapping("searchDoc.ap")
	public String searchDoc(HttpServletRequest request, String d, Model model) {
		return d;
		
	}
	
	// 기안문작성 연결
	@RequestMapping("writeDocList.ap")
	public String writeDocList(Model model, HttpServletRequest request) {
		
		Document d = new Document();
		
		
		ArrayList<Document> list = aService.docList(d);		 
		model.addAttribute("list", list);

		System.out.println(list);
		 
		return "approval/selectApprovalForm";
	}
	

	
	// 파일삭제
	public void deleteFile(String fileName, HttpServletRequest request) {
		String resources = request.getSession().getServletContext().getRealPath("resources");
		String savePath = resources + "\\approveUploadFiles\\";
		
		File deleteFile = new File(savePath+fileName);
		deleteFile.delete();
	}
	


		
		
		
		
	    
}


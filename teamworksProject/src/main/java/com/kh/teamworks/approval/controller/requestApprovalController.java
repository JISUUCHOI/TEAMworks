package com.kh.teamworks.approval.controller;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;
import com.kh.teamworks.approval.model.service.ReqApprovalService;
import com.kh.teamworks.approval.model.vo.ApproveLine;
import com.kh.teamworks.approval.model.vo.ApproveSearchCondition;
import com.kh.teamworks.approval.model.vo.Document;
import com.kh.teamworks.approval.model.vo.FrequentApprovalLine;
import com.kh.teamworks.common.model.vo.PageInfo;
import com.kh.teamworks.common.template.Pagination;
import com.kh.teamworks.employee.model.vo.Employee;

@Controller
public class requestApprovalController {

	@Autowired
	private ReqApprovalService raService;
	
	// 1. 문서 작성 전, 화면에 보여 줄 기본 사원정보(사원명, 소속부서명) & 조직도 select
	@RequestMapping("insertDoc.rap")
	public String selectEmpInfo(HttpServletRequest request, Model model, String doc) {
		
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
	
	// 3_1. 경조비신청서 insert
	@RequestMapping("requestFe.rap")
	public String insertFamilyEvent(Document d) {
		
		/* 문서번호 발생 */
		Date now = new Date();
		SimpleDateFormat sf = new SimpleDateFormat("yyyyMMdd");
		String today = sf.format(now);
		
		int ran = (int)(Math.random()*899999 + 100000);
		
		String docNo = today + "-" + ran;
		d.setDocNo(docNo);
		
		/* 경조비 신청서 insert */
		int result1 = raService.insertFamilyEvent(d);
		
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
			
			result2 = raService.insertApproveLine(l);
		}
		
		/* 반환 */
		if(result1 * result2 > 0) {
			return "approval/selectApprovalForm";
		}else {
			return "common/errorPage";
		}
		
	}
	
	// 3_2. 휴가신청서 insert
	@RequestMapping("requestVac.rap")
	public String insertVacation(Document d) {

		/* 문서번호 발생 */
		Date now = new Date();
		SimpleDateFormat sf = new SimpleDateFormat("yyyyMMdd");
		String today = sf.format(now);
		
		int ran = (int)(Math.random()*899999 + 100000);
		
		String docNo = today + "-" + ran;
		d.setDocNo(docNo);
		
		
		/* 휴가신청서 insert */
		int result1 = raService.insertVacation(d);
		
		
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
			
			result2 = raService.insertApproveLine(l);
		}
		
		/* 반환 */
		if(result1 * result2 > 0) {
			return "approval/selectApprovalForm";
		}else {
			return "common/errorPage";
		}
	}
	
	// 4_0. 결재선 즐겨찾기 추가 전, 같은 이름 있는지 확인
	@ResponseBody
	@RequestMapping(value="selectName.rap")
	public int selectLineName(FrequentApprovalLine f) {
		int count = raService.selectLineName(f);
		return count;
	}
	
	// 4_1. 결재선 즐겨찾기 추가
	@ResponseBody
	@RequestMapping(value="insertFreLine.rap")
	public String insertFreLine(FrequentApprovalLine f) {
		
		String line = f.getApprover();
		String[] list = null;
		FrequentApprovalLine fal = null;
		int result = 0;
		
		if(line != null) {
			list = line.split(",");
		}
		
		for(int i=0; i<list.length; i++) {
			fal = new FrequentApprovalLine(f.getLineName(), f.getEmpId(), list[i], i);
			
			result = raService.insertFreLine(fal);
		}
		
		if(result > 0) {
			return "success";
		}else {
			return "fail";
		}
		
	}
	
	// 4_2. 결재선 즐겨찾기 리스트 조회
	@ResponseBody
	@RequestMapping(value="flist.rap", produces="application/json; charset=utf-8")
	public String selectFreLine(String empId) {
		ArrayList<FrequentApprovalLine> count = raService.selectFreLine(empId);
		return new Gson().toJson(count);
	}
	
	// 4_3. 결재선 즐겨찾기 리스트 선택시 결재라인 조회
	@ResponseBody
	@RequestMapping(value="lineDetail.rap", produces="application/json; charset=utf-8")
	public String selectLineDetail(FrequentApprovalLine f) {
		ArrayList<FrequentApprovalLine> list = raService.selectLineDetail(f);
		return new Gson().toJson(list);
	}
	
	// 4_4. 결재선 즐겨찾기 삭제
	@ResponseBody
	@RequestMapping(value="lineDelete.rap")
	public String deleteLine(FrequentApprovalLine f) {
		int result = raService.deleteLine(f);
		if(result > 0) {
			return "success";
		}else {
			return "fail";
		}
	}
	
	
	// 5. 결재대기함, 결재진행함, 결재완료함, 반려문서함, 회수요청함, 결재회수함 리스트 조회
	@RequestMapping("docList.rap")
	public String documentListView(HttpServletRequest request, int approveStatus, int currentPage, Model model) {
		
		String empId = ((Employee)request.getSession().getAttribute("loginUser")).getEmpId();
		Document d = new Document();
		
		d.setEmpId(empId);
		d.setApproveStatus(approveStatus);
		
		// 5_1. 문서 총 개수 조회
		int listCount = raService.selectListCount(d);
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 10, 5);
		
		// 5_2. 문서 리스트 조회
		ArrayList<Document> list = raService.selectDocList(d, pi);
		
		model.addAttribute("sts", approveStatus);
		model.addAttribute("list", list);
		model.addAttribute("pi", pi);
		
		return "approval/documentList";
	}
	
	// 6. 문서 상세조회
	@RequestMapping("detailDoc.rap")
	public String selectDocDetail(Document doc, Model model) {
		
		String docSc = doc.getDocSc();
		ArrayList<Document> d = new ArrayList<Document>();
		
		switch(docSc) {
		case "경조비신청서" : d = raService.selectFeDetail(doc); model.addAttribute("d", d); return "approval/familyEventSubmit";
		default :  d = raService.selectVacDetail(doc); model.addAttribute("d", d); return "approval/vacationSubmit";
		}
		
	}
	
}

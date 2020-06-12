package com.kh.teamworks.approval.controller;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

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
	public String insertFamilyEvent(Document d, Model model) {
		
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
			model.addAttribute("msg", "제출 완료");
			return "approval/selectApprovalForm";
		}else {
			return "common/errorPage";
		}
		
	}
	
	// 3_2. 휴가신청서 insert
	@RequestMapping("requestVac.rap")
	public String insertVacation(Document d, Model model) {

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
			model.addAttribute("msg", "제출 완료");
			return "approval/selectApprovalForm";
		}else {
			return "common/errorPage";
		}
	}
	
	// 4_1. 결재선 즐겨찾기 추가 전, 같은 이름 있는지 확인
	@ResponseBody
	@RequestMapping(value="selectName.rap")
	public int selectLineName(FrequentApprovalLine f) {
		int count = raService.selectLineName(f);
		return count;
	}
	
	// 4_2. 결재선 즐겨찾기 추가
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
	
	// 4_3. 결재선 즐겨찾기 리스트 조회
	@ResponseBody
	@RequestMapping(value="flist.rap", produces="application/json; charset=utf-8")
	public String selectFreLine(String empId) {
		ArrayList<FrequentApprovalLine> count = raService.selectFreLine(empId);
		return new Gson().toJson(count);
	}
	
	// 4_4. 결재선 즐겨찾기 리스트 선택시 결재라인 조회
	@ResponseBody
	@RequestMapping(value="lineDetail.rap", produces="application/json; charset=utf-8")
	public String selectLineDetail(FrequentApprovalLine f) {
		ArrayList<FrequentApprovalLine> list = raService.selectLineDetail(f);
		return new Gson().toJson(list);
	}
	
	// 4_5. 결재선 즐겨찾기 삭제
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
		
		model.addAttribute("listCount", listCount);
		model.addAttribute("sts", approveStatus);
		model.addAttribute("list", list);
		model.addAttribute("pi", pi);
		
		return "approval/documentList";
	}
	
	// 5. 검색 결과 리스트 조회
	@RequestMapping("searchList.rap")
	public String searchDocList(HttpServletRequest request, ApproveSearchCondition asc, Model model) {
		
		String condition = asc.getCondition();
		String keyword = asc.getKeyword();
		
		switch(condition) {
		case "writer" : asc.setWriter(keyword); break;
		case "title" : asc.setTitle(keyword); break;
		case "form" : asc.setForm(keyword); break;
		}
		
		// 5_3. 검색 결과에 해당하는 게시글 개수 조회
		int listCount = raService.searchListCount(asc);
		int currentPage = Integer.parseInt(request.getParameter("currentPage"));
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 10, 5);
		
		// 5_4. 검색 결과에 해당하는 게시글 리스트 조회
		ArrayList<Document> list = raService.searchDocList(asc, pi);
		
		model.addAttribute("listCount", listCount);
		model.addAttribute("sts", asc.getApproveStatus());
		model.addAttribute("list", list);
		model.addAttribute("pi", pi);
		model.addAttribute("asc", asc);
		
		return "approval/documentList";
		
	}
	
	// 6. 문서 상세조회
	@RequestMapping("detailDoc.rap")
	public String selectDocDetail(Document doc, Model model, HttpServletRequest request) {
		
		String docSc = doc.getDocSc();
		ArrayList<Document> d = new ArrayList<Document>();
		
		// 6_1. '진행' 상태인 결재자 id 조회 --> 결재버튼 클릭
		String approveEmpid = raService.selectApId(doc);
		model.addAttribute("approveEmpid", approveEmpid);
		
		// 6_2. 결재 코멘트 개수
		int count = raService.selectComment(doc);
		model.addAttribute("count", count);
		
		// 6_3. 해당 아이디 문서별 approveStatus 조회
		String approverEmpid = ((Employee)request.getSession().getAttribute("loginUser")).getEmpId();
		doc.setApproverEmpid(approverEmpid);
		int status = raService.selectApStatus(doc);
		model.addAttribute("status", status);
		
		switch(docSc) {
		// 6_4. 문서 상세조회 - 경조비신청서
		case "경조비신청서" : d = raService.selectFeDetail(doc); model.addAttribute("d", d); return "approval/familyEventSubmit";
		// 6_5. 문서 상세조회 - 휴가신청서
		case "휴가신청서" : d = raService.selectVacDetail(doc); model.addAttribute("d", d); return "approval/vacationSubmit";
		// 6_6. 문서 상세조회 - 기안서
		case "기안서" : d = raService.selectDraftDetail(doc); model.addAttribute("d", d); return "approval/draftSubmit";
		
		// 6_7. 문서 상세조회 - 제증명신청서
		default : d = raService.selectProofDetail(doc); model.addAttribute("d", d); return "approval/proofSubmit";
		}
		
	}
	
	// 7. 승인/반려, 결재의견 insert
	@RequestMapping("updateApprove.rap")
	public String updateApprove(Document doc, Model model) {
		
		int result1 = 0;
		int result2 = 0;
		int result3 = 0;
		
		// 7_6. 이전 승인권자들 id 조회
		ArrayList<Document> all = new ArrayList<>();
		all = raService.selectAllList(doc);

		Document d = new Document();
		d.setDocNo(doc.getDocNo());
		
		// 승인/반려 구분
		String ar = doc.getApproveReject();
		
		if(ar.equals("승인")) {	// 승인할 경우
			// 7_1. 미결, 진행 결재선 id 조회
			ArrayList<Document> list = raService.selectApList(doc);
			
			if(list.size() > 1) {
				// 7_2. 첫번째 승인권자 승인, 결재의견 insert
				result1 = raService.updateApprove(doc);
				
				// 7_3. 기안자 상태 doc_status '진행'로 update
				result2 = raService.updateDocStatus(doc);
				
				System.out.println(result2);
				
				// 7_4. 다음 승인권자 상태 update
				doc.setApproverEmpid(list.get(1).getApproverEmpid());
				result3 = raService.updateLine(doc);
			}else {
				// 7_5. 마지막 승인권자 상태 update -> 완료함
				result1 = raService.updateComplete(doc);
				
				// 7_7. 이전 승인권자들 상태 '완료'로 update
				for(int i=0; i<all.size()-1; i++) {
					d.setApproverEmpid(all.get(i).getApproverEmpid());
					result3 = raService.updateAllComplete(d);
				}
				
				// 7_8. 기안자 상태 doc_status '완료'로 update
				result2 = raService.updateDs(doc);
				System.out.println(result2);
			}
		}else {	// 반려할 경우
			// 7_9. 현재 진행중인 승인권자가 반려할 경우
			result1 = raService.updateReject(doc);
			
			// 7_10. 나머지 승인권자들 상태 '반려'로 update
			for(int i=0; i<all.size(); i++) {
				d.setApproverEmpid(all.get(i).getApproverEmpid());
				result3 = raService.updateAllReject(d);
			}
			
			// 7_11. 기안자 상태 doc_status '반려'로 update
			result2 = raService.updateDsReject(doc);
			
		}
		
		if(result1 * result2 * result3 > 0) {
			model.addAttribute("docNo", doc.getDocNo());
			model.addAttribute("docSc", doc.getDocSc());
			return "redirect:detailDoc.rap";
			//redirect할 경우 
			
		}else {
			model.addAttribute("msg", "결재 실패");
			return "common/errorPage";
		}
	}
	
	// 8. 참조문서함
	@RequestMapping("referenceList.rap")
	public String selectRefList(HttpServletRequest request, Model model, int currentPage) {
		
		String empId = ((Employee)request.getSession().getAttribute("loginUser")).getEmpId();
	    Document d = new Document();
	    d.setEmpId(empId);
	    
	    // 8_1. 참조문서 총 개수 조회
	    int listCount = raService.selectRefCount(d);
	    PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 10, 5);
	    
		// 8_2. 참조문서 리스트 조회
		ArrayList<Document> list = raService.selectRefList(d, pi);
		
		model.addAttribute("listCount", listCount);
		model.addAttribute("list", list);
		model.addAttribute("pi", pi);
		
		return "approval/referenceList";
		
	}
	
	// 8_3. 참조문서함 검색
	@RequestMapping("docSearch.rap")
	public String searchRefList(HttpServletRequest request, ApproveSearchCondition asc, Model model) {
		
		String condition = asc.getCondition();
		String keyword = asc.getKeyword();
		String docStatus = asc.getDocStatus();
		
		
		if(condition != null) {
			switch(condition) {
			case "writer" : asc.setWriter(keyword); break;
			case "title" : asc.setTitle(keyword); break;
			case "form" : asc.setForm(keyword); break;
			}
		}
		
		if(docStatus != null) {
			switch(docStatus) {
			case "stand" : asc.setStand("stand"); break;
			case "pending" : asc.setPending("pending"); break;
			case "complete" : asc.setComplete("complete"); break;
			case "refuse" : asc.setRefuse("refuse"); break;
			}
		}
		// 8_3. 검색 결과에 해당하는 참조문서 개수 조회
		int listCount = raService.searchRefCount(asc);
		int currentPage = Integer.parseInt(request.getParameter("currentPage"));
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 10, 5);
		
		// 8_4. 검색 결과에 해당하는 참조문서 리스트 조회
		ArrayList<Document> list = raService.searchRefList(asc, pi);
		
		model.addAttribute("listCount", listCount);
		model.addAttribute("list", list);
		model.addAttribute("pi", pi);
		model.addAttribute("asc", asc);
		
		return "approval/referenceList";
		
	}
	
	// 9.결재요청함
	@RequestMapping("myDocList.rap")
	public String selectMyDocList(HttpServletRequest request, Model model, int currentPage) {
		
		String empId = ((Employee)request.getSession().getAttribute("loginUser")).getEmpId();
	    Document d = new Document();
	    d.setEmpId(empId);
	    
	    // 9_1. 결재요청함 총 문서개수 조회
	    int listCount = raService.selectMyDocCount(d);
	    PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 10, 5);
	    
	    
		// 9_2. 결재요청함 리스트 조회
		ArrayList<Document> list = raService.selectMyDocList(d, pi);
		
		model.addAttribute("listCount", listCount);
		model.addAttribute("list", list);
		model.addAttribute("pi", pi);
		
		return "approval/refDocListjsp";
		
	}
	
	// 9_3. 참조문서함 검색
		@RequestMapping("myDocSearch.rap")
		public String searchMyDocList(HttpServletRequest request, ApproveSearchCondition asc, Model model) {
			
			String condition = asc.getCondition();
			String keyword = asc.getKeyword();
			String docStatus = asc.getDocStatus();
			
			if(condition != null) {
				switch(condition) {
				case "writer" : asc.setWriter(keyword); break;
				case "title" : asc.setTitle(keyword); break;
				case "form" : asc.setForm(keyword); break;
				}
			}
			
			if(docStatus != null) {
				switch(docStatus) {
				case "stand" : asc.setStand("stand"); break;
				case "pending" : asc.setPending("pending"); break;
				case "complete" : asc.setComplete("complete"); break;
				case "refuse" : asc.setRefuse("refuse"); break;
				}
			}

			// 9_3. 검색 결과에 해당하는 참조문서 개수 조회
			int listCount = raService.searchMyDocCount(asc);
			System.out.println(listCount);
			int currentPage = Integer.parseInt(request.getParameter("currentPage"));
			PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 10, 5);
			
			// 9_4. 검색 결과에 해당하는 참조문서 리스트 조회
			ArrayList<Document> list = raService.searchMyDocList(asc, pi);
			
			model.addAttribute("listCount", listCount);
			model.addAttribute("list", list);
			model.addAttribute("pi", pi);
			model.addAttribute("asc", asc);
			
			return "approval/refDocListjsp";
			
		}
	
	
	// 10. sidebar 보관함별 문서개수 count
	@ResponseBody
	@RequestMapping(value="count.rap", produces="application/json; charset=utf-8")
	public String countDoc(HttpServletRequest request, Model model) {
		
		String empId = ((Employee)request.getSession().getAttribute("loginUser")).getEmpId();
	    Document d = new Document();
		d.setEmpId(empId);
		
		int stand = raService.countStand(d);
		int pending = raService.countPending(d);
		int complete = raService.countComplete(d);
		int refuse = raService.countRefuse(d);
		int ref = raService.selectRefCount(d);
		int callback = raService.countCallback(d);
		
		int[] count = new int[6];
		count[0] = stand;
		count[1] = pending;
		count[2] = complete;
		count[3] = refuse;
		count[4] = ref;
		count[5] = callback;
		
		return new Gson().toJson(count);
	}
	
	// 11. 회수요청
	@RequestMapping("reqCallback.rap")
	public String requestCallback(Document d, Model model, HttpSession session) {
		
		// 11_1. '진행'중인 결재권자에게 회수요청
		int result1 = raService.requestCallback(d);

		// 11_2. 기안자 doc_status 4.회수요청으로 변경
		int result2 = raService.updateDocSt(d);
		
		if(result1 * result2>0) {
			model.addAttribute("docNo", d.getDocNo());
			model.addAttribute("docSc", d.getDocSc());
			
			session.setAttribute("msg", "회수요청 완료");
			return "redirect:docDetail.ap";
		}else {
			return "common/errorPage";
		}
		
	}
	
	
}

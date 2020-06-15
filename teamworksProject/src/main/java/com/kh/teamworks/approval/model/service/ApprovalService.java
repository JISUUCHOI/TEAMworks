package com.kh.teamworks.approval.model.service;

import java.util.ArrayList;

import com.kh.teamworks.approval.model.vo.ApproveLine;
import com.kh.teamworks.approval.model.vo.ApproveSearchCondition;
import com.kh.teamworks.approval.model.vo.Document;
import com.kh.teamworks.approval.model.vo.DocumentList;
import com.kh.teamworks.common.model.vo.PageInfo;
import com.kh.teamworks.approval.model.vo.Document;
import com.kh.teamworks.employee.model.vo.Employee;


public interface ApprovalService {

	// 제증명 insert
	int insertProof(Document d);
	
	// 기안서 insert
	int insertDraft(Document d);
	
	// 결재선 insert
	int insertApproveLine(ApproveLine l);
	
	// 1_1. 문서 작성 전, 화면에 보여 줄 기본 사원정보(사원명, 소속부서명) select
	Employee selectEmpInfo(String empId);
	
	// 1_2. 참조자 조직도 부서 select용
	ArrayList<Employee> selectDeptName();
	
	// 1_3. 참조자 조직도 사원 select용
	ArrayList<Employee> selectOrgChart();

	// 2. 결재선/참조자 사원 검색 select
	ArrayList<Employee> selectEmpSch(ApproveSearchCondition sc);
	
	// 결재요청함, 참조문서함 list
	// int docListCount(Document d);
	
	// list 갯수
	ArrayList<Document> docList(Document d);
	
	// 참조문서함 list
	ArrayList<Document> referenceList(Document d);

	// 상세조회-결재 코멘트 개수 조회
	int selectComment(Document d);
	
	// 상세조회 기안서
	ArrayList<Document> draftDetail(Document d);

	// 상세조회 제증명신청서
	ArrayList<Document> proofDetail(Document d);
	
	// 상세조회 경조비신청서
	ArrayList<Document> familyEventDetail(Document d);
	
	// 상세조회 휴가신청서
	ArrayList<Document> vacationDetail(Document d);

	// 제증명 삭제
	int deleteProof(String dno);
	
	// 기안서 삭제
	int deleteDraft(String dno);

	// 경조비 삭제
	int deletefamilyEvent(String dno);

	// 휴가 삭제
	int deleteVacation(String dno);

	// 경조비 수정폼
	Document updateDraftForm(String dno);

	// 제증명 수정폼
	Document updateProofForm(String dno);

	// 경조비 수정폼
	Document updateFamilyEventForm(String dno);

	// 휴가 수정폼
	Document updateVacationForm(String dno);

	// 기안문작성 리스트
	ArrayList<Document> writeDocList(Document d);

	int updateHate(DocumentList d);

	int updateLike(DocumentList d);











	
	
}

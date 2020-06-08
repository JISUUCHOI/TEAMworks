package com.kh.teamworks.approval.model.service;

import java.util.ArrayList;

import com.kh.teamworks.approval.model.vo.ApproveSearchCondition;
import com.kh.teamworks.approval.model.vo.Document;
import com.kh.teamworks.common.model.vo.PageInfo;
import com.kh.teamworks.approval.model.vo.Document;
import com.kh.teamworks.employee.model.vo.Employee;


public interface ApprovalService {

	// 제증명 insert
	int insertProof(Document d);
	
	// 기안서 insert
	int insertDraft(Document d);
	
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

	// 상세조회 기안서
	Document draftDetail(Document d);

	// 상세조회 제증명신청서
	Document proofDetail(Document d);

	// 제증명 삭제
	int deleteProof(String dno);
	

	

	





	
}

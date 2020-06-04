package com.kh.teamworks.approval.model.service;

import java.util.ArrayList;

import com.kh.teamworks.approval.model.vo.ApproveLine;
import com.kh.teamworks.approval.model.vo.ApproveSearchCondition;
import com.kh.teamworks.approval.model.vo.Document;
import com.kh.teamworks.approval.model.vo.FrequentApprovalLine;
import com.kh.teamworks.employee.model.vo.Employee;

public interface ReqApprovalService {

	// 1_1. 문서 작성 전, 화면에 보여 줄 기본 사원정보(사원명, 소속부서명) select
	Employee selectEmpInfo(String empId);
	
	// 1_2. 결재선/참조자 조직도 부서 select용
	ArrayList<Employee> selectDeptName();
	
	// 1_3. 결재선/참조자 조직도 사원 select용
	ArrayList<Employee> selectOrgChart();

	// 2. 결재선/참조자 사원 검색 select
	ArrayList<Employee> selectEmpSch(ApproveSearchCondition sc);
	
	// 3_1. 경조비신청서 insert
	int insertFamilyEvent(Document d);
	
	// 3_2. 휴가신청서 insert
	int insertVacation(Document d);
	
	// 3_3. 결재선 insert
	int insertApproveLine(ApproveLine l);
	
	// 4_0. 결재선 즐겨찾기 추가 전, 같은 이름 있는지 확인
	int selectLineName(FrequentApprovalLine f);
	
	// 4_1. 결재선 즐겨찾기 추가
	int insertFreLine(FrequentApprovalLine fal);
	
	// 4_2. 결재선 즐겨찾기 리스트 조회
	ArrayList<FrequentApprovalLine> selectFreLine(String empId);
	
	// 4_3. 결재선 즐겨찾기 리스트 선택시 결재라인 조회
	ArrayList<FrequentApprovalLine> selectLineDetail(FrequentApprovalLine f);
	
	// 4_4. 결재선 즐겨찾기 삭제
	int deleteLine(FrequentApprovalLine f);
	
	
	// 5. 결재대기함, 결재진행함, 결재완료함, 반려문서함, 회수요청함, 결재회수함 연결
	/*
	ArrayList<Document> selectDocList(int approveStatus);
	*/
	
}

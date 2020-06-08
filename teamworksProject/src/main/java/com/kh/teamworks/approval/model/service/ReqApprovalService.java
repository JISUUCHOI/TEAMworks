package com.kh.teamworks.approval.model.service;

import java.util.ArrayList;

import com.kh.teamworks.approval.model.vo.ApproveLine;
import com.kh.teamworks.approval.model.vo.ApproveSearchCondition;
import com.kh.teamworks.approval.model.vo.Document;
import com.kh.teamworks.approval.model.vo.FrequentApprovalLine;
import com.kh.teamworks.common.model.vo.PageInfo;
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
	
	// 5_1. 문서 총개수 조회
	int selectListCount(Document d);
	
	// 5_2. 결재대기함, 결재진행함, 결재완료함, 반려문서함, 회수요청함, 결재회수함 - 문서 리스트 조회
	ArrayList<Document> selectDocList(Document d, PageInfo pi);
	
	// 6_1. '진행' 상태인 결재자 id 조회
	String selectApId(Document doc);
	
	// 6_2. 결재 코멘트 개수 조회
	int selectComment(Document doc);
	
	// 6_3. 해당 아이디 문서별 approveStatus 조회
	int selectApStatus(Document doc);
	
	// 6_4. 문서 상세조회 - 경조비신청서
	ArrayList<Document> selectFeDetail(Document doc);
	
	// 6_5. 문서 상세조회 - 휴가신청서
	ArrayList<Document> selectVacDetail(Document doc);
	
	// 7_1. 첫번째 승인권자 승인/반려, 결재의견 insert
	int updateApprove(Document doc);
	
	// 7_2. 다음 승인권자 상태 update
	int updateLine(Document doc);
	
}

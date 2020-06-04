package com.kh.teamworks.approval.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.teamworks.approval.model.dao.ReqApprovalDao;
import com.kh.teamworks.approval.model.vo.ApproveLine;
import com.kh.teamworks.approval.model.vo.ApproveSearchCondition;
import com.kh.teamworks.approval.model.vo.Document;
import com.kh.teamworks.approval.model.vo.FrequentApprovalLine;
import com.kh.teamworks.employee.model.vo.Employee;

@Service("raService")
public class ReqApprovalServiceImpl implements ReqApprovalService {

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Autowired
	private ReqApprovalDao raDao;

	// 1_1. 문서 작성 전, 화면에 보여 줄 기본 사원정보(사원명, 소속부서명) select
	@Override
	public Employee selectEmpInfo(String empId) {
		return raDao.selectEmpInfo(sqlSession, empId);
	}

	// 1_2. 결재선/참조자 조직도 부서 select용
	@Override
	public ArrayList<Employee> selectDeptName() {
		return raDao.selectDeptName(sqlSession);
	}

	// 1_3. 결재선/참조자 조직도 사원 select용
	@Override
	public ArrayList<Employee> selectOrgChart() {
		return raDao.selectOrgChart(sqlSession);
	}

	// 2. 결재선/참조자 사원 검색 select
	@Override
	public ArrayList<Employee> selectEmpSch(ApproveSearchCondition sc) {
		return raDao.selectEmpSch(sqlSession, sc);
	}

	// 3_1. 경조비신청서 insert
	@Override
	public int insertFamilyEvent(Document d) {
		return raDao.insertFamilyEvent(sqlSession, d);
	}

	// 3_2. 휴가신청서 insert
	@Override
	public int insertVacation(Document d) {
		return raDao.insertVacation(sqlSession, d);
	}

	// 3_3. 결재선 insert
	@Override
	public int insertApproveLine(ApproveLine l) {
		return raDao.insertApproveLine(sqlSession, l);
	}
	
	// 4_0. 결재선 즐겨찾기 추가 전, 같은 이름 있는지 확인
	@Override
	public int selectLineName(FrequentApprovalLine f) {
		return raDao.selectLineName(sqlSession, f);
	}
	

	// 4_1. 결재선 즐겨찾기 추가
	@Override
	public int insertFreLine(FrequentApprovalLine fal) {
		return raDao.insertFreLine(sqlSession, fal);
	}

	// 4_2. 결재선 즐겨찾기 리스트 개수 조회
	@Override
	public ArrayList<FrequentApprovalLine> selectFreLine(String empId) {
		return raDao.selectFreLine(sqlSession, empId);
	}
	
	// 4_3. 결재선 즐겨찾기 리스트 선택시 결재라인 조회
	@Override
	public ArrayList<FrequentApprovalLine> selectLineDetail(FrequentApprovalLine f) {
		return raDao.selectLineDetail(sqlSession, f);
	}

	// 4_4. 결재선 즐겨찾기 삭제
	@Override
	public int deleteLine(FrequentApprovalLine f) {
		return raDao.deleteLine(sqlSession, f);
	}

	


	// 5. 결재대기함, 결재진행함, 결재완료함, 반려문서함, 회수요청함, 결재회수함 연결
	/*
	@Override
	public ArrayList<Document> selectDocList(int approveStatus) {
		return raDao.selectDocList(sqlSession, approveStatus);
	}
	*/
	
	
}

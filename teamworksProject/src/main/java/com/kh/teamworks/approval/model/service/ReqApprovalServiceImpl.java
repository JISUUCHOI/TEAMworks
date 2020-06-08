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
import com.kh.teamworks.common.model.vo.PageInfo;
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

	// 4_2. 결재선 즐겨찾기 리스트 조회
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
	
	// 5_1. 게시판 총개수 조회
	@Override
	public int selectListCount(Document d) {
		return raDao.selectListCount(sqlSession, d);
	}

	// 5_2. 결재대기함, 결재진행함, 결재완료함, 반려문서함, 회수요청함, 결재회수함 - 문서 리스트 조회
	@Override
	public ArrayList<Document> selectDocList(Document d, PageInfo pi) {
		return raDao.selectDocList(sqlSession, d, pi);
	}

	// 6_1. '진행' 상태인 결재자 id 조회
	@Override
	public String selectApId(Document doc) {
		return raDao.selectApId(sqlSession, doc);
	}
	
	// 6_2. 결재 코멘트 개수 조회
	@Override
	public int selectComment(Document doc) {
		return raDao.selectComment(sqlSession, doc);
	}
	
	// 6_3. 해당 아이디 문서별 approveStatus 조회
	@Override
	public int selectApStatus(Document doc) {
		return raDao.selectApStatus(sqlSession, doc);
	}
	
	// 6_4. 문서 상세조회 - 경조비신청서
	@Override
	public ArrayList<Document> selectFeDetail(Document doc) {
		return raDao.selectFeDetail(sqlSession, doc);
	}

	// 6_5. 문서 상세조회 - 휴가신청서
	@Override
	public ArrayList<Document> selectVacDetail(Document doc) {
		return raDao.selectVacDetail(sqlSession, doc);
	}

	// 7_1. 첫번째 승인권자 승인/반려, 결재의견 insert
	@Override
	public int updateApprove(Document doc) {
		return raDao.updateApprove(sqlSession, doc);
	}

	// 7_2. 다음 승인권자 상태 update
	@Override
	public int updateLine(Document doc) {
		return raDao.updateLine(sqlSession, doc);
	}



	

	

	



	
	
	
}

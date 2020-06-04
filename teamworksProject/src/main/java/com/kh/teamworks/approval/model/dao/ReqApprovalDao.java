package com.kh.teamworks.approval.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.teamworks.approval.model.vo.ApproveLine;
import com.kh.teamworks.approval.model.vo.ApproveSearchCondition;
import com.kh.teamworks.approval.model.vo.Document;
import com.kh.teamworks.approval.model.vo.FrequentApprovalLine;
import com.kh.teamworks.employee.model.vo.Employee;

@Repository("raDao")
public class ReqApprovalDao {

	// 1_1. 문서 작성 전, 화면에 보여 줄 기본 사원정보(사원명, 소속부서명) select
	public Employee selectEmpInfo(SqlSessionTemplate sqlSession, String empId) {
		return sqlSession.selectOne("approveMapper.selectEmpInfo", empId);
	}
	
	// 1_2. 결재선/참조자 조직도 부서 select용
	public ArrayList<Employee> selectDeptName(SqlSessionTemplate sqlSession){
		return (ArrayList)sqlSession.selectList("approveMapper.selectDeptName");
	}
	
	// 1_3. 결재선/참조자 조직도 사원 select용
	public ArrayList<Employee> selectOrgChart(SqlSessionTemplate sqlSession) {
		return (ArrayList)sqlSession.selectList("approveMapper.selectOrgChart");
	}

	// 2. 결재선/참조자 사원 검색 select
	public ArrayList<Employee> selectEmpSch(SqlSessionTemplate sqlSession, ApproveSearchCondition sc) {
		return (ArrayList)sqlSession.selectList("approveMapper.selectEmpSch", sc);
	}
	
	// 3_1. 경조비신청서 insert
	public int insertFamilyEvent(SqlSessionTemplate sqlSession, Document d) {
		return sqlSession.insert("approveMapper.insertFamilyEvent", d);
	}
	
	// 3_2. 휴가신청서 insert
	public int insertVacation(SqlSessionTemplate sqlSession, Document d) {
		return sqlSession.insert("approveMapper.insertVacation", d);
	}
	
	// 3_3. 결재선 insert
	public int insertApproveLine(SqlSessionTemplate sqlSession, ApproveLine l) {
		return sqlSession.insert("approveMapper.insertApproveLine", l);
	}
	
	// 4_0. 결재선 즐겨찾기 추가 전, 같은 이름 있는지 확인
	public int selectLineName(SqlSessionTemplate sqlSession, FrequentApprovalLine f) {
		return sqlSession.selectOne("approveMapper.selectLineName", f);
	}
	
	// 4_1. 결재선 즐겨찾기 추가
	public int insertFreLine(SqlSessionTemplate sqlSession, FrequentApprovalLine fal) {
		return sqlSession.insert("approveMapper.insertFreLine", fal);
	}
	
	// 4_2. 결재선 즐겨찾기 리스트 개수 조회
	public ArrayList<FrequentApprovalLine> selectFreLine(SqlSessionTemplate sqlSession, String empId) {
		return (ArrayList)sqlSession.selectList("approveMapper.selectFreLine", empId);
	}

	// 4_3. 결재선 즐겨찾기 리스트 선택시 결재라인 조회
	public ArrayList<FrequentApprovalLine> selectLineDetail(SqlSessionTemplate sqlSession, FrequentApprovalLine f) {
		return (ArrayList)sqlSession.selectList("approveMapper.selectLineDetail", f);
	}
	
	// 4_4. 결재선 즐겨찾기 삭제
	public int deleteLine(SqlSessionTemplate sqlSession, FrequentApprovalLine f) {
		return sqlSession.delete("approveMapper.deleteLine", f);
	}
	
	
	
	
	// 5. 결재대기함, 결재진행함, 결재완료함, 반려문서함, 회수요청함, 결재회수함 연결
	/*
	public ArrayList<Document> selectDocList(SqlSessionTemplate sqlSession, int approveStatus) {
		return sqlSession.selectList("approveMapper.selectDocList", approveStatus);
	}
	*/
}

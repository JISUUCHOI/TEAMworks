package com.kh.teamworks.approval.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.teamworks.approval.model.vo.ApproveLine;
import com.kh.teamworks.approval.model.vo.ApproveSearchCondition;
import com.kh.teamworks.approval.model.vo.Document;
import com.kh.teamworks.approval.model.vo.DocumentList;
import com.kh.teamworks.common.model.vo.PageInfo;
import com.kh.teamworks.employee.model.vo.Employee;

@Repository("aDao")
public class ApprovalDao {
	
	// 1_1. 문서 작성 전, 화면에 보여 줄 기본 사원정보(사원명, 소속부서명) select
	public Employee selectEmpInfo(SqlSessionTemplate sqlSession, String empId) {
		return sqlSession.selectOne("documentMapper.selectEmpInfo", empId);
	}
	
	// 1_2. 참조자 조직도 부서 select용
	public ArrayList<Employee> selectDeptName(SqlSessionTemplate sqlSession){
		return (ArrayList)sqlSession.selectList("documentMapper.selectDeptName");
	}
	
	// 1_3. 참조자 조직도 사원 select용
	public ArrayList<Employee> selectOrgChart(SqlSessionTemplate sqlSession) {
		return (ArrayList)sqlSession.selectList("documentMapper.selectOrgChart");
	}

	// 2. 결재선/참조자 사원 검색 select
	public ArrayList<Employee> selectEmpSch(SqlSessionTemplate sqlSession, ApproveSearchCondition sc) {
		return (ArrayList)sqlSession.selectList("documentMapper.selectEmpSch", sc);
	}

	// 제증명신청서 insert
	public int insertProof(SqlSessionTemplate sqlSession, Document d) {
		return sqlSession.insert("documentMapper.insertProof", d);
	}
	
	// 기안서 insert
	public int insertDraft(SqlSessionTemplate sqlSession, Document d) {
		return sqlSession.insert("documentMapper.insertDraft", d);
	}
	
	// 결재선 insert
	public int insertApproveLine(SqlSessionTemplate sqlSession, ApproveLine l) {
		return sqlSession.insert("approveMapper.insertApproveLine", l);
	}

	// list 갯수
	// public int docListCount(SqlSessionTemplate sqlSession, Document d) {
		// return sqlSession.selectOne("documentMapper.docListCount", d);
	// }
	
	// 결재요청함 list
	public ArrayList<Document> docList(SqlSessionTemplate sqlSession, Document d) {
		return (ArrayList)sqlSession.selectList("documentMapper.docList", d);
	}
	
	// 참조문서함 list
	public ArrayList<Document> referenceList(SqlSessionTemplate sqlSession, Document d) {
		return (ArrayList)sqlSession.selectList("documentMapper.referenceList", d);
	}

	// 상세조회 - 결재 코멘트 개수 조회
	public int selectComment(SqlSessionTemplate sqlSession, Document doc) {
		return sqlSession.selectOne("approveMapper.selectComment", doc);
	}
	
	// 상세조회 기안서
	public ArrayList<Document> draftDetail(SqlSessionTemplate sqlSession, Document d) {
		return (ArrayList)sqlSession.selectList("documentMapper.draftDetail", d);
	}
	
	// 상세조회 제증명
	public ArrayList<Document> proofDetail(SqlSessionTemplate sqlSession, Document d) {
		return (ArrayList)sqlSession.selectList("documentMapper.proofDetail", d);	}
	
	// 상세조회 경조비
	public ArrayList<Document> familyEventDetail(SqlSessionTemplate sqlSession, Document d) {
		return (ArrayList)sqlSession.selectList("documentMapper.familyEventDetail", d);
	}
	
	// 상세조회 휴가신청서
	public ArrayList<Document> vacationDetail(SqlSessionTemplate sqlSession, Document d) {
		return (ArrayList)sqlSession.selectList("documentMapper.vacationDetail", d);
	}

	// 제증명 삭제
	public int deleteProof(SqlSessionTemplate sqlSession, String dno) {
		return sqlSession.delete("documentMapper.deleteProof", dno);
	}

	// 기안서 삭제
	public int deleteDraft(SqlSessionTemplate sqlSession, String dno) {
		return sqlSession.delete("documentMapper.deleteDraft",dno);
	}

	// 경조비 삭제
	public int deletefamilyEvent(SqlSessionTemplate sqlSession, String dno) {
		return sqlSession.delete("documentMapper.deletefamilyEvent",dno);	}

	// 휴가신청서 삭제
	public int deleteVacation(SqlSessionTemplate sqlSession, String dno) {
		return sqlSession.delete("documentMapper.deleteVacation",dno);	}

	// 기안서 수정폼
	public Document updateDraftForm(SqlSessionTemplate sqlSession, String dno) {
		return sqlSession.selectOne("documentMapper.updateDraftForm", dno);
	}

	// 제증명 수정폼
	public Document updateProofForm(SqlSessionTemplate sqlSession, String dno) {
		return sqlSession.selectOne("documentMapper.updateProofForm", dno);

	}

	// 경조비 수정폼
	public Document updateFamilyEventForm(SqlSessionTemplate sqlSession, String dno) {
		return sqlSession.selectOne("documentMapper.updateFamilyEventForm", dno);

	}

	// 휴가 수정폼
	public Document updateVacationForm(SqlSessionTemplate sqlSession, String dno) {
		return sqlSession.selectOne("documentMapper.updateVacationForm", dno);

	}

	// 기안서작성 list
	public ArrayList<Document> writeDocList(SqlSessionTemplate sqlSession, Document d) {
		return (ArrayList)sqlSession.selectList("documentMapper.writeDocList", d);
	}

	public int docLikeInsert(SqlSessionTemplate sqlSession) {
		return sqlSession.update("documentMapper.docLikeInsert");
	}

	public int updateHate(SqlSessionTemplate sqlSession, DocumentList l) {
		return sqlSession.update("documentMapper.updateHate", l);
	}

	public int updateLike(SqlSessionTemplate sqlSession, DocumentList l) {
		return sqlSession.update("documentMapper.updateLike", l);
	}

	public ArrayList<Document> selectDocList(SqlSessionTemplate sqlSession, DocumentList l) {
		return (ArrayList)sqlSession.selectList("documentMapper.selectDocList", l);
	}




}



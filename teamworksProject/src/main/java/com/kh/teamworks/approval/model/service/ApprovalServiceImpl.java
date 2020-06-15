package com.kh.teamworks.approval.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.teamworks.approval.model.dao.ApprovalDao;
import com.kh.teamworks.approval.model.vo.ApproveLine;
import com.kh.teamworks.approval.model.vo.ApproveSearchCondition;
import com.kh.teamworks.approval.model.vo.Document;
import com.kh.teamworks.approval.model.vo.DocumentList;
import com.kh.teamworks.common.model.vo.PageInfo;
import com.kh.teamworks.employee.model.vo.Employee;

@Service("aService")
public class ApprovalServiceImpl implements ApprovalService {
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	@Autowired
	private ApprovalDao aDao;
	
	// 1_1. 문서 작성 전, 화면에 보여 줄 기본 사원정보(사원명, 소속부서명) select
	@Override
	public Employee selectEmpInfo(String empId) {
		return aDao.selectEmpInfo(sqlSession, empId);
	}

	// 1_2. 참조자 조직도 부서 select용
	@Override
	public ArrayList<Employee> selectDeptName() {
		return aDao.selectDeptName(sqlSession);
	}

	// 1_3. 참조자 조직도 사원 select용
	@Override
	public ArrayList<Employee> selectOrgChart() {
		return aDao.selectOrgChart(sqlSession);
	}

	// 2. 결재선/참조자 사원 검색 select
	@Override
	public ArrayList<Employee> selectEmpSch(ApproveSearchCondition sc) {
		return aDao.selectEmpSch(sqlSession, sc);
	}

	// 제증명 insert
	@Override
	public int insertProof(Document d) {
		return aDao.insertProof(sqlSession, d);
	}
	
	// 기안서 insert
	@Override
	public int insertDraft(Document d) {
		return aDao.insertDraft(sqlSession, d);
	}

	// 결재선 insert
	@Override
	public int insertApproveLine(ApproveLine l) {
		return aDao.insertApproveLine(sqlSession, l);
	}
	
	// list 갯수
	//@Override
	//public int docListCount(Document d) {
		//return aDao.docListCount(sqlSession, d);
	//}

	// 결재요청함 list
	@Override
	public ArrayList<Document> docList(Document d) {
		return aDao.docList(sqlSession, d);	
	}
	
	// 참조문서함 list
	@Override
	public ArrayList<Document> referenceList(Document d) {
		return aDao.referenceList(sqlSession, d);	

	}
	
	// 상세조회 - 결재 코멘트 개수 조회
	@Override
	public int selectComment(Document d) {
		return aDao.selectComment(sqlSession, d);
	}

	// 상세조회 기안서
	@Override
	public ArrayList<Document> draftDetail(Document d) {
		return aDao.draftDetail(sqlSession, d);
	}
	
	// 상세조회 제증명신청서
	@Override
	public ArrayList<Document> proofDetail(Document d) {
		return aDao.proofDetail(sqlSession, d);
	}
	
	// 상세조회 경조비신청서
	@Override
	public ArrayList<Document> familyEventDetail(Document d) {
		return aDao.familyEventDetail(sqlSession, d);
	}
	
	// 상세조회 휴가신청서
	@Override
	public ArrayList<Document> vacationDetail(Document d) {
		return aDao.vacationDetail(sqlSession, d);
	}


	// 제증명 삭제
	@Override
	public int deleteProof(String dno) {
		return aDao.deleteProof(sqlSession, dno);
	}

	// 기안서 삭제
	@Override
	public int deleteDraft(String dno) {
		return aDao.deleteDraft(sqlSession, dno);
	}

	// 경조비 삭제
	@Override
	public int deletefamilyEvent(String dno) {
		return aDao.deletefamilyEvent(sqlSession, dno);
	}

	// 휴가신청서 삭제
	@Override
	public int deleteVacation(String dno) {
		return aDao.deleteVacation(sqlSession, dno);
	}

	// 기안서 수정폼
	@Override
	public Document updateDraftForm(String dno) {
		return aDao.updateDraftForm(sqlSession, dno);
	}

	// 제증명 수정폼
	@Override
	public Document updateProofForm(String dno) {
		return aDao.updateProofForm(sqlSession, dno);

	}

	// 경조비 수정폼
	@Override
	public Document updateFamilyEventForm(String dno) {
		return aDao.updateFamilyEventForm(sqlSession, dno);

	}

	// 휴가 수정폼
	@Override
	public Document updateVacationForm(String dno) {
		return aDao.updateVacationForm(sqlSession, dno);

	}

	// 기안문작성 list
	@Override
	public ArrayList<Document> writeDocList(Document d) {
		return aDao.writeDocList(sqlSession, d);		
	}

	@Override
	public int updateHate(DocumentList d) {
		return aDao.updateHate(sqlSession, d);
	}

	@Override
	public int updateLike(DocumentList d) {
		return aDao.updateLike(sqlSession, d);
	}






}


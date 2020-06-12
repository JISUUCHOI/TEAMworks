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
	
	// 4_1. 결재선 즐겨찾기 추가 전, 같은 이름 있는지 확인
	@Override
	public int selectLineName(FrequentApprovalLine f) {
		return raDao.selectLineName(sqlSession, f);
	}

	// 4_2. 결재선 즐겨찾기 추가
	@Override
	public int insertFreLine(FrequentApprovalLine fal) {
		return raDao.insertFreLine(sqlSession, fal);
	}

	// 4_3. 결재선 즐겨찾기 리스트 조회
	@Override
	public ArrayList<FrequentApprovalLine> selectFreLine(String empId) {
		return raDao.selectFreLine(sqlSession, empId);
	}
	
	// 4_4. 결재선 즐겨찾기 리스트 선택시 결재라인 조회
	@Override
	public ArrayList<FrequentApprovalLine> selectLineDetail(FrequentApprovalLine f) {
		return raDao.selectLineDetail(sqlSession, f);
	}

	// 4_5. 결재선 즐겨찾기 삭제
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

	// 5_3. 검색 결과에 해당하는 게시글 개수 조회
	@Override
	public int searchListCount(ApproveSearchCondition asc) {
		return raDao.searchListCount(sqlSession, asc);
	}

	// 5_4. 검색 결과에 해당하는 게시글 리스트 조회
	@Override
	public ArrayList<Document> searchDocList(ApproveSearchCondition asc, PageInfo pi) {
		return raDao.searchDocList(sqlSession, asc, pi);
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
	
	// 6_6. 문서 상세조회 - 기안서
	public ArrayList<Document> selectDraftDetail(Document doc) {
		return raDao.selectDraftDetail(sqlSession, doc);
	}
	
	// 6_7. 문서 상세조회 - 제증명신청서
	public ArrayList<Document> selectProofDetail(Document doc) {
		return raDao.selectProofDetail(sqlSession, doc);
	}
	 
	// 7_1. 미결, 진행 결재선 id 조회
	@Override
	public ArrayList<Document> selectApList(Document doc) {
		return raDao.selectApList(sqlSession, doc);
	}

	// 7_2. 첫번째 승인권자 승인/반려, 결재의견 insert
	@Override
	public int updateApprove(Document doc) {
		return raDao.updateApprove(sqlSession, doc);
	}

	// 7_3. 기안자 상태 doc_status '진행'로 update
	@Override
	public int updateDocStatus(Document doc) {
		return raDao.updateDocStatus(sqlSession, doc);
	}
	
	// 7_4. 다음 승인권자 상태 update
	@Override
	public int updateLine(Document doc) {
		return raDao.updateLine(sqlSession, doc);
	}

	// 7_5. 마지막 승인권자 상태 update -> 완료함
	@Override
	public int updateComplete(Document doc) {
		return raDao.updateComplete(sqlSession, doc);
	}

	// 7_6. 이전 승인권자들 id 조회
	@Override
	public ArrayList<Document> selectAllList(Document doc) {
		return raDao.selectAllList(sqlSession, doc);
	}

	// 7_7. 이전 승인권자들 상태 '완료'로 update
	@Override
	public int updateAllComplete(Document d) {
		return raDao.updateAllComplete(sqlSession, d);
	}
	
	// 7_8. 기안자 상태 doc_status '완료'로 update
	@Override
	public int updateDs(Document d) {
		return raDao.updateDs(sqlSession, d);
	}

	// 7_9. 현재 진행중인 승인권자가 반려할 경우
	@Override
	public int updateReject(Document doc) {
		return raDao.updateReject(sqlSession, doc);
	}

	// 7_10. 나머지 승인권자들 상태 '반려'로 update
	@Override
	public int updateAllReject(Document d) {
		return raDao.updateAllReject(sqlSession, d);
	}

	// 7_11. 기안자 상태 doc_status '반려'로 update
	@Override
	public int updateDsReject(Document doc) {
		return raDao.updateDsReject(sqlSession, doc);
	}
	
	// 8_1. 참조문서함 문서 개수 조회
	public int selectRefCount(Document d) {
		return raDao.selectRefCount(sqlSession, d);
	}
	
	// 8_2. 참조문서 리스트 조회
	@Override
	public ArrayList<Document> selectRefList(Document d, PageInfo pi) {
		return raDao.selectRefList(sqlSession, d, pi);
	}
	
	// 8_3. 검색 결과에 해당하는 참조문서 개수 조회
	@Override
	public int searchRefCount(ApproveSearchCondition asc) {
		return raDao.searchRefCount(sqlSession, asc);
	}

	// 8_4. 검색 결과에 해당하는 참조문서 리스트 조회
	public ArrayList<Document> searchRefList(ApproveSearchCondition asc, PageInfo pi) {
		return raDao.searchRefList(sqlSession, asc, pi);
	}

	// 9_1. 결재요청함 총 문서개수 조회
	@Override
	public int selectMyDocCount(Document d) {
		return raDao.selectMyDocCount(sqlSession, d);
	}

	// 9_2. 결재요청함 리스트 조회
	@Override
	public ArrayList<Document> selectMyDocList(Document d, PageInfo pi) {
		return raDao.selectMyDocList(sqlSession, d, pi);
	}
	
	// 9_3. 검색 결과에 해당하는 참조문서 개수 조회
	@Override
	public int searchMyDocCount(ApproveSearchCondition asc) {
		return raDao.searchMyDocCount(sqlSession, asc);
	}

	// 9_4. 검색 결과에 해당하는 참조문서 리스트 조회 
	@Override
	public ArrayList<Document> searchMyDocList(ApproveSearchCondition asc, PageInfo pi) {
		return raDao.searchMyDocList(sqlSession, asc, pi);
	}
	
	
	// 10. sidebar 보관함별 문서개수 count
	@Override
	public int countStand(Document d) {
		return raDao.countStand(sqlSession, d);
	}

	@Override
	public int countPending(Document d) {
		return raDao.countPending(sqlSession, d);
	}

	@Override
	public int countComplete(Document d) {
		return raDao.countComplete(sqlSession, d);
	}

	@Override
	public int countRefuse(Document d) {
		return raDao.countRefuse(sqlSession, d);
	}

	@Override
	public int countCallback(Document d) {
		return raDao.countCallback(sqlSession, d);
	}

	

	
	
	
}

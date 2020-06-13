package com.kh.teamworks.approval.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.teamworks.approval.model.vo.ApproveLine;
import com.kh.teamworks.approval.model.vo.ApproveSearchCondition;
import com.kh.teamworks.approval.model.vo.Document;
import com.kh.teamworks.approval.model.vo.FrequentApprovalLine;
import com.kh.teamworks.common.model.vo.PageInfo;
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
	
	// 4_1. 결재선 즐겨찾기 추가 전, 같은 이름 있는지 확인
	public int selectLineName(SqlSessionTemplate sqlSession, FrequentApprovalLine f) {
		return sqlSession.selectOne("approveMapper.selectLineName", f);
	}
	
	// 4_2. 결재선 즐겨찾기 추가
	public int insertFreLine(SqlSessionTemplate sqlSession, FrequentApprovalLine fal) {
		return sqlSession.insert("approveMapper.insertFreLine", fal);
	}
	
	// 4_3. 결재선 즐겨찾기 리스트 조회
	public ArrayList<FrequentApprovalLine> selectFreLine(SqlSessionTemplate sqlSession, String empId) {
		return (ArrayList)sqlSession.selectList("approveMapper.selectFreLine", empId);
	}

	// 4_4. 결재선 즐겨찾기 리스트 선택시 결재라인 조회
	public ArrayList<FrequentApprovalLine> selectLineDetail(SqlSessionTemplate sqlSession, FrequentApprovalLine f) {
		return (ArrayList)sqlSession.selectList("approveMapper.selectLineDetail", f);
	}
	
	// 4_5. 결재선 즐겨찾기 삭제
	public int deleteLine(SqlSessionTemplate sqlSession, FrequentApprovalLine f) {
		return sqlSession.delete("approveMapper.deleteLine", f);
	}
	
	// 5_1. 게시글 총개수 조회
	public int selectListCount(SqlSessionTemplate sqlSession, Document d) {
		return sqlSession.selectOne("approveMapper.selectListCount", d);
	}
	
	// 5_2. 결재대기함, 결재진행함, 결재완료함, 반려문서함, 회수요청함, 결재회수함 - 문서 리스트 조회
	public ArrayList<Document> selectDocList(SqlSessionTemplate sqlSession, Document d, PageInfo pi) {
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		return (ArrayList)sqlSession.selectList("approveMapper.selectDocList", d, rowBounds);
	}
	
	// 5_3. 검색 결과에 해당하는 게시글 개수 조회
	public int searchListCount(SqlSessionTemplate sqlSession, ApproveSearchCondition asc) {
		return sqlSession.selectOne("approveMapper.searchListCount", asc);
	}
	
	// 5_4. 검색 결과에 해당하는 게시글 리스트 조회
	public ArrayList<Document> searchDocList(SqlSessionTemplate sqlSession, ApproveSearchCondition asc, PageInfo pi) {
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		return (ArrayList)sqlSession.selectList("approveMapper.searchDocList", asc, rowBounds);
	}
	
	// 6_1. '진행' 상태인 결재자 id 조회
	public String selectApId(SqlSessionTemplate sqlSession, Document doc) {
		return sqlSession.selectOne("approveMapper.selectApId", doc);
	}
	
	// 6_2. '회수요청' 들어온 상태인 결재자 id 조회 --> 회수승인 버튼 클릭
	public String selectCbId(SqlSessionTemplate sqlSession, Document doc) {
		return sqlSession.selectOne("approveMapper.selectCbId", doc);
	}
	
	// 6_3. 결재 코멘트 개수 조회
	public int selectComment(SqlSessionTemplate sqlSession, Document doc) {
		return sqlSession.selectOne("approveMapper.selectComment", doc);
	}
	
	// 6_4. 해당 아이디 문서별 approveStatus 조회
	public int selectApStatus(SqlSessionTemplate sqlSession, Document doc) {
		return sqlSession.selectOne("approveMapper.selectApStatus", doc);
	}
	
	// 6_5. 문서 상세조회 - 경조비신청서
	public ArrayList<Document> selectFeDetail(SqlSessionTemplate sqlSession, Document doc) {
		return (ArrayList)sqlSession.selectList("approveMapper.selectFeDetail", doc);
	}
	
	// 6_6. 문서 상세조회 - 휴가신청서
	public ArrayList<Document> selectVacDetail(SqlSessionTemplate sqlSession, Document doc) {
		return (ArrayList)sqlSession.selectList("approveMapper.selectVacDetail", doc);
	}
	
	// 6_7. 문서 상세조회 - 기안서
	public ArrayList<Document> selectDraftDetail(SqlSessionTemplate sqlSession, Document doc) {
		return (ArrayList)sqlSession.selectList("approveMapper.selectDraftDetail", doc);
	}
	
	// 6_8. 문서 상세조회 - 제증명신청서
	public ArrayList<Document> selectProofDetail(SqlSessionTemplate sqlSession, Document doc) {
		return (ArrayList)sqlSession.selectList("approveMapper.selectProofDetail", doc);
	}
	
	// 7_1. 미결, 진행 결재선 id 조회
	public ArrayList<Document> selectApList(SqlSessionTemplate sqlSession, Document doc) {
		return (ArrayList)sqlSession.selectList("approveMapper.selectApList", doc);
	}
	
	// 7_2. 첫번째 승인권자 승인/반려, 결재의견 insert
	public int updateApprove(SqlSessionTemplate sqlSession, Document doc) {
		return sqlSession.update("approveMapper.updateApprove", doc);
	}
	
	// 7_3. 기안자 상태 doc_status '진행'로 update
	public int updateDocStatus(SqlSessionTemplate sqlSession, Document doc) {
		return sqlSession.update("approveMapper.updateDocStatus", doc);
	}
	
	// 7_4. 다음 승인권자 상태 update
	public int updateLine(SqlSessionTemplate sqlSession, Document doc) {
		return sqlSession.update("approveMapper.updateLine", doc);
	}
	
	// 7_5. 마지막 승인권자 상태 update -> 완료함
	public int updateComplete(SqlSessionTemplate sqlSession, Document doc) {
		return sqlSession.update("approveMapper.updateComplete", doc);
	}
	
	// 7_6. 이전 승인권자들 id 조회
	public ArrayList<Document> selectAllList(SqlSessionTemplate sqlSession, Document doc) {
		return (ArrayList)sqlSession.selectList("approveMapper.selectAllList", doc);
	}
	
	// 7_7. 이전 승인권자들 상태 '완료'로 update
	public int updateAllComplete(SqlSessionTemplate sqlSession, Document d) {
		return sqlSession.update("approveMapper.updateAllComplete", d);
	}
	
	// 7_8. 기안자 상태 doc_status '완료'로 update
	public int updateDs(SqlSessionTemplate sqlSession, Document d) {
		return sqlSession.update("approveMapper.updateDs", d);
	}
	
	
	// 7_9. 현재 진행중인 승인권자가 반려할 경우
	public int updateReject(SqlSessionTemplate sqlSession, Document doc) {
		return sqlSession.update("approveMapper.updateReject", doc);
	}
	
	// 7_10. 나머지 승인권자들 상태 '반려'로 update
	public int updateAllReject(SqlSessionTemplate sqlSession, Document d) {
		return sqlSession.update("approveMapper.updateAllReject", d);
	}
	
	// 7_11. 기안자 상태 doc_status '반려'로 update
	public int updateDsReject(SqlSessionTemplate sqlSession, Document doc) {
		return sqlSession.update("approveMapper.updateDsReject", doc);
	}
	
	
	// 8_1. 참조문서함 문서 개수 조회
	public int selectRefCount(SqlSessionTemplate sqlSession, Document d) {
		return sqlSession.selectOne("approveMapper.selectRefCount", d);
	}
	
	// 8_2. 참조문서 리스트 조회
	public ArrayList<Document> selectRefList(SqlSessionTemplate sqlSession, Document d, PageInfo pi) {
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		return (ArrayList)sqlSession.selectList("approveMapper.selectRefList", d, rowBounds);
	}
	
	// 8_3. 검색 결과에 해당하는 참조문서 개수 조회
	public int searchRefCount(SqlSessionTemplate sqlSession, ApproveSearchCondition asc) {
		return sqlSession.selectOne("approveMapper.searchRefCount", asc);
	}
	
	// 8_4. 검색 결과에 해당하는 참조문서 리스트 조회
	public ArrayList<Document> searchRefList(SqlSessionTemplate sqlSession, ApproveSearchCondition asc, PageInfo pi) {
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		return (ArrayList)sqlSession.selectList("approveMapper.searchRefList", asc, rowBounds);
	}
	
	// 9_1. 결재요청함 총 문서개수 조회
	public int selectMyDocCount(SqlSessionTemplate sqlSession, Document d) {
		return sqlSession.selectOne("approveMapper.selectMyDocCount", d);
	}
	
	// 9_2. 결재요청함 리스트 조회
	public ArrayList<Document> selectMyDocList(SqlSessionTemplate sqlSession, Document d, PageInfo pi) {
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		return (ArrayList)sqlSession.selectList("approveMapper.selectMyDocList", d, rowBounds);
	}
	
	// 9_3. 검색 결과에 해당하는 참조문서 개수 조회
	public int searchMyDocCount(SqlSessionTemplate sqlSession, ApproveSearchCondition asc) {
		return sqlSession.selectOne("approveMapper.searchMyDocCount", asc);
	}
	
	// 9_4. 검색 결과에 해당하는 참조문서 리스트 조회
	public ArrayList<Document> searchMyDocList(SqlSessionTemplate sqlSession, ApproveSearchCondition asc, PageInfo pi) {
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		return (ArrayList)sqlSession.selectList("approveMapper.searchMyDocList", asc, rowBounds);
	}
	
	// 10. sidebar 보관함별 문서개수 count
	public int countStand(SqlSessionTemplate sqlSession, Document d) {
		return sqlSession.selectOne("approveMapper.countStand", d);
	}
	public int countPending(SqlSessionTemplate sqlSession, Document d) {
		return sqlSession.selectOne("approveMapper.countPending", d);
	}
	public int countComplete(SqlSessionTemplate sqlSession, Document d) {
		return sqlSession.selectOne("approveMapper.countComplete", d);
	}
	public int countRefuse(SqlSessionTemplate sqlSession, Document d) {
		return sqlSession.selectOne("approveMapper.countRefuse", d);
	}
	public int countCallback(SqlSessionTemplate sqlSession, Document d) {
		return sqlSession.selectOne("approveMapper.countCallback", d);
	}
	
	// 11_1. '진행'중인 결재권자에게 회수요청
	public int requestCallback(SqlSessionTemplate sqlSession, Document d) {
		return sqlSession.update("approveMapper.requestCallback",d);
	}
	
	// 11_2. 기안자 doc_status 4.회수요청으로 변경
	public int updateDocSt(SqlSessionTemplate sqlSession, Document d) {
		return sqlSession.update("approveMapper.updateDocSt", d);
	}
	
	// 12_1. 결재자 - 회수 승인
	public int permitCallback(SqlSessionTemplate sqlSession, Document d) {
		return sqlSession.update("approveMapper.permitCallback", d);
	}
	
	// 12_2. 기안자 - 상태 회수
	public int statusCallback(SqlSessionTemplate sqlSession, Document d) {
		return sqlSession.update("approveMapper.statusCallback", d);
	}
	
	// 12_3. 결재자 - 회수 거절
	public int refuseCallback(SqlSessionTemplate sqlSession, Document d) {
		return sqlSession.update("approveMapper.refuseCallback", d);
	}
	
	// 13_1. 문서 총 개수 조회
	public int selectCallbackCount(SqlSessionTemplate sqlSession, Document d) {
		return sqlSession.selectOne("approveMapper.selectCallbackCount", d);
	}
	
	// 13_2. 문서 리스트 조회
	public ArrayList<Document> selectCallbackList(SqlSessionTemplate sqlSession, Document d, PageInfo pi) {
		return (ArrayList)sqlSession.selectList("approveMapper.selectCallbackList", d);
	}
	
}

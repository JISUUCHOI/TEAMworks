package com.kh.teamworks.management.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.teamworks.common.model.vo.PageInfo;
import com.kh.teamworks.employee.model.vo.Employee;
import com.kh.teamworks.management.model.vo.CompanyBsns;
import com.kh.teamworks.management.model.vo.CompanyInfo;
import com.kh.teamworks.management.model.vo.Department;
import com.kh.teamworks.management.model.vo.Job;
import com.kh.teamworks.management.model.vo.Vacation;
import com.kh.teamworks.management.model.vo.empSearchCondition;

@Repository("mgDao")
public class ManagementDao {
	
	public ArrayList<Job> selectJobList(SqlSessionTemplate sqlSession){
		return (ArrayList)sqlSession.selectList("managementMapper.selectJobList");
	}
	
	public CompanyInfo selectCompanyInfo(SqlSessionTemplate sqlSession, String homNo) {
		return sqlSession.selectOne("managementMapper.selectCompanyInfo", homNo);
	}

	public CompanyBsns selectCompanyBsns(SqlSessionTemplate sqlSession, String homNo) {
		return sqlSession.selectOne("managementMapper.selectCompanyBsns", homNo);
	}

	public int insertEmployee(SqlSessionTemplate sqlSession, Employee e) {
		return sqlSession.insert("managementMapper.insertEmployee", e);
	}

	public int idCheck(SqlSessionTemplate sqlSession, String empId) {
		return sqlSession.selectOne("managementMapper.empIdCheck", empId);
	}
	
	public int selectEmpCount(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("managementMapper.selectEmpCount");
	}
	
	public ArrayList<Employee> selectEmpList(SqlSessionTemplate sqlSession) {
		return (ArrayList)sqlSession.selectList("managementMapper.selectEmpList");
	}
	
	public ArrayList<Employee> selectEmpList(SqlSessionTemplate sqlSession, PageInfo pi){
		int offset = (pi.getCurrentPage() -1 ) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		
		return (ArrayList)sqlSession.selectList("managementMapper.selectEmpList", null, rowBounds);
	}
	
	public int selectEmpCount(SqlSessionTemplate sqlSession, empSearchCondition eSc) {
		return sqlSession.selectOne("managementMapper.selectEmpKeywordCount", eSc);
	}
	
	public ArrayList<Employee> selectEmpListKeyword(SqlSessionTemplate sqlSession, empSearchCondition eSc, PageInfo pi){
		int offset = (pi.getCurrentPage() -1 ) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		
		return (ArrayList)sqlSession.selectList("managementMapper.selectEmpListKeyword", eSc, rowBounds);
	}
	
	public ArrayList<Employee> selectEmpList(SqlSessionTemplate sqlSession, int deptCode) {
		return (ArrayList)sqlSession.selectList("managementMapper.selectOrgEmpList", deptCode);
	}
	
	public ArrayList<Employee> selectEmpList(SqlSessionTemplate sqlSession, String keyword) {
		keyword = '%' + keyword + '%';
		return (ArrayList)sqlSession.selectList("managementMapper.selectSearchEmpList", keyword);
	}
	
	public ArrayList<Department> selectDeptList(SqlSessionTemplate sqlSession) {
		return (ArrayList)sqlSession.selectList("managementMapper.selectDeptList");
	}
	
	public int insertDept(SqlSessionTemplate sqlSession, String deptName) {
		return sqlSession.insert("managementMapper.insertDept", deptName);
	}
	
	public int updateDept(SqlSessionTemplate sqlSession, Department dept) {
		return sqlSession.update("managementMapper.updateDept", dept);
	}
	
	public int deleteDept(SqlSessionTemplate sqlSession, int deptCode) {
		return sqlSession.delete("managementMapper.deleteDept", deptCode);
	}

	
	
	
	public ArrayList<Vacation> selectVacationList(SqlSessionTemplate sqlSession, PageInfo pi) {
		int offset = (pi.getCurrentPage() -1 ) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		
		return(ArrayList)sqlSession.selectList("managementMapper.selectVacationList", null, rowBounds);
	}
	
	public ArrayList<Vacation> searchVacationList(SqlSessionTemplate sqlSession, String keyword, PageInfo pi) {
		int offset = (pi.getCurrentPage() -1 ) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		
		return (ArrayList)sqlSession.selectList("managementMapper.searchEmpVacation", keyword, rowBounds);
	}
	
	public int selectVacationCount(SqlSessionTemplate sqlSession, String keyword) {
		return sqlSession.selectOne("managementMapper.selectVacationCount", keyword);
	}

	public int updateLogo(SqlSessionTemplate sqlSession, CompanyInfo ci) {
		return sqlSession.update("managementMapper.updateLogo", ci);
	}
	

	// 직급관리_직급 순서 저장
	public int saveRank(SqlSessionTemplate sqlSession, Job job) {
		return sqlSession.update("managementMapper.saveRank", job);
	}
	
	// 직급관리_직급 추가
	public int insertJobCode(SqlSessionTemplate sqlSession, String jobName) {
		return sqlSession.insert("managementMapper.insertJobCode", jobName);
	}


}

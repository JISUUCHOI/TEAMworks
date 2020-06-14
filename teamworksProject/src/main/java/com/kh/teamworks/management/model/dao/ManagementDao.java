package com.kh.teamworks.management.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.teamworks.common.model.vo.PageInfo;
import com.kh.teamworks.employee.model.vo.Employee;
import com.kh.teamworks.management.model.vo.CompanyBsns;
import com.kh.teamworks.management.model.vo.CompanyInfo;
import com.kh.teamworks.management.model.vo.Department;
import com.kh.teamworks.management.model.vo.Job;
import com.kh.teamworks.management.model.vo.Proof;
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
		
		return (ArrayList)sqlSession.selectList("managementMapper.selectVacList", null, rowBounds);
	}

	public ArrayList<Vacation> selectVacationKeyword(SqlSessionTemplate sqlSession, empSearchCondition eSc, PageInfo pi) {
		int offset = (pi.getCurrentPage() -1 ) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		
		return (ArrayList)sqlSession.selectList("managementMapper.selectVacListKeyword", eSc, rowBounds);
	}
	
	public int selectVacationCount(SqlSessionTemplate sqlSession, empSearchCondition eSc) {
		return sqlSession.selectOne("managementMapper.selectVacCount", eSc);
	}

	public int updateLogo(SqlSessionTemplate sqlSession, CompanyInfo ci) {
		return sqlSession.update("managementMapper.updateLogo", ci);
	}

	public int updateSeal(SqlSessionTemplate sqlSession, CompanyBsns cb) {
		return sqlSession.update("managementMapper.updateSeal", cb);
	}

	public int updateStatus(SqlSessionTemplate sqlSession, String empId) {
		return sqlSession.update("managementMapper.updateStatus", empId);
	}

	public int updateCompanyBsns(SqlSessionTemplate sqlSession, CompanyBsns cb) {
		return sqlSession.update("managementMapper.updateCompanyBsns", cb);
	}



	// 증명서 발급
	public int selectProofListCount(SqlSession sqlSession) {
		return sqlSession.selectOne("managementMapper.selectProofListCount");
	}
	public ArrayList<Proof> selectProofList(SqlSession sqlSession, PageInfo pi){
		int offset = (pi.getCurrentPage() -1 ) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		return (ArrayList)sqlSession.selectList("managementMapper.selectProofList", null, rowBounds);
	}
	
	public Proof selectProof(SqlSession sqlSession,String docNo) {
		return sqlSession.selectOne("managementMapper.selectProof", docNo);
	}
	public int updatePfStatus(SqlSession sqlSession, String docNo) {
		return sqlSession.update("managementMapper.updatePfStatus", docNo);
	}






}

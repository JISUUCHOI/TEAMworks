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
	
	public int selectEmpKeywordCount(SqlSessionTemplate sqlSession,empSearchCondition sc) {
		return sqlSession.selectOne("managementMapper.selectEmpKeywordCount", sc);
	}
	
	public ArrayList<Employee> selectEmpListKeyword(SqlSessionTemplate sqlSession, empSearchCondition sc){
		
		return (ArrayList)sqlSession.selectList("managementMapper.selectEmpList", sc);
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


}

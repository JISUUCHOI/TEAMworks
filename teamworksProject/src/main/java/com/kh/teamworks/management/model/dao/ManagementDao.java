package com.kh.teamworks.management.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.teamworks.employee.model.vo.Employee;
import com.kh.teamworks.management.model.vo.CompanyBsns;
import com.kh.teamworks.management.model.vo.CompanyInfo;
import com.kh.teamworks.management.model.vo.Department;
import com.kh.teamworks.management.model.vo.Job;

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
	
	public ArrayList<Employee> selectEmpList(SqlSessionTemplate sqlSession){
		return (ArrayList)sqlSession.selectList("managementMapper.selectEmpList");
	}
	
	public ArrayList<Employee> selectEmpList(SqlSessionTemplate sqlSession, int deptCode) {
		return (ArrayList)sqlSession.selectList("managementMapper.selectOrgEmpList", deptCode);
	}
	
	public ArrayList<Department> selectDeptList(SqlSessionTemplate sqlSession) {
		return (ArrayList)sqlSession.selectList("managementMapper.selectDeptList");
	}
}

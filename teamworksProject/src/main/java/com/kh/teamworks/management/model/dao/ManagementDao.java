package com.kh.teamworks.management.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.teamworks.common.model.vo.PageInfo;
import com.kh.teamworks.employee.model.vo.Employee;
import com.kh.teamworks.management.model.vo.CompanyBsns;
import com.kh.teamworks.management.model.vo.CompanyInfo;
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
	
	public ArrayList<Employee> selectEmpList(SqlSessionTemplate sqlSession, PageInfo pi){
		int offset = (pi.getCurrentPage() -1 ) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		
		return (ArrayList)sqlSession.selectList("managementMapper.selectEmpList", null, rowBounds);
	}
	
	public int selectEmpCount(SqlSessionTemplate sqlSession, empSearchCondition sc) {
		return sqlSession.selectOne("managementMapper.selectEmpKeywordCount", sc);
	}
	
	public ArrayList<Employee> selectEmpListKeyword(SqlSessionTemplate sqlSession, empSearchCondition sc, PageInfo pi){
		int offset = (pi.getCurrentPage() -1 ) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		
		return (ArrayList)sqlSession.selectList("managementMapper.selectEmpList", sc, rowBounds);
	}


}

package com.kh.teamworks.employee.model.dao;

import org.apache.ibatis.session.SqlSession;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.teamworks.employee.model.vo.Attendance;
import com.kh.teamworks.employee.model.vo.Employee;

@Repository("eDao")
public class EmployeeDao {

	
	public Employee loginEmployee(SqlSession sqlSession, Employee e) {
		
		return sqlSession.selectOne("employeeMapper.loginEmployee", e);
	}
	
	
	public int insertProfile(SqlSession sqlSession, Employee e) {
		return sqlSession.update("employeeMapper.insertProfile", e);
	}
	
	public int myPageUpdateEmployee(SqlSession sqlSession, Employee e) {
		return sqlSession.update("employeeMapper.myPageUpdateEmployee", e);
	}
	
	public int myUpdatePwd(SqlSession sqlSession, Employee e) {
		return sqlSession.update("employeeMapper.myUpdatePwd", e);
	}


	public int attInsert(SqlSessionTemplate sqlSession, Attendance att) {
		
		return sqlSession.insert("employeeMapper.attInsert", att);
	}


	
}

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


	public Attendance selectAttTime(SqlSessionTemplate sqlSession, String empId) {
		
		return sqlSession.selectOne("employeeMapper.selectAttTime", empId);
	}


	public int attUpdate(SqlSessionTemplate sqlSession, Attendance att) {
		
		return sqlSession.update("employeeMapper.attUpdate", att);
	}
	public int insertDate(SqlSessionTemplate sqlSession, String empId) {
		// TODO Auto-generated method stub
		return sqlSession.insert("employeeMapper.insertDate", empId);
	}
	public Attendance selectAtt(SqlSessionTemplate sqlSession, String empId) {
		return sqlSession.selectOne("employeeMapper.selectAtt", empId);
	}


	public int QRattInsert(SqlSessionTemplate sqlSession, String empId) {
		// TODO Auto-generated method stub
		return sqlSession.insert("employeeMapper.QRattInsert", empId);
	}



}

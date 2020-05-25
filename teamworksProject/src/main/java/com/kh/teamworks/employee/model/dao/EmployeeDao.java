package com.kh.teamworks.employee.model.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.kh.teamworks.employee.model.vo.Employee;

@Repository("eDao")
public class EmployeeDao {

	
	public Employee loginEmployee(SqlSession sqlSession, Employee e) {
		
		return sqlSession.selectOne("employeeMapper.loginEmployee", e);
	}
}

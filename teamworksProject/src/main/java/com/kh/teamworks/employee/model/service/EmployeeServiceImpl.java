package com.kh.teamworks.employee.model.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.teamworks.employee.model.dao.EmployeeDao;
import com.kh.teamworks.employee.model.vo.Employee;

@Service("eService")
public class EmployeeServiceImpl implements EmployeeService{

	@Autowired
	private SqlSessionTemplate sqlSession;
	@Autowired
	private EmployeeDao eDao;
	
	@Override
	public Employee loginEmployee(Employee e) {
		return eDao.loginEmployee(sqlSession, e);
	}

	@Override
	public int myPageUpdateEmployee(Employee e) {
		return eDao.myPageUpdateEmployee(sqlSession,e);
	}

	@Override
	public int myUpdatePwd(Employee e) {
		return 0;
	}

	@Override
	public int insertProfile(Employee e) {
		return eDao.insertProfile(sqlSession,e);
	}

}

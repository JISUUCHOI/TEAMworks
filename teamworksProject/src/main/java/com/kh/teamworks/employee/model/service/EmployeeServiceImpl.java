package com.kh.teamworks.employee.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.teamworks.employee.model.dao.EmployeeDao;
import com.kh.teamworks.employee.model.vo.Attendance;
import com.kh.teamworks.employee.model.vo.Employee;
import com.kh.teamworks.employee.model.vo.SearchEmpAttCondition;
import com.kh.teamworks.employee.model.vo.SearchEmpAttendance;
import com.kh.teamworks.employee.model.vo.SearchMyAttendance;

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
		return eDao.myUpdatePwd(sqlSession, e);
	}

	@Override
	public int insertProfile(Employee e) {
		return eDao.insertProfile(sqlSession,e);
	}

	@Override
	public int attInsert(Attendance att) {
		
		return eDao.attInsert(sqlSession,att);
	}

	@Override
	public Attendance selectAttTime(String empId) {
		
		return eDao.selectAttTime(sqlSession,empId);
	}

	@Override
	public int attUpdate(Attendance att) {
		
		return eDao.attUpdate(sqlSession,att);
	}
	
	@Override
	public Attendance selectAtt(String empId) {
		
		return eDao.selectAtt(sqlSession, empId);
	}

	@Override
	public int QRattInsert(String empId) {
		
		return eDao.QRattInsert(sqlSession,empId);
	}

	@Override
	public ArrayList<Attendance> selectSchMyAtt(SearchMyAttendance sma) {
		// TODO Auto-generated method stub
		return eDao.selectSchMyAtt(sqlSession,sma);
	}

	@Override
	public ArrayList<SearchEmpAttendance> selectSchEmpAtt(SearchEmpAttCondition seac) {
		
		return eDao.selectSchEmpAtt(sqlSession,seac);
	}

	
}

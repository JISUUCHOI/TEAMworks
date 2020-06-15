package com.kh.teamworks.employee.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.teamworks.common.model.vo.PageInfo;
import com.kh.teamworks.employee.model.vo.Attendance;
import com.kh.teamworks.employee.model.vo.Employee;
import com.kh.teamworks.employee.model.vo.SearchEmpAttCondition;
import com.kh.teamworks.employee.model.vo.SearchEmpAttendance;
import com.kh.teamworks.employee.model.vo.SearchMyAttendance;
import com.kh.teamworks.management.model.vo.Vacation;

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
		
		return sqlSession.insert("employeeMapper.insertDate", empId);
	}
	public Attendance selectAtt(SqlSessionTemplate sqlSession, String empId) {
		return sqlSession.selectOne("employeeMapper.selectAtt", empId);
	}


	public int QRattInsert(SqlSessionTemplate sqlSession, String empId) {
		
		return sqlSession.insert("employeeMapper.QRattInsert", empId);
	}


	public ArrayList<Attendance> selectSchMyAtt(SqlSessionTemplate sqlSession, SearchMyAttendance sma) {
	
		return (ArrayList)sqlSession.selectList("employeeMapper.selectSchMyAtt", sma);
	}


	public ArrayList<SearchEmpAttendance> selectSchEmpAtt(SqlSessionTemplate sqlSession,  SearchEmpAttCondition seac,PageInfo pi) {
		int offset = (pi.getCurrentPage()-1)*pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		//System.out.println(seac);
		return (ArrayList)sqlSession.selectList("employeeMapper.selectSchEmpAtt", seac,rowBounds);
	}



	public int selectListCount(SqlSessionTemplate sqlSession, SearchEmpAttCondition seac) {
		//System.out.println(seac);
		return sqlSession.selectOne("employeeMapper.selectListCount",seac);
		
	}


	public Vacation selectVacation(SqlSessionTemplate sqlSession, String empId) {
		
		return sqlSession.selectOne("employeeMapper.selectVacation",empId);
	}





}

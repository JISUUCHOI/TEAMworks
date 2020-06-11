package com.kh.teamworks.management.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.teamworks.employee.model.vo.Employee;
import com.kh.teamworks.management.model.dao.ManagementDao;
import com.kh.teamworks.management.model.vo.CompanyBsns;
import com.kh.teamworks.management.model.vo.CompanyInfo;
import com.kh.teamworks.management.model.vo.Department;
import com.kh.teamworks.management.model.vo.Job;
import com.kh.teamworks.management.model.vo.Proof;
import com.kh.teamworks.management.model.vo.Vacation;

@Service("mgService")
public class ManagementServiceImpl implements ManagementService{
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Autowired
	private ManagementDao mgDao;
	

	@Override
	public CompanyInfo selectCompanyInfo(String homNo) {
		return mgDao.selectCompanyInfo(sqlSession, homNo);
	}

	@Override
	public CompanyBsns selectCompanyBsns(String homNo) {
		return mgDao.selectCompanyBsns(sqlSession, homNo);
	}
	
	
	@Override
	public int updateCompanyLogo() {
		// TODO Auto-generated method stub
		return 0;
	}
	
	// 모든 사원 목록 조회용
	@Override
	public ArrayList<Employee> selectEmpList() {
		return mgDao.selectEmpList(sqlSession);
	}
	
	// 해당 부서에 소속된 사원 목록 조회용
	@Override
	public ArrayList<Employee> selectEmpList(int deptCode) {
		
		return mgDao.selectEmpList(sqlSession, deptCode);
	}

	// 키워드로 검색된 사원 목록 조회용
	@Override
	public ArrayList<Employee> selectEmpList(String keyword) {

		return mgDao.selectEmpList(sqlSession, keyword);
	}

	@Override
	public Employee selectEmployeeInfo(Employee e) {
		// TODO Auto-generated method stub
		return null;
	}
	
	@Override
	public int insertEmployee(Employee e) {
		return mgDao.insertEmployee(sqlSession, e);
	}
	
	@Override
	public int idCheck(String empId) {
		return mgDao.idCheck(sqlSession, empId);
	}
	

	@Override
	public int updateEmpInfo() {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public Vacation selectVacationList() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void searchEmpVacation(String keyword) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public Proof selectProofList() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public ArrayList<Department> selectDeptList() {

		return mgDao.selectDeptList(sqlSession);
	}

	@Override
	public int insertDept(String deptName) {

		return mgDao.insertDept(sqlSession, deptName);
	}

	@Override
	public int updateDept(Department dept) {

		return mgDao.updateDept(sqlSession, dept);
	}

	@Override
	public int deleteDept(int deptCode) {

		return mgDao.deleteDept(sqlSession, deptCode);
	}

	@Override
	public ArrayList<Job> selectJobList() {
		return mgDao.selectJobList(sqlSession);
	}

	@Override
	public void searchEmpInfo() {
		// TODO Auto-generated method stub
		
	}

	@Override
	public int updateJobCode() {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int deleteJobCode() {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int insertJobCode() {
		// TODO Auto-generated method stub
		return 0;
	}



	

}

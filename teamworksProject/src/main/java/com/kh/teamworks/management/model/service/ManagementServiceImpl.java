package com.kh.teamworks.management.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.teamworks.management.model.dao.ManagementDao;
import com.kh.teamworks.management.model.vo.CompanyBsns;
import com.kh.teamworks.management.model.vo.CompanyInfo;
import com.kh.teamworks.management.model.vo.Department;
import com.kh.teamworks.management.model.vo.Employee;
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
	public CompanyInfo selectCompanyInfo(CompanyInfo ci) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int updateCompanyLogo() {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public CompanyBsns selectCompanyBsnsInfo(CompanyBsns cb) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Employee selectEmployeeInfo(Employee e) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public ArrayList<Employee> selectEmployeeList() {
		// TODO Auto-generated method stub
		return null;
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
	public Department selectDeptList() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int insertDept(String keyword) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int updateDept() {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int deleteDept() {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public Job selectJobCode() {
		// TODO Auto-generated method stub
		return null;
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

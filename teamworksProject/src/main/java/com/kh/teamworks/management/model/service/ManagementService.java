package com.kh.teamworks.management.model.service;

import java.util.ArrayList;

import com.kh.teamworks.management.model.vo.CompanyBsns;
import com.kh.teamworks.management.model.vo.CompanyInfo;
import com.kh.teamworks.management.model.vo.Department;
import com.kh.teamworks.management.model.vo.Employee;
import com.kh.teamworks.management.model.vo.Job;
import com.kh.teamworks.management.model.vo.Proof;
import com.kh.teamworks.management.model.vo.Vacation;

public interface ManagementService {
	
	// 1. 회사 정보 관리
	CompanyInfo selectCompanyInfo(String empId);
	int updateCompanyLogo();
	CompanyBsns selectCompanyBsnsInfo(int homNo);
	
	// 2. 사원 정보 관리
	Employee selectEmployeeInfo(Employee e);
	ArrayList<Employee> selectEmployeeList();
	int updateEmpInfo();
	Vacation selectVacationList();
	void searchEmpVacation(String keyword);
	Proof selectProofList();
	
	// 3. 조직도 관리
	Department selectDeptList();
	int insertDept(String keyword); //
	int updateDept(); //
	int deleteDept(); //
	
	ArrayList<Job> selectJobList();
	void searchEmpInfo(); //
	int updateJobCode(); //
	int deleteJobCode(); //
	int insertJobCode(); //
	
}

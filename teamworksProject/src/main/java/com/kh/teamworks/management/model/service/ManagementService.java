package com.kh.teamworks.management.model.service;

import java.util.ArrayList;

import com.kh.teamworks.employee.model.vo.Employee;
import com.kh.teamworks.management.model.vo.CompanyBsns;
import com.kh.teamworks.management.model.vo.CompanyInfo;
import com.kh.teamworks.management.model.vo.Department;
import com.kh.teamworks.management.model.vo.Job;
import com.kh.teamworks.management.model.vo.Proof;
import com.kh.teamworks.management.model.vo.Vacation;

public interface ManagementService {
	
	// 회사 정보 관리
	CompanyInfo selectCompanyInfo(String homNo);
	CompanyBsns selectCompanyBsnsInfo(String homNo);
	
	// 회사 정보 관리 - 로고 정보
	int updateCompanyLogo();
	
	// 사원 정보 관리
	Employee selectEmployeeInfo(Employee e);
	
	// 인사 정보 등록 
	int insertEmployee(Employee e);
	int idCheck(String empId);
	
	// 사원 관리
	ArrayList<Employee> selectEmployeeList();
	int updateEmpInfo();
	
	// 휴가 관리
	Vacation selectVacationList();
	void searchEmpVacation(String keyword);
	
	// 증명서 발급
	Proof selectProofList();
	
	
	
	// 조직도 관리
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

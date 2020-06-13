package com.kh.teamworks.management.model.service;

import java.util.ArrayList;

import com.kh.teamworks.common.model.vo.PageInfo;
import com.kh.teamworks.employee.model.vo.Employee;
import com.kh.teamworks.management.model.vo.CompanyBsns;
import com.kh.teamworks.management.model.vo.CompanyInfo;
import com.kh.teamworks.management.model.vo.Department;
import com.kh.teamworks.management.model.vo.Job;
import com.kh.teamworks.management.model.vo.Proof;
import com.kh.teamworks.management.model.vo.Vacation;
import com.kh.teamworks.management.model.vo.empSearchCondition;

public interface ManagementService {
	
	// 회사 정보 관리
	CompanyInfo selectCompanyInfo(String homNo);
	CompanyBsns selectCompanyBsns(String homNo);
	
	// 회사 정보 관리 - 로고 정보
	int updateLogo(CompanyInfo ci);
	
	// 회사 정보 관리 - 사업장 정보 변경
	public int updateCompanyBsns(CompanyBsns cb);
	
	// 사원 정보 관리
	Employee selectEmployeeInfo(Employee e);
	
	// 인사 정보 등록 
	int insertEmployee(Employee e);
	int idCheck(String empId);
	
	// 사원 명부
	int selectEmpCount();
	ArrayList<Employee> selectEmpList();
	ArrayList<Employee> selectEmpList(PageInfo pi);
	int selectEmpCount(empSearchCondition eSc);
	ArrayList<Employee> selectEmpListKeyword(empSearchCondition eSc, PageInfo pi);
	
	// 퇴사자 등록
	public int updateStatus(String empId);
	
	ArrayList<Employee> selectEmpList(int deptCode); // 해당 부서에 소속된 사원 목록 조회용
	ArrayList<Employee> selectEmpList(String keyword); // 키워드로 검색된 사원 목록 조회용


	// 사원 관리
	int updateEmpInfo();
	
	// 휴가 관리 리스트 A=연차, B=경조사, C=병가, D=출산
	ArrayList<Vacation> selectVacationList(PageInfo pi);

	
	// 휴가 관리 내 검색
	ArrayList<Vacation> searchVacationList(String keyword, PageInfo pi);
	int selectVacCount(String keyword);
	
	// 증명서 발급
	Proof selectProofList();
	
	
	
	// 조직도 관리
	ArrayList<Department> selectDeptList();
	int insertDept(String deptName); //
	int updateDept(Department dept); //
	int deleteDept(int deptCode); //
	
	ArrayList<Job> selectJobList();
	void searchEmpInfo(); //
	int updateJobCode(); //
	int deleteJobCode(); //
	int insertJobCode(); //

	
}

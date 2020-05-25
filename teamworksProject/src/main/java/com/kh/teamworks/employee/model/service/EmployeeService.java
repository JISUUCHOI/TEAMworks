package com.kh.teamworks.employee.model.service;


import com.kh.teamworks.employee.model.vo.Employee;


public interface EmployeeService {
	
	
	// 1. 로그인용 서비스
	Employee loginEmployee(Employee e );
	
	// 2 .마이페이지 회원 정보 수정용 서비스
	int myPageUpdateEmployee(Employee e);
	
	// 3. 마이페이지 비밀번호 변경 서비스
	int myUpdatePwd(Employee e);

}

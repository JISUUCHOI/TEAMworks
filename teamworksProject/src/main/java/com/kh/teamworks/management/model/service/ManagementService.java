package com.kh.teamworks.employee.model.service;


import com.kh.teamworks.employee.model.vo.Employee;


public interface EmployeeService {
	
	
	// 1. 로그?��?�� ?��비스
	Employee loginEmployee(Employee e );
	
	// 2 .마이?��?���? ?��?�� ?���? ?��?��?�� ?��비스
	int myPageUpdateEmployee(Employee e);
	
	// 3. 마이?��?���? 비�?번호 �?�? ?��비스
	int myUpdatePwd(Employee e);

}

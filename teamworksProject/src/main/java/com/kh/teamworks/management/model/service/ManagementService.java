package com.kh.teamworks.employee.model.service;


import com.kh.teamworks.employee.model.vo.Employee;


public interface EmployeeService {
	
	
	// 1. λ‘κ·Έ?Έ?© ?λΉμ€
	Employee loginEmployee(Employee e );
	
	// 2 .λ§μ΄??΄μ§? ?? ? λ³? ?? ?© ?λΉμ€
	int myPageUpdateEmployee(Employee e);
	
	// 3. λ§μ΄??΄μ§? λΉλ?λ²νΈ λ³?κ²? ?λΉμ€
	int myUpdatePwd(Employee e);

}

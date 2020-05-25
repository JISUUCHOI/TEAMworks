package com.kh.teamworks.employee.model.service;

import org.springframework.stereotype.Service;

import com.kh.teamworks.employee.model.vo.Employee;

@Service("eService")
public class EmployeeServiceImpl implements EmployeeService{

	@Override
	public Employee loginEmployee(Employee e) {
		return null;
	}

	@Override
	public int myPageUpdateEmployee(Employee e) {
		return 0;
	}

	@Override
	public int myUpdatePwd(Employee e) {
		return 0;
	}

}

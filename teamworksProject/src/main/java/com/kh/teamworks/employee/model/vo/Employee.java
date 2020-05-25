package com.kh.teamworks.employee.model.vo;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Setter
@Getter
@NoArgsConstructor
@AllArgsConstructor
@ToString
public class Employee {
	
	private String empId;
	private int deptCode;
	private int jobCode;
	private String empName;
	private String empPwd;
	private String empNo;
	private String phone;
	private String email;
	private int postcode;
	private String empAdd;
	private String empAddDetail;
	private Date hireDate;
	private Date retireDate;
	private String salType;
	private Date modifyDate;
	private String status;
	private String empNote;
	private String homeNo;

}

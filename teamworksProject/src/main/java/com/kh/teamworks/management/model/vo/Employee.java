package com.kh.teamworks.management.model.vo;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
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
	private String empPhone;
	private String empEmail;
	private String postCode;
	private String empAdd;
	private String empAddDetail;
	private Date hireDate;
	private Date retireDate;
	private String salType;
	private Date modifyDate;
	private String empStatus;
	private String empNote;
	private String originName;
	private String chnageName;
	private String homNo;
	
}

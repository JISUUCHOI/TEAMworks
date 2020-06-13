package com.kh.teamworks.management.model.vo;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class Vacation {
	
	private String empName;
	private String empId;
	private Date hireDate;
	private int vcTotal;
	private int vcCount;
	private String vcYear;
	

}

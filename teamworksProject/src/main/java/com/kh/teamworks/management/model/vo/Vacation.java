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
public class Vacation {
	
	private String empName;
	private String empId;
	private Date hireDate;
	private int vcTotal;
	private int vcCount;
	private String vcYear;
	private int typeA;
	private int typeB;
	private int typeC;
	private int typeD;
	private int months;


}

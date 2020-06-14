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
public class empSearchCondition {
	
	private String empName;
	private String empId;
	private String deptName;
	private String condition;
	private String keyword;
	private String vacationYear;
		
	
}

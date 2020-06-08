package com.kh.teamworks.employee.model.vo;

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
public class SearchEmpAttendance {
	
	private String empId;
	private String empName;
	private String jobName;
	private String deptName;
	private String attDate;
	private String startTime;
	private String endTime;
	private int atType;
	
	

}

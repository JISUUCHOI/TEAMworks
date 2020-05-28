package com.kh.teamworks.employee.model.vo;

import java.sql.Date;
import java.sql.Timestamp;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;


@Setter
@Getter
@ToString
@NoArgsConstructor
@AllArgsConstructor
public class Attendance {

	private String empId;
	private Date attDate;
	private Timestamp startTime;
	private Timestamp endTime;
	private String atType;
	
	
	
}

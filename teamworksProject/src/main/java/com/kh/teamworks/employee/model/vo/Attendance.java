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
	private Date attDate;  //년-월-일
	private String startTime;//출근시간
	private String endTime;// 퇴근시간
	private String atType; // 0:정상출근 1:지각 2:조퇴
	private String attTime; // 근무시간
	
	
}

package com.kh.teamworks.approval.model.vo;

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
public class ApproveSearchCondition {

	private String empId;
	private int approveStatus;
	
	private String empName;
	private String deptName;
	private String jobName;
	
	private String condition;
	private String keyword;
	private String writer;
	private String title;
	private String form;
	
	private String startDate;
	private String endDate;
	
	private String docStatus;
	private String stand;
	private String pending;
	private String complete;
	private String refuse;
	
}

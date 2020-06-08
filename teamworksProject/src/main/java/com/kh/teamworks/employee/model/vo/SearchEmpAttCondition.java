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
public class SearchEmpAttCondition {

	private String condition;
	private String deptAll;
	private String ManagementSupport;
	private String Development;
	private String empName;
	private String startDate;
	private String endDate;
	private int deptCode;

}

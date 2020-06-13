package com.kh.teamworks.management.model.vo;

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
public class CompanyInfo {
	
	private int homNo;
	private String homName;
	private String homHead;
	private String homAdrs;
	private String empId;
	private String logoOrigin;
	private String logoChange;
}

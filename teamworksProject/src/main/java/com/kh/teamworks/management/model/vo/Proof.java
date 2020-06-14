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
public class Proof {
	private String docNo;
	private String pfSq; // 증명서 종류
	private String pfPurpose; // 용도
	private String docStatus; // 결재 승인 상태값 =2 
	
	private String empId; // 신청인 아이디
	private String empName; // 신청인 성명
	private String empDept; // 신청인 부서 
	private Date docDate; // 신청일
	private String pfStatus; // 발급 상태
}

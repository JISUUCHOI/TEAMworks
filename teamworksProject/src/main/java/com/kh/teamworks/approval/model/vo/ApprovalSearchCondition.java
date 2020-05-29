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
public class ApprovalSearchCondition {

	private String empName;
	private String deptName;
	private String jobName;
	
	private int docNo;				// 문서코드
	private String empId;			// 사원번호
	private String docSc;			// 문서양식명		// 기안서, 경조사, 휴가, 제증명
	private int docStatus;			// 문서상태		// 0:대기 1: 진행 2: 완료 3: 반려 4:회수
	private String docTitle;		// 문서제목
	private String docReference;	// 참조자
	private String docDate;			// 기안일자
}

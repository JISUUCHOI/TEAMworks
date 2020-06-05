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
public class ApproveLine {
	
	private String approverEmpid;	// 결재자사원번호
	private String approverName;	// 결재자이름
	private String docNo;				// 문서번호
	private int approveStep;		// 결재우선순위
	private String approveReject;	// '미결, 진행, 승인, 반려'
	private int approveStatus;		// 0:대기 1:진행: 2:완료 3:반려 4:회수요청
	private String approveComment;			// 결재/회수 의견
	private String approveDate;		// 결재일자

	
	public ApproveLine(String approverEmpid, String docNo, int approveStep, String approveReject, int approveStatus) {
		super();
		this.approverEmpid = approverEmpid;
		this.docNo = docNo;
		this.approveStep = approveStep;
		this.approveReject = approveReject;
		this.approveStatus = approveStatus;
	}
	
}



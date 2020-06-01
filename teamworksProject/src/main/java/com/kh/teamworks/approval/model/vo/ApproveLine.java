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
	
	private String empId;			// 사원번호
	private int docNo;				// 문서번호
	private int approveStep;		// 결재우선순위
	private String approveReject;	// 승인,반려
	private int approveStatus;	// 0:대기 1:진행: 2:완료 3:반려 4:회수요청
	private String comment;			// 결재/회수 의견
	private String approveDate;		// 결재일자

}

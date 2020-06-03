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
public class FrequentApprovalLine {

	private String lineName;
	private String empId;
	private String authorizedEmpid;
	private int approveStep;
	
	private String approver;

	public FrequentApprovalLine(String lineName, String empId, String authorizedEmpid, int approveStep) {
		super();
		this.lineName = lineName;
		this.empId = empId;
		this.authorizedEmpid = authorizedEmpid;
		this.approveStep = approveStep;
	}
	
}

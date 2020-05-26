package com.kh.teamworks.approval.model.service;

import com.kh.teamworks.approval.model.vo.Document;

public interface ReqApprovalService {

	// 1. 경조비신청서, 휴가신청서 : 문서번호, 문서양식명, 기안일자,사원번호, 소속부서 insert
	int insertDocNo(String empId, String docDepartment);
	
	// 2. 경조비신청서, 휴가신청서 : 문서번호, 문서양식명, 기안일자,사원번호, 소속부서 select
	Document selectDocNo();
	
}

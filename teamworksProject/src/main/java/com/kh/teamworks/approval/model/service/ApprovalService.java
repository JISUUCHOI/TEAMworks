package com.kh.teamworks.approval.model.service;

import com.kh.teamworks.approval.model.vo.Document;

public interface ApprovalService {

	// 제증명 신청
	int insertProof(Document d);

}

package com.kh.teamworks.approval.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.kh.teamworks.approval.model.service.ApprovalService;
import com.kh.teamworks.approval.model.vo.Document;

@Controller
public class ApprovalController {

	
	@Autowired
    private ApprovalService aService;
	
	@RequestMapping("formList.ap")
	public String selectFormList() {
		return "approval/selectApprovalForm";
	}
	
	// 기안문작성
	@RequestMapping("writeDaft.ap")
	public String writeDaftForm() {
		return "approval/writeDraftForm";
	}
	
	// 제증명신청서
	@RequestMapping("proof.ap")
	public String proofForm() {
		return "approval/proofForm";
	}
	
	
	
	
	
	
	// 제증명 insert
	@RequestMapping("proofInsert.ap")
	public String insertProof(Document d, HttpServletRequest request, Model model,
            				  @RequestParam(name="uploadFile", required=false) MultipartFile file) {
		
		 int result = aService.insertProof(d);
		return null;
		
	}

	
	// 기안문insert
	// @RequestMapping("draftInsert.ap")
	// public String insertDraft
	
	
	
	
}

package com.kh.teamworks.approval.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.teamworks.approval.model.service.ApprovalService;

@Controller
public class ApprovalController {

	
	@RequestMapping("formList.ap")
	public String selectFormList() {
		return "approval/selectApprovalForm";
	}
	
	// 기안문작성
	@RequestMapping("writeDaft.ap")
	public String writeDaftForm() {
		return "approval/writeDraftForm";
	}
	
	// 경조비신청서
	@RequestMapping("familyEvent.ap")
	public String familyEventtForm() {
		return "approval/familyEventForm";
	}
	
	// 휴가신청서
	@RequestMapping("vacation.ap")
	public String vacationForm() {
		return "approval/vacationForm";
	}
	
	// w제증명청서
	@RequestMapping("proof.ap")
	public String proofForm() {
		return "approval/proofForm";
	}
	
	
	
}

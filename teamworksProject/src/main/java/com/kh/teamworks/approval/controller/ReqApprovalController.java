package com.kh.teamworks.approval.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.teamworks.approval.model.service.ReqApprovalService;
import com.kh.teamworks.approval.model.vo.Document;

@Controller
public class ReqApprovalController {

	@Autowired
	private ReqApprovalService raService;
	
	// 경조비신청서
		@RequestMapping("familyEvent.rap")
		public String familyEventtForm() {
			
			String empId = "TW103";
			String docDepartment = "개발팀";
			
			int result = raService.insertDocNo(empId, docDepartment);
			
			if(result > 0) {
				raService.selectDocNo();
			}
			
			return "approval/familyEventForm";
		}
		
		// 휴가신청서
		@RequestMapping("vacation.rap")
		public String vacationForm() {
			return "approval/vacationForm";
		}
	
	
}

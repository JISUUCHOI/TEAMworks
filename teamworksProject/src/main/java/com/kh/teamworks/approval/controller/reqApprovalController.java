package com.kh.teamworks.approval.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class reqApprovalController {

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
	
	
}

package com.kh.teamworks.mail.model.service;

import com.kh.teamworks.mail.model.vo.MailInfo;

public interface MailService {
	
	MailInfo selectMailInfo(String empId);
}

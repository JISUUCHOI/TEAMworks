package com.kh.teamworks.mail.model.vo;

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
public class MailInfo {
	
	private String emailInfoNo;
	private String emIimap;
	private String emIimapport;
	private String emIsmtp;
	private String emIsmtpport;
	private String emIuserId;
	private String emIuserPwd;
	private String entryDate;
	private String empId;
	private String empName;
	private String status;
}

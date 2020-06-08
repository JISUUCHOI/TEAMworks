package com.kh.teamworks.mail.model.vo;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Setter
@Getter
@NoArgsConstructor
@AllArgsConstructor
public class MailDTO {
	
	
	private int emailNo;
	private String mailTitle;
	private String mailContent;
	private Date createDate;
	private String emailStatus;
	private int emInfoNo;
	private String sender;
	private String recipients;
	private String deleteStatus;
	private String readStatus; 
	private String senderName; // EMP_NAME
	private String senderEmail; // EMP_EMAIL
	private String refRecipients; // REF_EMP
	private String refType; // EATYPE
	private String files; // 첨부파일 유무
	
}

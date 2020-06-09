package com.kh.teamworks.mail.model.vo;

import java.sql.Timestamp;

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
public class MailDTO {
	
	
	private int emailNo;
	private String mailTitle;
	private String mailContent;
	private Timestamp createDate;
	private String emailStatus;
	private int emInfoNo;
	private String sender;
	private String recipients;
	private String deleteStatus;
	private String readStatus; 
	private String senderName; // EMP_NAME 보낸 사람 이름
	private String senderEmail; // EMP_EMAIL
	private String refRecipients; // REF_EMP
	private String refType; // EATYPE
	private String files; // 첨부파일 유무
	private String recipientsName; // 받는 사람 이름
	private String recipientsEmail; // 받는 사람 메일
	private String refEmpName; // 참조자 이름 
}

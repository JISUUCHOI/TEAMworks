package com.kh.teamworks.mail.model.vo;

import java.sql.Date;

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
public class Mail {
	
	private int emailNo;
	private String mailTitle;
	private String mailContent;
	private Date createDate;
	private String mailStatus;
	private String sender;
	private String recipients;
	private String deleteStatus;  // 휴지통 비우기
	private String readStatus;  // 읽음 분류 
	
	
}

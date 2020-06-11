package com.kh.teamworks.mail.model.vo;

import java.sql.Timestamp;
import java.util.ArrayList;

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
	private Timestamp createDate;
	private String emailStatus;
	private String deleteStatus;
	private int emInfoNo;
	private String sender; // 보낸 사람
	private String senderId;
	private String recipients; // 받는 사람 
	private String readStatus;
	
	private String strTo;
	private String strCc;
	private String strBcc;
	
	private ArrayList<String> emto = new ArrayList<String>();
    private ArrayList<String> emcc = new ArrayList<String>();
    private ArrayList<String> embcc = new ArrayList<String>();
	
}

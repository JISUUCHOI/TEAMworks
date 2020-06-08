package com.kh.teamworks.mail.model.vo;

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
	
	private String emailNo;
	private String emType;
	private String emFrom;
	private String emSubject;
	private String emContent;
	private String createDate;
	private String empId;
	private String emailInfoNo;
	private String empName;
	
	private String strTo;
	private String strCc;
	private String strBcc;
	
	private ArrayList<String> emto = new ArrayList<String>();
    private ArrayList<String> emcc = new ArrayList<String>();
    private ArrayList<String> embcc = new ArrayList<String>();
	
}

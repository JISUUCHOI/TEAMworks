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
public class MailAddress {
	
	private String emailNo;
	private String emaType;
	private String emAddress;
	private int emaSq;
}

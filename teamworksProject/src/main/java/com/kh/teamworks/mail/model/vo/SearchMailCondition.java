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
public class SearchMailCondition {
	
	private String condition;
	private String sender;
	private String title;
	private String content;
	private String keyword;
	private String empId;
	private String readStatus;
	
	
}

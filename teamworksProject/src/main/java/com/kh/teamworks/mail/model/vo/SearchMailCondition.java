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
	private String sender; //보낸사람 
	private String title;
	private String content;
	private String keyword;
	private String empId; // 조회자(로그인된사람)
	private String readStatus;
	private String recipients; // 받는 사람
	
}

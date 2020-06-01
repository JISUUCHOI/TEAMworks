package com.kh.teamworks.management.model.vo;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class Vacation {
	private int docNO;
	private String vcSq;
	private String vcDate;
	private String vcStart;
	private String vcEnd;
	private int vcCount;
	private String vcContent;
	
}

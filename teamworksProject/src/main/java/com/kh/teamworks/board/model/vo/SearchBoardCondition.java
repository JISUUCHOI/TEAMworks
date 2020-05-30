package com.kh.teamworks.board.model.vo;

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
public class SearchBoardCondition {
	
	private String writer;
	private String title;
	private String content;
	private String start;
	private String end;

}

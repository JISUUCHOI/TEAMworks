package com.kh.teamworks.board.model.vo;

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
public class BoardDTO {
	
	private int boardNo;
	private int boardCategory;
	private String boardTitle;
	private String empName;
	private String empId;
	private String boardContent;
	private Date createDate;
	private Date modifyDate;
	private int count;
	private int like;
	private String status;
	private String boardFiles;
}

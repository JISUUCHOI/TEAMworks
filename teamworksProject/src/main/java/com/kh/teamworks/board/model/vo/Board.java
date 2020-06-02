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
public class Board {
	
	private int boardNo;
	private int boardCategory;
	private String boardWriter;
	private String boardTitle;
	private String boardContent;
	private Date createDate;
	private Date modifyDate;
	private int bdLike;
	private String status;
	private int count;
	
}

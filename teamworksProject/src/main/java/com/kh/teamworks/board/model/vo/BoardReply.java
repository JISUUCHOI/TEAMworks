package com.kh.teamworks.board.model.vo;

import java.sql.Timestamp;

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
public class BoardReply {
	
	private int replyNo;
	private String replyWriter;
	private int refBoardNo;
	private String replyContent;
	private Timestamp createDate;
	private Timestamp modifyDate;
	private String status;

}

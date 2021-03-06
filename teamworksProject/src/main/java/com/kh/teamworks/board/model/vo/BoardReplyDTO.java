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
public class BoardReplyDTO {
	
	private int replyNo;
	private String empId;
	private String empName;
	private String deptName;
	private String jobName;
	private int refBoardNo;
	private String replyContent;
	private Timestamp createDate;
	private Timestamp modifyDate;
	private String status;

}

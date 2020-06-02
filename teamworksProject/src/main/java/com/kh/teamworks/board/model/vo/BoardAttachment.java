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
public class BoardAttachment {

	private int bdFileNo;
	private int refBoardNo;
	private String baOriginName;
	private String baChangeName;
	private String baFilePath;
	private Date updateDate;
	private String status;
}

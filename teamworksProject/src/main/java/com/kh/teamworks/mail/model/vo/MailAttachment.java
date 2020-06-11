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
public class MailAttachment {
	
	private int emailNo;
	private String changeFileName;
	private String originFileName;
	private long filesize;
	private int fileNo;
	private String filePath;

}

package com.kh.teamworks.approval.model.vo;

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
public class DocumentList {
	
	private String empId;
	private int dlNo;
	private String dlForm;
	private String dlName;
	private int dlLike;

}

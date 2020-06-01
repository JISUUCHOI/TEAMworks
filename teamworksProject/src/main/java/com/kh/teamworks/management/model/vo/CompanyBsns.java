package com.kh.teamworks.management.model.vo;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@ToString
public class CompanyBsns {
	private int companyNo;
	private int homNo;
	private String companyName;
	private String companyHead;
	private String companyCon;
	private String companyKind;
	private String companyAddress;
	private int companyExno;
}

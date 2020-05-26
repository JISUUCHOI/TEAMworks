package com.kh.teamworks.schedule.model.vo;

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
public class Schedule {
	
	private int schNo;				// 일정번호
	private String schCategory;		// 일정분류
	private String empId;			// 사원번호
	private String schTitle;		// 일정제목
	private String schContent;		// 일정내용
	private String startDate;		// 시작일
	private String endDate;			// 종료일
	private String deleteStatus;	// 일정삭제여부

}

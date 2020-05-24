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
	
	private int scheduleNo;
	private String scheduleCategory;
	private String empId;
	private String scheduleTitle;
	private String scheduleContent;
	private String startDate;
	private String endDate;
	private String deleteStatus;

}

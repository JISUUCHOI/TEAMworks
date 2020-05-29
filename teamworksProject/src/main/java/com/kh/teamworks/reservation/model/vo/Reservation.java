package com.kh.teamworks.reservation.model.vo;

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
public class Reservation {
	
	private int reservationNo;		// 예약번호
	private String empId;			// 사원번호
	private int roomNo;				// 회의실번호
	private String reservationDate;	// 사용일
	private String startTime;		// 사용시작시간
	private String endTime;			// 사용종료시간
	private String purpose;			// 사용용도
	private String status;			// 예약상태
	
	
	// 타 테이블 컬럼
	private String empName;			// 사원명 
	private String deptName;		// 부서명
	

}

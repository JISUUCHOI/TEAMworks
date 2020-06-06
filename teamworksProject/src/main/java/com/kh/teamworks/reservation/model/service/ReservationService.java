package com.kh.teamworks.reservation.model.service;

import java.util.ArrayList;

import com.kh.teamworks.common.model.vo.PageInfo;
import com.kh.teamworks.reservation.model.vo.Reservation;

public interface ReservationService {
	
	// 예약 현황 조회용 서비스
	ArrayList<Reservation> selectReservationList(String today);
	
	// 예약 상세 조회용 서비스
	Reservation selectReservation(Reservation r);
	
	// 예약 추가용 서비스
	int insertReservation(Reservation r);
	
	// 나의 예약 목록 조회용 서비스
	ArrayList<Reservation> selectMyReservationList(String empId, PageInfo pi);
	
	// 예약 취소용 서비스
	int cancelReservation(int reservationNo);
	
	// 예약 사용 완료 처리용 서비스
	int completeReservation(int reservationNo);
	
	// 페이징바에 쓸 나의 예약 갯수 조회용 서비스
	int selectMyReservationListCount(String empId);


}

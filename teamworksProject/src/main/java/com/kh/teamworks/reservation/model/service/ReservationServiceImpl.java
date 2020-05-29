package com.kh.teamworks.reservation.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.teamworks.reservation.model.dao.ReservationDao;
import com.kh.teamworks.reservation.model.vo.Reservation;

@Service("reService")
public class ReservationServiceImpl implements ReservationService {
	
	@Autowired
	public SqlSessionTemplate sqlSession;
	@Autowired
	public ReservationDao reDao;
	
	
	// 예약 현황 조회용 서비스
	@Override
	public ArrayList<Reservation> selectReservationList() {

		return reDao.selectReservationList(sqlSession);
	}
	
	
	// 전달받은 날짜의 예약 리스트 조회용 서비스
	@Override
	public ArrayList<Reservation> selectDayReservation(String day) {
		
		return reDao.selectDayReservation(sqlSession, day);
	}
	
	
	// 예약 추가용 서비스
	@Override
	public int insertReservation(Reservation r) {

		return 0;
	}
	
	
	// 나의 예약 목록 조회용 서비스
	@Override
	public ArrayList<Reservation> selectMyReservationList(String empId) {

		return reDao.selectMyReservationList(sqlSession, empId);
	}
	
	
	// 예약 취소용 서비스
	@Override
	public int cancelReservation(int reservationNo) {

		return 0;
	}
	
	
	// 예약 사용 완료 처리용 서비스
	@Override
	public int completeReservation(int reservationNo) {

		return 0;
	}
	
	
	

}

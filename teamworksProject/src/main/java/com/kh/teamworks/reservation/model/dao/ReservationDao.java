package com.kh.teamworks.reservation.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.teamworks.reservation.model.vo.Reservation;

@Repository("reDao")
public class ReservationDao {
	
	public ArrayList<Reservation> selectReservationList(SqlSessionTemplate sqlSession) {
		
		return (ArrayList)sqlSession.selectList("reservationMapper.selectReservationList");
	}
	
	
	public ArrayList<Reservation> selectDayReservation(SqlSessionTemplate sqlSession, String day) {
		
		return (ArrayList)sqlSession.selectList("reservationMapper.selectDayReservation", day);
	}
	
	
	public ArrayList<Reservation> selectMyReservationList(SqlSessionTemplate sqlSession, String empId) {
		
		return (ArrayList)sqlSession.selectList("reservationMapper.selectMyReservationList", empId);
	}

}

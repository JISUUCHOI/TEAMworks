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

}

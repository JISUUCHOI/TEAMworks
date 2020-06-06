package com.kh.teamworks.reservation.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.teamworks.common.model.vo.PageInfo;
import com.kh.teamworks.reservation.model.vo.Reservation;

@Repository("reDao")
public class ReservationDao {
	
	// 예약 현황 조회용
	public ArrayList<Reservation> selectReservationList(SqlSessionTemplate sqlSession, String today) {
		
		return (ArrayList)sqlSession.selectList("reservationMapper.selectReservationList", today);
	}
	
	
	// 예약 상세 조회용
	public Reservation selectReservation(SqlSessionTemplate sqlSession, Reservation r) {
		
		return sqlSession.selectOne("reservationMapper.selectReservation", r);
	}
	
	
	// 나의 예약 목록 조회용
	public ArrayList<Reservation> selectMyReservationList(SqlSessionTemplate sqlSession, String empId, PageInfo pi) {
		
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		
		return (ArrayList)sqlSession.selectList("reservationMapper.selectMyReservationList", empId, rowBounds);
	}
	
	
	// 예약 추가용
	public int insertReservation(SqlSessionTemplate sqlSession, Reservation r) {
		
		return sqlSession.insert("reservationMapper.insertReservation", r);
	}
	
	
	// 예약 취소용
	public int cancelReservation(SqlSessionTemplate sqlSession, int reservationNo) {
		
		return sqlSession.update("reservationMapper.cancelReservation", reservationNo);
	}
	
	
	// 예약 사용 완료 처리용
	public int completeReservation(SqlSessionTemplate sqlSession, int reservationNo) {
		
		return sqlSession.update("reservationMapper.completeReservation", reservationNo);
	}
	
	
	// 페이징바에 쓸 나의 예약 갯수 조회용
	public int selectMyReservationListCount(SqlSessionTemplate sqlSession, String empId) {
		
		return sqlSession.selectOne("reservationMapper.selectMyReservationListCount", empId);
	}

}

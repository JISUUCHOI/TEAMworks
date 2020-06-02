package com.kh.teamworks.schedule.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.teamworks.schedule.model.vo.Schedule;

@Repository("scDao")
public class ScheduleDao {
	
	// 전체 일정 리스트 조회용
	public ArrayList<Schedule> selectAllSch(SqlSessionTemplate sqlSession, String empId) {
		
		return (ArrayList)sqlSession.selectList("scheduleMapper.selectAllSch", empId);
	}
	
	
	// 일정 상세 조회용
	public Schedule selectSchDetail(SqlSessionTemplate sqlSession, int schNo) {
		
		return sqlSession.selectOne("scheduleMapper.selectSchDetail", schNo);
	}
	
	
	// 일정 추가용
	public int insertSch(SqlSessionTemplate sqlSession, Schedule sch) {
		
		return sqlSession.insert("scheduleMapper.insertSch", sch);
	}
	
	
	// 일정 수정용
	public int updateSch(SqlSessionTemplate sqlSession, Schedule sch) {
		
		return sqlSession.update("scheduleMapper.updateSch", sch);
	}
	
	
	// 일정 삭제용
	public int deleteSch(SqlSessionTemplate sqlSession, int schNo) {
		
		return sqlSession.update("scheduleMapper.deleteSch", schNo);
	}

}

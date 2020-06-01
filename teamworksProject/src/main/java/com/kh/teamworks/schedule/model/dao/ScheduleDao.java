package com.kh.teamworks.schedule.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.teamworks.schedule.model.vo.Schedule;

@Repository("scDao")
public class ScheduleDao {
	
	
	public ArrayList<Schedule> selectAllSch(SqlSessionTemplate sqlSession, String empId) {
		
		return (ArrayList)sqlSession.selectList("scheduleMapper.selectAllSch", empId);
	}
	
	
	public Schedule selectSchDetail(SqlSessionTemplate sqlSession, int schNo) {
		
		return sqlSession.selectOne("scheduleMapper.selectSchDetail", schNo);
	}

}

package com.kh.teamworks.schedule.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.teamworks.schedule.model.vo.Schedule;

@Repository("scDao")
public class ScheduleDao {
	
	
	public ArrayList<Schedule> selectAllSch(SqlSessionTemplate sqlSession) {
		
		return (ArrayList)sqlSession.selectList("scheduleMapper.selectAllSch");
	}

}

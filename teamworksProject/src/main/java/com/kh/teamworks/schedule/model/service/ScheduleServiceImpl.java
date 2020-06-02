package com.kh.teamworks.schedule.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.teamworks.schedule.model.dao.ScheduleDao;
import com.kh.teamworks.schedule.model.vo.Schedule;

@Service("scService")
public class ScheduleServiceImpl implements ScheduleService {
	
	@Autowired
	public SqlSessionTemplate sqlSession;
	@Autowired
	public ScheduleDao scDao;

	
	// 전체 일정 리스트 조회용 서비스
	@Override
	public ArrayList<Schedule> selectAllSch(String empId) {

		return scDao.selectAllSch(sqlSession, empId);
	}

	// 회사 일정 리스트 조회용 서비스
	@Override
	public ArrayList<Schedule> selectTeamSch() {

		return scDao.selectTeamSch(sqlSession);
	}

	// 개인 일정 리스트 조회용 서비스
	@Override
	public ArrayList<Schedule> selectEmpSch(String empId) {

		return null;
	}

	// 일정 상세 조회용 서비스
	@Override
	public Schedule selectSchDetail(int schNo) {

		return scDao.selectSchDetail(sqlSession, schNo);
	}

	// 일정 추가용 서비스
	@Override
	public int insertSch(Schedule sch) {

		return scDao.insertSch(sqlSession, sch);
	}
	
	// 일정 수정용 서비스
	@Override
	public int updateSch(Schedule sch) {

		return scDao.updateSch(sqlSession, sch);
	}

	// 일정 삭제용 서비스
	@Override
	public int deleteSch(int schNo) {

		return scDao.deleteSch(sqlSession, schNo);
	}


}

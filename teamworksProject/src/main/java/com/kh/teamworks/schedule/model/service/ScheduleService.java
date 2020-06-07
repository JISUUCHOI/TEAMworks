package com.kh.teamworks.schedule.model.service;

import java.util.ArrayList;

import com.kh.teamworks.schedule.model.vo.Schedule;

public interface ScheduleService {
	
	// 전체 일정 리스트 조회용 서비스
	ArrayList<Schedule> selectAllSch(String empId);
	
	// 회사 일정 리스트 조회용 서비스
	ArrayList<Schedule> selectTeamSch();
	
	// 개인 일정 리스트 조회용 서비스
	ArrayList<Schedule> selectEmpSch(String empId);
	
	// 일정 상세 조회용 서비스
	Schedule selectSchDetail(int schNo);
	
	// 일정 추가용 서비스
	int insertSch(Schedule sch);
	
	// 일정 수정용 서비스
	int updateSch(Schedule sch);
	
	// 일정 삭제용 서비스
	int deleteSch(int schNo);
	
	// 회사 일정 관리 --> 회사 일정 추가용 서비스
	int insertManageSch(Schedule sch);
	

}

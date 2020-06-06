package com.kh.teamworks.employee.model.service;


import com.kh.teamworks.employee.model.vo.Attendance;
import com.kh.teamworks.employee.model.vo.Employee;


public interface EmployeeService {
	
	
	// 1. 로그인용 서비스
	Employee loginEmployee(Employee e );
	
	// 2 .마이페이지 회원 정보 수정용 서비스
	int myPageUpdateEmployee(Employee e);
	
	// 3. 마이페이지 비밀번호 변경 서비스
	int myUpdatePwd(Employee e);
	
	// 4. 프로필 이미지 신규 등록
	int insertProfile(Employee e);
	
	// 5. 출근 기록 서비스
	int attInsert(Attendance att);
	
	// 6. 내 오늘 출근 시간체크
	Attendance selectAttTime(String empId);
	
	// 7. 퇴근도장
	int attUpdate(Attendance att);



	Attendance selectAtt(String empId);

	int QRattInsert(String empId);

	
	
	

}

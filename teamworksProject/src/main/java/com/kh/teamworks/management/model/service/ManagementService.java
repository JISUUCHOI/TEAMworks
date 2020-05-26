package com.kh.teamworks.employee.model.service;


import com.kh.teamworks.employee.model.vo.Employee;


public interface EmployeeService {
	
	
	// 1. ë¡œê·¸?¸?š© ?„œë¹„ìŠ¤
	Employee loginEmployee(Employee e );
	
	// 2 .ë§ˆì´?˜?´ì§? ?šŒ?› ? •ë³? ?ˆ˜? •?š© ?„œë¹„ìŠ¤
	int myPageUpdateEmployee(Employee e);
	
	// 3. ë§ˆì´?˜?´ì§? ë¹„ë?ë²ˆí˜¸ ë³?ê²? ?„œë¹„ìŠ¤
	int myUpdatePwd(Employee e);

}

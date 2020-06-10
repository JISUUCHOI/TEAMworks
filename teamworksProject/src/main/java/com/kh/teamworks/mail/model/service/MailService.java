package com.kh.teamworks.mail.model.service;

import java.util.ArrayList;

import com.kh.teamworks.common.model.vo.PageInfo;
import com.kh.teamworks.employee.model.vo.Employee;
import com.kh.teamworks.mail.model.vo.Mail;
import com.kh.teamworks.mail.model.vo.MailDTO;
import com.kh.teamworks.mail.model.vo.SearchMailCondition;
import com.kh.teamworks.management.model.vo.Department;

public interface MailService {
	
	int selectInboxListCount(String empId);
	ArrayList<MailDTO> selectInboxList(PageInfo pi, String empId);
	
	int searchReadListCount(SearchMailCondition sc);
	ArrayList<MailDTO> searchReadList(SearchMailCondition sc, PageInfo pi);
	
	int searchKeyListCount(SearchMailCondition sc);
	ArrayList<MailDTO> searchKeyList(SearchMailCondition sc, PageInfo pi);
	
	int searchListCount(SearchMailCondition sc);
	ArrayList<MailDTO> searchList(SearchMailCondition sc, PageInfo pi);
	
	int selectOutboxListCount(String empId);
	ArrayList<MailDTO> selectOutboxList(PageInfo pi, String empId);
	
	int searchOutboxListCount(SearchMailCondition sc);
	ArrayList<MailDTO> searchOutboxList(SearchMailCondition sc, PageInfo pi);
	
	int changeReadStatus(Mail mail);
	int deleteMail(Mail mail);
	
	int selectTrashListCount(String empId);
	ArrayList<MailDTO> selectTrashList(PageInfo pi, String empId);
	
	int searchTrashListCount(SearchMailCondition sc);
	ArrayList<MailDTO> searchTrashList(SearchMailCondition sc, PageInfo pi);
	
	ArrayList<MailDTO> selectTrashAllList(String empId);
	int deleteSendMail(Mail mail);
	int revokeMail(MailDTO mail);
	
	ArrayList<Department> selectDeptList();
	ArrayList<Employee> selectEmpList();
}

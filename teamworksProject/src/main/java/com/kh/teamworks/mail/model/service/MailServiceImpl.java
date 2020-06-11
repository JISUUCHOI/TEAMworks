package com.kh.teamworks.mail.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.teamworks.common.model.vo.PageInfo;
import com.kh.teamworks.employee.model.vo.Employee;
import com.kh.teamworks.mail.model.dao.MailDao;
import com.kh.teamworks.mail.model.vo.Mail;
import com.kh.teamworks.mail.model.vo.MailDTO;
import com.kh.teamworks.mail.model.vo.MailInfo;
import com.kh.teamworks.mail.model.vo.SearchMailCondition;
import com.kh.teamworks.management.model.vo.Department;

@Service("emService")
public class MailServiceImpl implements MailService {
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Autowired
	private MailDao emDao;

	@Override
	public int selectInboxListCount(String empId) {
		return emDao.selectInboxListCount(sqlSession, empId);
	}

	@Override
	public ArrayList<MailDTO> selectInboxList(PageInfo pi, String empId) {
		return emDao.selectInboxList(sqlSession, pi, empId);
	}

	@Override
	public int searchReadListCount(SearchMailCondition sc) {
		return emDao.searchReadListCount(sqlSession, sc);
	}

	@Override
	public ArrayList<MailDTO> searchReadList(SearchMailCondition sc, PageInfo pi) {
		return emDao.searchReadList(sqlSession, sc, pi);
	}

	@Override
	public int searchKeyListCount(SearchMailCondition sc) {
		return emDao.searchKeyListCount(sqlSession, sc);
	}

	@Override
	public ArrayList<MailDTO> searchKeyList(SearchMailCondition sc, PageInfo pi) {
		return emDao.searchKeyList(sqlSession, sc, pi);
	}

	@Override
	public int searchListCount(SearchMailCondition sc) {
		return emDao.searchListCount(sqlSession, sc);
	}

	@Override
	public ArrayList<MailDTO> searchList(SearchMailCondition sc, PageInfo pi) {
		return emDao.searchList(sqlSession, sc, pi);
	}

	@Override
	public int selectOutboxListCount(String empId) {
		return emDao.selectOutboxListCount(sqlSession,empId);
	}

	@Override
	public ArrayList<MailDTO> selectOutboxList(PageInfo pi, String empId) {
		return emDao.selectOutboxList(sqlSession, pi, empId);
	}

	@Override
	public int searchOutboxListCount(SearchMailCondition sc) {
		return emDao.searchOutboxListCount(sqlSession, sc);
	}

	@Override
	public ArrayList<MailDTO> searchOutboxList(SearchMailCondition sc, PageInfo pi) {
		return emDao.searchOutboxList(sqlSession, sc, pi);
	}


	@Override
	public int changeReadStatus(Mail mail) {
		return emDao.changeReadStatus(sqlSession, mail);
	}

	@Override
	public int deleteMail(Mail mail) {
		return emDao.deleteMail(sqlSession, mail);
	}

	@Override
	public int selectTrashListCount(String empId) {
		return emDao.selectTrashListCount(sqlSession,empId);
	}

	@Override
	public ArrayList<MailDTO> selectTrashList(PageInfo pi, String empId) {
		return emDao.selectTrashList(sqlSession, pi, empId);
	}

	@Override
	public int searchTrashListCount(SearchMailCondition sc) {
		return emDao.searchTrashListCount(sqlSession, sc);
	}

	@Override
	public ArrayList<MailDTO> searchTrashList(SearchMailCondition sc, PageInfo pi) {
		return emDao.searchTrashList(sqlSession, sc, pi);
	}

	@Override
	public int deleteSendMail(Mail mail) {
		return emDao.deleteSendMail(sqlSession, mail);
	}

	@Override
	public int revokeMail(MailDTO mail) {
		return emDao.revokeMail(sqlSession, mail);
	}

	@Override
	public ArrayList<MailDTO> selectTrashAllList(String empId) {
		return emDao.selectTrashAllList(sqlSession,empId);
	}

	@Override
	public ArrayList<Department> selectDeptList() {
		return emDao.selectDeptList(sqlSession);
	}

	@Override
	public ArrayList<Employee> selectEmpList() {
		return emDao.selectEmpList(sqlSession);
	}

	@Override
	public ArrayList<Employee> searchUserMail(String keyword) {
		return emDao.searchUserMail(sqlSession, keyword);
	}
	
	
	
}

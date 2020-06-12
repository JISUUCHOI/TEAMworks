package com.kh.teamworks.mail.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.kh.teamworks.common.model.vo.PageInfo;
import com.kh.teamworks.employee.model.vo.Employee;
import com.kh.teamworks.mail.model.vo.Mail;
import com.kh.teamworks.mail.model.vo.MailAddress;
import com.kh.teamworks.mail.model.vo.MailAttachment;
import com.kh.teamworks.mail.model.vo.MailDTO;
import com.kh.teamworks.mail.model.vo.SearchMailCondition;
import com.kh.teamworks.management.model.vo.Department;

@Repository("emDao")
public class MailDao {

	public int selectInboxListCount(SqlSession sqlSession, String empId) {
		return sqlSession.selectOne("mailMapper.selectInboxListCount", empId);
	}
	
	public ArrayList<MailDTO> selectInboxList(SqlSession sqlSession, PageInfo pi, String empId){
		
		int offset = (pi.getCurrentPage()-1)*pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		return (ArrayList)sqlSession.selectList("mailMapper.selectInboxList", empId, rowBounds);
	}
	
	public int searchReadListCount(SqlSession sqlSession, SearchMailCondition sc) {
		return sqlSession.selectOne("mailMapper.searchReadListCount", sc);
	}
	
	public ArrayList<MailDTO> searchReadList(SqlSession sqlSession, SearchMailCondition sc, PageInfo pi){
		int offset = (pi.getCurrentPage()-1)*pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		return (ArrayList)sqlSession.selectList("mailMapper.searchReadList", sc, rowBounds);
	}
	
	public int searchKeyListCount(SqlSession sqlSession, SearchMailCondition sc) {
		return sqlSession.selectOne("mailMapper.searchKeyListCount", sc);
	}
	
	public ArrayList<MailDTO> searchKeyList(SqlSession sqlSession, SearchMailCondition sc, PageInfo pi){
		int offset = (pi.getCurrentPage()-1)*pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		return (ArrayList)sqlSession.selectList("mailMapper.searchKeyList", sc, rowBounds);
	}
	
	public int searchListCount(SqlSession sqlSession, SearchMailCondition sc) {
		return sqlSession.selectOne("mailMapper.searchListCount", sc);
	}
	
	public ArrayList<MailDTO> searchList(SqlSession sqlSession, SearchMailCondition sc, PageInfo pi){
		int offset = (pi.getCurrentPage()-1)*pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		return (ArrayList)sqlSession.selectList("mailMapper.searchList", sc, rowBounds);
	}
	
	public int selectOutboxListCount(SqlSession sqlSession, String empId) {
		return sqlSession.selectOne("mailMapper.selectOutboxListCount", empId);
	}
	
	public ArrayList<MailDTO> selectOutboxList(SqlSession sqlSession, PageInfo pi, String empId){
		int offset = (pi.getCurrentPage()-1)*pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		return (ArrayList)sqlSession.selectList("mailMapper.selectOutboxList", empId, rowBounds);
	}
	
	public int searchOutboxListCount(SqlSession sqlSession, SearchMailCondition sc) {
		return sqlSession.selectOne("mailMapper.searchOutboxListCount", sc);
	}
	
	public ArrayList<MailDTO> searchOutboxList(SqlSession sqlSession, SearchMailCondition sc, PageInfo pi){
		int offset = (pi.getCurrentPage()-1)*pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		return (ArrayList)sqlSession.selectList("mailMapper.searchOutboxList", sc, rowBounds);
	}
	
	public int changeReadStatus(SqlSession sqlSession, Mail readNoList) {
		return sqlSession.update("mailMapper.changeReadStatus", readNoList);
	}
	
	public int deleteMail(SqlSession sqlSession, Mail mail) {
		return sqlSession.update("mailMapper.deleteMail", mail);
	}
	
	public int selectTrashListCount(SqlSession sqlSession, String empId) {
		return sqlSession.selectOne("mailMapper.selectTrashListCount", empId);
	}
	
	public ArrayList<MailDTO> selectTrashList(SqlSession sqlSession,PageInfo pi, String empId){
		int offset = (pi.getCurrentPage()-1)*pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		return (ArrayList)sqlSession.selectList("mailMapper.selectTrashList", empId, rowBounds);
	}
	
	public int searchTrashListCount(SqlSession sqlSession, SearchMailCondition sc) {
		return sqlSession.selectOne("mailMapper.searchTrashListCount", sc);
	}
	public ArrayList<MailDTO> searchTrashList(SqlSession sqlSession, SearchMailCondition sc, PageInfo pi) {
		int offset = (pi.getCurrentPage()-1)*pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		return (ArrayList)sqlSession.selectList("mailMapper.searchTrashList", sc, rowBounds);
	}
	
	public ArrayList<MailDTO> selectTrashAllList(SqlSession sqlSession, String empId){
		return (ArrayList)sqlSession.selectList("mailMapper.selectTrashAllList", empId);
	}
	
	public int deleteSendMail(SqlSession sqlSession, Mail mail) {
		return sqlSession.update("mailMapper.deleteSendMail", mail);
	}
	
	public ArrayList<Department> selectDeptList(SqlSession sqlSession){
		return (ArrayList)sqlSession.selectList("mailMapper.selectDeptList");
	}
	public int revokeMail(SqlSession sqlSession, MailDTO mail) {
		return sqlSession.update("mailMapper.revokeMail", mail);
	}
	
	public ArrayList<Employee> selectEmpList(SqlSession sqlSession){
		return (ArrayList)sqlSession.selectList("mailMapper.selectEmpList");
	}
	
	public ArrayList<Employee> searchUserMail(SqlSession sqlSession, String keyword){
		return (ArrayList)sqlSession.selectList("mailMapper.searchUserMail", keyword);
	}
	
	public int insertMail(SqlSession sqlSession, Mail mail) {
		return sqlSession.insert("mailMapper.insertMail", mail);
	}
	
	public Employee selectUser(SqlSession sqlSession, String email) {
		return sqlSession.selectOne("mailMapper.selectUser", email);
	}
	
	public int insertMailAddressTo(SqlSession sqlSession, String empId) {
		return sqlSession.insert("mailMapper.insertMailAddressTo", empId);
	}
	public int insertMailAddressCc(SqlSession sqlSession, String empId) {
		return sqlSession.insert("mailMapper.insertMailAddressCc", empId);
	}
	
	public int insertMailAddressBcc(SqlSession sqlSession, String empId) {
		return sqlSession.insert("mailMapper.insertMailAddressBcc", empId);
	}
	
	public int insetMailAttachment(SqlSession sqlSession, MailAttachment ma) {
		return sqlSession.insert("mailMapper.insetMailAttachment", ma);
	}
	
	public ArrayList<MailDTO> selectMail(SqlSession sqlSession, int emailNo) {
		return (ArrayList)sqlSession.selectList("mailMapper.selectMail", emailNo);
	}
	
	public ArrayList<MailAddress> selectMailAddress(SqlSession sqlSession, int emailNo){
		return (ArrayList)sqlSession.selectList("mailMapper.selectMailAddress", emailNo);
	}
	
	public ArrayList<MailAttachment> selectMailAttachment(SqlSession sqlSession, int emilNo){
		return (ArrayList)sqlSession.selectList("mailMapper.selectMailAttachment");
	}
	
	public Employee selectUserId(SqlSession sqlSession, String empId) {
		return sqlSession.selectOne("mailMapper.selectUserId", empId);
	}
}

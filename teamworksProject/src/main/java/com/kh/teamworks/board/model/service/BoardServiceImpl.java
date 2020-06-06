package com.kh.teamworks.board.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.teamworks.board.model.dao.BoardDao;
import com.kh.teamworks.board.model.vo.Board;
import com.kh.teamworks.board.model.vo.BoardAttachment;
import com.kh.teamworks.board.model.vo.BoardDTO;
import com.kh.teamworks.board.model.vo.BoardLike;
import com.kh.teamworks.board.model.vo.BoardReply;
import com.kh.teamworks.board.model.vo.BoardReplyDTO;
import com.kh.teamworks.board.model.vo.SearchBoardCondition;
import com.kh.teamworks.common.model.vo.PageInfo;

@Service("bService")
public class BoardServiceImpl implements BoardService {
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	@Autowired
	private BoardDao bDao;
	
	@Override
	public int selectListCount(int cat) {
		return bDao.selectListCount(sqlSession,cat);
	}

	@Override
	public ArrayList<BoardDTO> selectList(PageInfo pi, int cat) {
		return bDao.selectList(sqlSession, pi, cat);
	}

	@Override
	public int searchListCount(SearchBoardCondition sc) {
		return bDao.searchListCount(sqlSession, sc);
	}

	@Override
	public ArrayList<BoardDTO> searchList(SearchBoardCondition sc, PageInfo pi) {
		return bDao.searchList(sqlSession, sc, pi);
	}

	
	@Override
	public int insertBoard(Board b) {
		return bDao.insertBoard(sqlSession, b);
	}

	@Override
	public int insertBoardAttachment(BoardAttachment ba) {
		return bDao.insertBoardAttachment(sqlSession, ba);
	}

	@Override
	public int increaseCount(int bno) {
		return bDao.increaseCount(sqlSession, bno);
	}

	@Override
	public ArrayList<BoardAttachment> selectBoardAttachment(int bno) {
		return bDao.selectBoardAttachment(sqlSession, bno);
	}

	@Override
	public BoardDTO selectBoard(int bno) {
		return bDao.selectBoard(sqlSession, bno);
	}

	@Override
	public int deleteBoard(int bno) {
		return bDao.deleteBoard(sqlSession, bno);
	}

	@Override
	public int deleteBoardAttachment(int bdFileNo) {
		return bDao.deleteBoardAttachment(sqlSession, bdFileNo);
	}

	@Override
	public BoardLike selectBoardLike(BoardLike bl) {
		return bDao.selectBoardLike(sqlSession, bl);
	}

	@Override
	public int insertBoardLike(BoardLike bl) {
		return bDao.insertBoardLike(sqlSession, bl);
	}

	@Override
	public int increaseLike(BoardLike bl) {
		return bDao.increaseLike(sqlSession, bl);
	}

	@Override
	public ArrayList<BoardReplyDTO> selectReplyList(int bno) {
		return bDao.selectReplyList(sqlSession, bno);
	}

	@Override
	public int updateBoardAttachment(String changename) {
		return bDao.updateBoardAttachment(sqlSession, changename);
	}

	@Override
	public int updateBoard(Board b) {
		return bDao.updateBoard(sqlSession, b);
	}

	@Override
	public int updateBoardAttachment(BoardAttachment ba) {
		return bDao.updateBoardAttachment(sqlSession, ba);
	}

	@Override
	public int insertReply(BoardReply r) {
		return bDao.insertReply(sqlSession, r);
	}

	@Override
	public BoardReplyDTO selectReply(BoardReply r) {
		return bDao.selectReply(sqlSession, r);
	}

	@Override
	public int updateReply(BoardReply r) {
		return bDao.updateReply(sqlSession, r);
	}

	@Override
	public int deleteReply(BoardReply r) {
		return bDao.deleteReply(sqlSession, r);
	}

	@Override
	public ArrayList<BoardDTO> selectMainBoard(String empId) {
		
		return bDao.selectMainBoard(sqlSession, empId);
	}

	@Override
	public ArrayList<BoardDTO> selectMainNotice(String empId) {
		// TODO Auto-generated method stub
		return bDao.selectMainNotice(sqlSession, empId);
	}

	

	
	
}

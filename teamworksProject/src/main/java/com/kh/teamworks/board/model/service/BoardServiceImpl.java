package com.kh.teamworks.board.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.teamworks.board.model.dao.BoardDao;
import com.kh.teamworks.board.model.vo.Board;
import com.kh.teamworks.board.model.vo.BoardAttachment;
import com.kh.teamworks.board.model.vo.BoardDTO;
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



	
	
}

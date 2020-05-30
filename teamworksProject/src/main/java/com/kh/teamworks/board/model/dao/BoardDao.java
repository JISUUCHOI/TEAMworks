package com.kh.teamworks.board.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.kh.teamworks.board.model.vo.BoardDTO;
import com.kh.teamworks.common.model.vo.PageInfo;

@Repository("bDao")
public class BoardDao {
	
	public int selectListCount(SqlSession sqlSession, int cat) {
		return sqlSession.selectOne("boardMapper.selectListCount", cat);
	}
	
	public ArrayList<BoardDTO> selectList(SqlSession sqlSession, PageInfo pi ,int cat){
		int offset = (pi.getCurrentPage()-1)*pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		return (ArrayList)sqlSession.selectList("boardMapper.selectList", cat, rowBounds);
	}
}

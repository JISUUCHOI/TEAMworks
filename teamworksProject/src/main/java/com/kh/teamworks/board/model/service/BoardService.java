package com.kh.teamworks.board.model.service;

import java.util.ArrayList;

import com.kh.teamworks.board.model.vo.Board;
import com.kh.teamworks.board.model.vo.BoardAttachment;
import com.kh.teamworks.board.model.vo.BoardDTO;
import com.kh.teamworks.board.model.vo.BoardLike;
import com.kh.teamworks.board.model.vo.BoardReplyDTO;
import com.kh.teamworks.board.model.vo.SearchBoardCondition;
import com.kh.teamworks.common.model.vo.PageInfo;

public interface BoardService {

	int selectListCount(int cat);
	ArrayList<BoardDTO> selectList(PageInfo pi, int cat);
	
	int searchListCount(SearchBoardCondition sc);
	ArrayList<BoardDTO> searchList(SearchBoardCondition sc, PageInfo pi);
	
	int insertBoard(Board b);
	
	int insertBoardAttachment(BoardAttachment ba);
	
	int increaseCount(int bno);
	ArrayList<BoardAttachment> selectBoardAttachment(int bno);
	BoardDTO selectBoard(int bno);
	
	int deleteBoard(int bno);
	int deleteBoardAttachment(int bdFileNo);
	
	BoardLike selectBoardLike(BoardLike bl);
	int increaseLike(BoardLike bl);
	int insertBoardLike(BoardLike bl);
	
	ArrayList<BoardReplyDTO> selectReplyList(int bno);
	
	int updateBoardAttachment(String changename);
	int updateBoard(Board b);
	int updateBoardAttachment(BoardAttachment ba);
}

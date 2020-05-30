package com.kh.teamworks.board.model.service;

import java.util.ArrayList;

import com.kh.teamworks.board.model.vo.BoardDTO;
import com.kh.teamworks.common.model.vo.PageInfo;

public interface BoardService {

	int selectListCount(int cat);
	ArrayList<BoardDTO> selectList(PageInfo pi, int cat);
}

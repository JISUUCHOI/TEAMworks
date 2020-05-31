package com.kh.teamworks.board.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.teamworks.board.model.service.BoardService;
import com.kh.teamworks.board.model.vo.BoardDTO;
import com.kh.teamworks.board.model.vo.SearchBoardCondition;
import com.kh.teamworks.common.model.vo.PageInfo;
import com.kh.teamworks.common.template.Pagination;

@Controller
public class BoardController {
	
	@Autowired
	private BoardService bService;
	
	@RequestMapping("list.bo")
	public String selectList(int currentPage, int cat, Model model) {
		
		int listCount = bService.selectListCount(cat);
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 10, 10);
		ArrayList<BoardDTO> list = bService.selectList(pi, cat);
		
		model.addAttribute("pi", pi);
		model.addAttribute("list", list);
		
		if(cat == 1) {
			return "board/noticeListView";
		}else {
			return "board/boardListView";
		}
	}
	
	@RequestMapping("search.bo")
	public String searchList(SearchBoardCondition sc , int cat, int currentPage, Model model) {
		
	
		switch(sc.getCondition()) {
		case "writer" : sc.setWriter(sc.getKeyword()); break;
		case "title" : sc.setTitle(sc.getKeyword()); break;
		case "content" : sc.setContent(sc.getKeyword()); break;
		}
		
		sc.setBoardCategory(cat);
		
		int listCount = bService.searchListCount(sc);
		
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 10, 10);
		
		ArrayList<BoardDTO> list = bService.searchList(sc, pi);
		
		// System.out.println(sc);
		// System.out.println(cat);
		model.addAttribute("pi", pi);
		model.addAttribute("list", list);
		model.addAttribute("sc", sc);
		
		if(sc.getBoardCategory()==1) {
			return "board/noticeListView";
		}else {
			return "board/boardListView";
		}
	
	}
}

package com.kh.teamworks.board.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.kh.teamworks.board.model.service.BoardService;
import com.kh.teamworks.board.model.vo.Board;
import com.kh.teamworks.board.model.vo.BoardAttachment;
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
		
		
		if(sc.getKeyword()!=null) {
			switch(sc.getCondition()) {
			case "writer" : sc.setWriter(sc.getKeyword()); break;
			case "title" : sc.setTitle(sc.getKeyword()); break;
			case "content" : sc.setContent(sc.getKeyword()); break;
			}
			
		}else {
			sc.setWriter(null);
			sc.setTitle(null);
			sc.setContent(null);
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
	
	@RequestMapping("enrollForm.bo")
	public ModelAndView boardEnrollForm(int cat, ModelAndView mv) {
		
		mv.addObject("cat", cat).setViewName("board/boardEnrollForm");
		return mv;
	}
	
	@ResponseBody
	@RequestMapping(value="insert.bo", produces="text/html; charset=utf-8")
	public String insertBoard(Board b, HttpServletRequest request,
								@RequestParam(name="uploadFile", required=false) MultipartFile[] file) {
		
		//System.out.println(b);
		//System.out.println(file.length);
		ArrayList<BoardAttachment> attachList = new ArrayList<>();
		
		if(file.length>0) { // 첨부파일이 있을 때
			String resources = request.getSession().getServletContext().getRealPath("resources"); 
			String savePath = resources + "\\boardUploadFiles\\";
			
			for(int i=0; i<file.length; i++) {
				BoardAttachment ba = new BoardAttachment();
				// System.out.println(file[i].getOriginalFilename());
				ba.setBaOriginName(file[i].getOriginalFilename());
				String changeName  = uploadFile(file[i],request);
				ba.setBaChangeName(changeName);
				ba.setBaFilePath(savePath + changeName);
				attachList.add(ba);
			}
			
			// System.out.println(attachList);
			
			int result = bService.insertBoard(b);
			if(result>0) { // 게시글 등록 성공 --> 첨부파일 DB에 넣기
				int result2 =0;
				for(BoardAttachment ba: attachList) {
					result2 = bService.insertBoardAttachment(ba);
				}
				if(result2>0) { // 첨부파일 등록 성공
					return "success";
				}else { // 첨부파일 등록 실패
					return "attachFail";
				}
			}else { // 게시글 등록 실패 --> 첨부파일들 다시 지우기
				for(BoardAttachment ba: attachList) {
					deleteFile(ba.getBaChangeName(), request);
				}
				return "insertFail";	
			}
			
		}else { // 첨부파일이 없을 때
			int result = bService.insertBoard(b);
			if(result>0) { // 게시글 등록 성공
				return "success";
			}else { // 게시글 등록 실패
				return "insertFail";
			}	
		}
		
	}
	
	public String uploadFile(MultipartFile file, HttpServletRequest request) {
		
		String resources = request.getSession().getServletContext().getRealPath("resources"); 
		String savePath = resources + "\\boardUploadFiles\\";
		
		String originName = file.getOriginalFilename();
		
		String currentTime = new SimpleDateFormat("yyyyMMddHHmmss").format(new Date());
		int ranNum = (int)(Math.random() * 90000+ 10000);
		
		String ext = originName.substring(originName.lastIndexOf(".")); //".jpg"
		
		String changeName = currentTime + ranNum + ext; // 20200522202011.jpg
		
		try {
			file.transferTo(new File(savePath + changeName));
			
		} catch (IllegalStateException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		return changeName;
		
	}
	
	public void deleteFile(String fileName, HttpServletRequest request) {
		String resources = request.getSession().getServletContext().getRealPath("resources"); 
		String savePath = resources + "\\boardUploadFiles\\";
		
		File deleteFile = new File(savePath + fileName);
		deleteFile.delete();
	}
}

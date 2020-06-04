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

import com.google.gson.GsonBuilder;
import com.kh.teamworks.board.model.service.BoardService;
import com.kh.teamworks.board.model.vo.Board;
import com.kh.teamworks.board.model.vo.BoardAttachment;
import com.kh.teamworks.board.model.vo.BoardDTO;
import com.kh.teamworks.board.model.vo.BoardLike;
import com.kh.teamworks.board.model.vo.BoardReply;
import com.kh.teamworks.board.model.vo.BoardReplyDTO;
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
	
	@RequestMapping("detail.bo")
	public String selectBoard(int bno, Model model) {
		
		// 조회수
		int result = bService.increaseCount(bno);
		
		if(result>0) { // 게시글 조회 성공
			// 첨부파일 조회
			ArrayList<BoardAttachment> attachList = bService.selectBoardAttachment(bno);
			BoardDTO b = bService.selectBoard(bno);
			
			model.addAttribute("attachList", attachList);
			model.addAttribute("b", b);
			return "board/boardDetailView";
			
		}else { // 게시글 조회 실패 
			model.addAttribute("msg", "게시글 조회 실패");
			return "common/errorPage";
		}
		
	}
	
	@ResponseBody
	@RequestMapping(value="confirmLike.bo", produces="text/html; charset=utf-8")
	public String confirmLike(BoardLike bl) {
		
		BoardLike like = bService.selectBoardLike(bl);

		if(like !=null) { // 이미추천함
			return "y";
		}else {
			return "n";
		}
	}
	
	@RequestMapping("delete.bo")
	public String deleteBoard(int bno,int cat, HttpServletRequest request, Model model) {
		//System.out.println(bno);
		
		int result1 = bService.deleteBoard(bno);
		
		if(result1>0) { // 게시판 삭제 성공
			ArrayList<BoardAttachment> attachList = bService.selectBoardAttachment(bno);
			if(attachList != null) { // 첨부파일이 있을 때
				for(BoardAttachment ba: attachList) {
					int result2= bService.deleteBoardAttachment(ba.getBdFileNo());
					deleteFile(ba.getBaChangeName(), request);
				}
			}
			
			return "redirect:list.bo?currentPage=1&cat="+ cat;
		}else {
			model.addAttribute("msg", "게시글 삭제 실패");
			return "common/erorrPage";
		}
		
	}
	
	@RequestMapping("updateForm.bo")
	public String boardUpdateForm(int bno, int cat, Model model) {
		BoardDTO b = bService.selectBoard(bno);
		ArrayList<BoardAttachment> attachList = bService.selectBoardAttachment(bno);
		model.addAttribute("attachList", attachList);
		model.addAttribute("b", b);
		model.addAttribute("cat", cat);
		return "board/boardUpdateForm";
	}
	
	@ResponseBody
	@RequestMapping(value="update.bo", produces="text/html; charset=utf-8")
	public String updateBoard(Board b, HttpServletRequest request, String[] deleteFiles,
			                  @RequestParam(name="uploadFile", required=false) MultipartFile[] file) {
		//System.out.println(deleteFiles);
		
		if(deleteFiles.length>0) { // 지워야할 예전 파일이 있다.
			for(int i=0; i<deleteFiles.length; i++) {
				int result2 = bService.updateBoardAttachment(deleteFiles[i]); // 첨부파일 디비 수정
				if(result2>0) {
					deleteFile(deleteFiles[i], request); // 서버에서 삭제
				}
			}
		}
		
		ArrayList<BoardAttachment> attachList = new ArrayList<>();
		if(file.length>0) { // 새로운 첨부파일이 있다.
			String resources = request.getSession().getServletContext().getRealPath("resources"); 
			String savePath = resources + "\\boardUploadFiles\\";
			
			for(int i=0; i<file.length; i++) {
				BoardAttachment ba = new BoardAttachment();
				// System.out.println(file[i].getOriginalFilename());
				ba.setBaOriginName(file[i].getOriginalFilename());
				String changeName  = uploadFile(file[i],request);
				ba.setBaChangeName(changeName);
				ba.setBaFilePath(savePath + changeName);
				ba.setRefBoardNo(b.getBoardNo());
				attachList.add(ba);
			}
		}
		
		int result = bService.updateBoard(b);
		if(result>0) { // 게시글 수정 성공 -->첨부파일 변경된 것 db에 올리기
				int result3 =0;
				for(BoardAttachment ba: attachList) {
					result3 = bService.updateBoardAttachment(ba);
				}
				if(result>0) {
					return "success";
				}else {
					return "fail";
				}
		}else { // 게시글 수정 실패 -- 서버 올린 첨부파일 삭제 
			for(BoardAttachment ba: attachList) {
				deleteFile(ba.getBaChangeName(), request);
			}
			return "fail";
		}
		
	}
	
	@ResponseBody
	@RequestMapping(value="like.bo", produces="text/html; charset=utf-8")
	public String likeBoard(BoardLike bl) {
		// 추천이 있는지 없는 지 조회 
		BoardLike like = bService.selectBoardLike(bl);
		if(like != null) { // 이미 추천을 한적 있음
			return "fail";
		}else { // 추천한적 없음
			int result1 = bService.increaseLike(bl);
			
			if(result1>0) {
				int result = bService.insertBoardLike(bl);
				
				if(result>0) {
					return "success";
				}else { // 테이블 insert실패
					return "none";
				}
			}else {
				return "fail";
			}
			
		}
	}
	
	@ResponseBody
	@RequestMapping(value="rlist.bo", produces="application/json; charset=utf-8")
	public String replyList(int bno) {
		//System.out.println(bno);
		ArrayList<BoardReplyDTO> list = bService.selectReplyList(bno);
		
		return new GsonBuilder().setDateFormat("yyyy-MM-dd HH:mm:ss").create().toJson(list);
	}
	
	@ResponseBody
	@RequestMapping(value="rinsert.bo", produces="text/html; charset=utf-8")
	public String insertReply(BoardReply r) {
		
		int result = bService.insertReply(r);
		if(result>0) {
			
			return "success"; 
		}else {
			
			return "fail"; 
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

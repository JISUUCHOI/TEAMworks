package com.kh.teamworks.schedule.controller;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.google.gson.JsonIOException;
import com.kh.teamworks.schedule.model.service.ScheduleService;
import com.kh.teamworks.schedule.model.vo.Schedule;

@Controller
public class ScheduleController {
	
	@Autowired
	public ScheduleService scService;
	
	
	// 전체 일정 리스트 조회용
	@RequestMapping("selectAllSch.sc")
	public ModelAndView selectAllSch(String empId, ModelAndView mv) {
		
		Calendar cal = Calendar.getInstance();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		String today = sdf.format(cal.getTime());
		
		ArrayList<Schedule> events = scService.selectAllSch(empId);
		
		mv.addObject("events", events);
		mv.addObject("today", today);
		mv.setViewName("schedule/allScheduleView");
		
		//System.out.println(events);
		
		return mv;
	}
	
	
	// 일정 상세 조회용
	@ResponseBody
	@RequestMapping(value="detail.sc", method=RequestMethod.POST)
	public void selectSchDetail(@RequestParam(value="schNo") int schNo, HttpServletResponse response) throws JsonIOException, IOException {
		
		Schedule sch = scService.selectSchDetail(schNo);
		
		//return new Gson().toJson(sch);
		response.setContentType("application/json; charset=utf-8");
		new Gson().toJson(sch, response.getWriter());
		
	}
	
	
	// 일정 삭제용
	@RequestMapping("deleteSch.sc")
	public String deleteSch(int schNo, String empId, HttpServletRequest request, Model model) {
		
		int result = scService.deleteSch(schNo);
		
		if(result > 0) { // 일정 삭제 성공
			
			return "redirect:selectAllSch.sc?empId=" + empId;
			
		}else {	// 일정 삭제 실패
			
			model.addAttribute("msg", "실패");
			return "common/errorPage"; 
		}
	}

}

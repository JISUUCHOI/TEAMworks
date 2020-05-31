package com.kh.teamworks.schedule.controller;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.kh.teamworks.schedule.model.service.ScheduleService;
import com.kh.teamworks.schedule.model.vo.Schedule;

@Controller
public class ScheduleController {
	
	@Autowired
	public ScheduleService scService;
	
	
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
	
	
	@ResponseBody
	@RequestMapping(value="detail.sc", produces="application/json; charset=utf-8", method=RequestMethod.POST)
	public String selectSchDetail(int schNo) {
		
		ArrayList<Schedule> sch = scService.selectSchDetail(schNo);
		
		return new Gson().toJson(sch);
	}

}

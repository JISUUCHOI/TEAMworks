package com.kh.teamworks.schedule.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.kh.teamworks.schedule.model.service.ScheduleService;
import com.kh.teamworks.schedule.model.vo.Schedule;

@Controller
public class ScheduleController {
	
	@Autowired
	public ScheduleService scService;
	
	
	@RequestMapping("selectAllSch.sc")
	public ModelAndView selectAllSch(ModelAndView mv) {
		
		ArrayList<Schedule> events = scService.selectAllSch();
		
		mv.addObject("events", events);
		mv.setViewName("schedule/allScheduleView");
		
		return mv;
	}

}

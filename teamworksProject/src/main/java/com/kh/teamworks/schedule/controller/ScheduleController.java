package com.kh.teamworks.schedule.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.kh.teamworks.schedule.model.service.ScheduleService;

@Controller
public class ScheduleController {
	
	@Autowired
	public ScheduleService scService;
	
	
	@RequestMapping("selectAllSch.sc")
	public ModelAndView selectAllSch(ModelAndView mv) {
		
		mv.setViewName("schedule/allScheduleView");
		
		return mv;
	}

}

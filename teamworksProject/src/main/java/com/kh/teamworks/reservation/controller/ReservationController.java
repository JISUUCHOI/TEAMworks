package com.kh.teamworks.reservation.controller;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.kh.teamworks.reservation.model.service.ReservationService;
import com.kh.teamworks.reservation.model.vo.Reservation;

@Controller
public class ReservationController {

	@Autowired
	public ReservationService reService;

	@RequestMapping("selectList.re")
	public ModelAndView selectReservationList(int dayIndex, ModelAndView mv) {

		Calendar cal = Calendar.getInstance(); 
		cal.setTime(new Date()); 
		DateFormat df = new SimpleDateFormat("yyyy.MM.dd");
		
		cal.add(Calendar.DATE, -3);
		
		String today = ""; 
		String[] days = new String[7]; 
		for(int i=0; i<days.length; i++) { 
			days[i] = new String(df.format(cal.getTime())); 
			cal.add(Calendar.DATE, 1);
		 
			if(i == dayIndex) { 
				today = days[i]; 
			} 
		}
		

		ArrayList<Reservation> list = reService.selectReservationList(today);

		mv.addObject("list", list);
		mv.addObject("today", today);
		mv.addObject("days", days);
		mv.addObject("dayIndex", dayIndex);
		mv.setViewName("reservation/reservationList");
		

		return mv;
	}

	@ResponseBody
	@RequestMapping(value = "selectDayRes.re", produces = "application/json; charset=utf-8")
	public String selectDayReservation(int dayIndex, Model model) {
		
		Calendar cal = Calendar.getInstance(); 
		cal.setTime(new Date()); 
		DateFormat df = new SimpleDateFormat("yyyy.MM.dd");
		
		cal.add(Calendar.DATE, -3);
		
		String today = ""; 
		String[] days = new String[7]; 
		for(int i=0; i<days.length; i++) { 
			days[i] = new String(df.format(cal.getTime())); 
			cal.add(Calendar.DATE, 1);
		 
			if(i == dayIndex) { 
				today = days[i]; 
			} 
		}
		

		ArrayList<Reservation> dayList = reService.selectDayReservation(today);

		return new Gson().toJson(dayList);
	}

	@RequestMapping("myResList.re")
	public ModelAndView selectMyReservationList(String empId, ModelAndView mv) {

		ArrayList<Reservation> list = reService.selectMyReservationList(empId);

		mv.addObject("list", list);
		mv.setViewName("reservation/myReservation");

		System.out.println(list);

		return mv;
	}

}

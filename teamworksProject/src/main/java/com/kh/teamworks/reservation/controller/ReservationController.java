package com.kh.teamworks.reservation.controller;

import java.util.Date;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

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
        	
//        	System.out.println(days[i]);
        }
        
        
		ArrayList<Reservation> list = reService.selectReservationList(today);
		
		mv.addObject("list", list);
		mv.addObject("today", today);
//		mv.addObject("days", days);
		mv.setViewName("reservation/reservationList");
		
		/*
		 * for(int i=0; i<list.size(); i++) {
		 * if(list.get(i).getReservationDate().equals(days[3])) {
		 * System.out.println(list.get(i)); } }
		 */


		return mv;
	}
	
	
	@RequestMapping("selectDayRes.re")
	public ModelAndView selectDayReservation(String day, ModelAndView mv) {
		
		ArrayList<Reservation> dayList = reService.selectDayReservation(day);
		
		mv.addObject("dayList", dayList);
		mv.setViewName("reservation/reservationList");
		
		return mv;
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

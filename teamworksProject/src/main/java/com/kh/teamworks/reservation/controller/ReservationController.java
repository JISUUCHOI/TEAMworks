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
	public ModelAndView selectReservationList(ModelAndView mv) {
		
		Calendar cal = Calendar.getInstance();
		cal.setTime(new Date());
        DateFormat df = new SimpleDateFormat("yyyy.MM.dd");
        
        String today = df.format(cal.getTime());

//        cal.add(Calendar.MONTH, 2);
//        cal.add(Calendar.DATE, -3);
//        System.out.println("after: " + df.format(cal.getTime()));

		ArrayList<Reservation> list = reService.selectReservationList();

		mv.addObject("list", list);
		mv.addObject("cal", cal);
		mv.setViewName("reservation/reservationList");
		
		System.out.println("today : " + today);
		
		cal.add(Calendar.DATE, -3);
		
		System.out.println("3일 전 : " + today);

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

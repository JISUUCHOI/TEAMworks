package com.kh.teamworks.reservation.controller;

import java.util.ArrayList;

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
		
		ArrayList<Reservation> list = reService.selectReservationList();
		
		mv.addObject("list", list);
		mv.setViewName("reservation/reservationList");
		
		return mv;
	}
	
	
	/*
	 * @RequestMapping("myResList.re") public ModelAndView
	 * selectMyReservationList(ModelAndView mv) {
	 * 
	 * ArrayList<Reservation> list = reService.selectMyReservationList(empId); }
	 */

}

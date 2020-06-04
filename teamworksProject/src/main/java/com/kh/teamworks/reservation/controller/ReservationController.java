package com.kh.teamworks.reservation.controller;

import java.io.IOException;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

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
import com.kh.teamworks.reservation.model.service.ReservationService;
import com.kh.teamworks.reservation.model.vo.Reservation;
import com.kh.teamworks.reservation.model.vo.ReservationDto;

@Controller
public class ReservationController {

	@Autowired
	public ReservationService reService;

	@RequestMapping("selectList.re")
	public ModelAndView selectReservationList(ModelAndView mv) {

		
		  Calendar cal = Calendar.getInstance(); 
		  cal.setTime(new Date()); 
		  DateFormat df = new SimpleDateFormat("yyyy-MM-dd");
		  DateFormat dowf = new SimpleDateFormat("(EEE)");
		  
		  String currentDate = df.format(cal.getTime());
		  String dayOfWeek = dowf.format(cal.getTime());
		  
		  ArrayList<Reservation> list = reService.selectReservationList(currentDate);
		  
		  ReservationDto rdto = new ReservationDto(list, currentDate, dayOfWeek);
		  
		  mv.addObject("rdto", rdto);
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
	
	
	// 공유해서 쓸 수 있게끔 따로 정의해놓은 메소드
	// 이전 버튼 클릭 시 하루 전 날짜로 예약 리스트 재 조회 후 리스트와 날짜를 리턴하는 메소드
	@ResponseBody
	@RequestMapping(value="reSelectAbs.re", method=RequestMethod.POST)
	public void absAday(@RequestParam(value="currentDate") String currentDate, HttpSession session, HttpServletResponse response) throws JsonIOException, IOException {

		Calendar cal = Calendar.getInstance();

		cal.set(Calendar.YEAR, Integer.parseInt(currentDate.substring(0, 4)));
		cal.set(Calendar.MONTH, Integer.parseInt(currentDate.substring(5, 7)) - 1);
		cal.set(Calendar.DATE, Integer.parseInt(currentDate.substring(8, 10)) - 1);
		
		DateFormat df = new SimpleDateFormat("yyyy-MM-dd");
		DateFormat dowf = new SimpleDateFormat("(EEE)");
		  
		currentDate = df.format(cal.getTime());
		String dayOfWeek = dowf.format(cal.getTime());
		
		ArrayList<Reservation> list = reService.selectReservationList(currentDate);
		  
		ReservationDto rdto = new ReservationDto(list, currentDate, dayOfWeek);
		
		response.setContentType("application/json; charset=utf-8");
		new Gson().toJson(rdto, response.getWriter());
	}
	
	
	// 다음 버튼 클릭 시 하루 뒤 날짜로 예약 리스트 재 조회 후 리스트와 날짜를 리턴하는 메소드
	@ResponseBody
	@RequestMapping(value="reSelectAdd.re", method=RequestMethod.POST)
	public void addAday(@RequestParam(value="currentDate") String currentDate, HttpSession session, HttpServletResponse response) throws JsonIOException, IOException {

		Calendar cal = Calendar.getInstance();

		cal.set(Calendar.YEAR, Integer.parseInt(currentDate.substring(0, 4)));
		cal.set(Calendar.MONTH, Integer.parseInt(currentDate.substring(5, 7)) - 1);
		cal.set(Calendar.DATE, Integer.parseInt(currentDate.substring(8, 10)) + 1);
		
		DateFormat df = new SimpleDateFormat("yyyy-MM-dd");
		DateFormat dowf = new SimpleDateFormat("(EEE)");
		  
		currentDate = df.format(cal.getTime());
		String dayOfWeek = dowf.format(cal.getTime());
		
		ArrayList<Reservation> list = reService.selectReservationList(currentDate);
		  
		ReservationDto rdto = new ReservationDto(list, currentDate, dayOfWeek);
		
		response.setContentType("application/json; charset=utf-8");
		new Gson().toJson(rdto, response.getWriter());
	}

}

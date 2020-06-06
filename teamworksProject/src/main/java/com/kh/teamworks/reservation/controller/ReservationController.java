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
	
	
	// 메뉴바에서 예약 버튼 클릭 시 reservationList.jsp 보여주는 메소드
	@RequestMapping("showListView.re")
	public String showListView() {
		
		return "reservation/reservationList";
	}

	
	// 예약 현황 조회용
	// reservationList.jsp 페이지 로딩 시 ajax로 날짜 및 예약 리스트 보내는 메소드
	@ResponseBody
	@RequestMapping(value="selectList.re", method=RequestMethod.POST)
	public void selectReservationList(HttpServletResponse response) throws JsonIOException, IOException {

		
		  Calendar cal = Calendar.getInstance(); 
		  cal.setTime(new Date()); 
		  DateFormat df = new SimpleDateFormat("yyyy-MM-dd");
		  DateFormat dowf = new SimpleDateFormat("(EEE)");
		  
		  String currentDate = df.format(cal.getTime());
		  String dayOfWeek = dowf.format(cal.getTime());
		  
		  ArrayList<Reservation> list = reService.selectReservationList(currentDate);
		  
		  ReservationDto rdto = new ReservationDto(list, currentDate, dayOfWeek);
		  
		  response.setContentType("application/json; charset=utf-8");
		  new Gson().toJson(rdto, response.getWriter());
	}

	
	// 예약 상세 조회용
	@ResponseBody
	@RequestMapping(value="selectDetail.re", method=RequestMethod.POST)
	public void selectReservation(Reservation r, HttpServletResponse response) throws JsonIOException, IOException {
		
		Reservation detail = reService.selectReservation(r);
		
//		System.out.println(r); // roomNo=2, reservationDate=2020-06-05, startTime=07
		response.setContentType("application/json; charset=utf-8");
		new Gson().toJson(detail, response.getWriter());
	}
	
	
	// 나의 예약 목록 조회용
	@RequestMapping("myResList.re")
	public ModelAndView selectMyReservationList(String empId, ModelAndView mv) {
		
		ArrayList<Reservation> list = reService.selectMyReservationList(empId);
		
		mv.addObject("list", list);
		mv.setViewName("reservation/myReservation");
		
		//System.out.println(list);
		
		return mv;
	}
	
	
	// 예약 추가용
	@RequestMapping("insert.re")
	public String insertReservation(Reservation r, HttpSession session, Model model) {
		
		int result = reService.insertReservation(r);
		
		if(result > 0) { // 예약 추가 성공 --> 나의 예약 목록 페이지로
			
			session.setAttribute("msg", "회의실이 예약되었습니다.");
			return "redirect:myResList.re?empId=" + r.getEmpId();
			
		}else {	// 예약 추가 실패 --> 에러페이지
			
			model.addAttribute("msg", "예약 추가에 실패했습니다. 다시 시도해주세요.");
			return "common/errorPage";
		}
	}
	
	
	// 예약 취소용
	@RequestMapping("cancel.re")
	public String cancelReservation(String empId, int reservationNo, HttpSession session, Model model) {
		
		int result = reService.cancelReservation(reservationNo);
		
		if(result > 0) { // 예약 취소 성공 --> 다시 나의 예약 목록 페이지
			
			session.setAttribute("msg", "예약이 취소되었습니다.");
			return "redirect:myResList.re?empId=" + empId;
			
		}else { // 예약 취소 실패 --> 에러페이지
			
			model.addAttribute("msg", "예약에 실패했습니다. 다시 시도해주세요.");
			return "common/errorPage";
		}
	}
	
	
	// 예약 사용 완료 처리용
	@RequestMapping("complete.re")
	public String completeReservation(String empId, int reservationNo, HttpSession session, Model model) {
		
		int result = reService.completeReservation(reservationNo);
		
		if(result > 0) { // 예약 취소 성공 --> 다시 나의 예약 목록 페이지
			
			session.setAttribute("msg", "예약 상태가 완료 처리되었습니다.");
			return "redirect:myResList.re?empId=" + empId;
			
		}else { // 예약 취소 실패 --> 에러페이지
			
			model.addAttribute("msg", "예약 상태 변경에 실패했습니다. 다시 시도해주세요.");
			return "common/errorPage";
		}
	}
	
	
	// 공유해서 쓸 수 있게끔 따로 정의해놓은 메소드
	// 이전 버튼 클릭 시 하루 전 날짜로 예약 리스트 재 조회 후 리스트와 날짜를 리턴하는 메소드
	@ResponseBody
	@RequestMapping(value="reSelectAbs.re", method=RequestMethod.POST)
	public void absAday(@RequestParam(value="currentDate") String currentDate, HttpServletResponse response) throws JsonIOException, IOException {

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
	
	// 공유해서 쓸 수 있게끔 따로 정의해놓은 메소드
	// 다음 버튼 클릭 시 하루 뒤 날짜로 예약 리스트 재 조회 후 리스트와 날짜를 리턴하는 메소드
	@ResponseBody
	@RequestMapping(value="reSelectAdd.re", method=RequestMethod.POST)
	public void addAday(@RequestParam(value="currentDate") String currentDate, HttpServletResponse response) throws JsonIOException, IOException {

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

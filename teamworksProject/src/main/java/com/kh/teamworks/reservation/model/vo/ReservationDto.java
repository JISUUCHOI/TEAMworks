package com.kh.teamworks.reservation.model.vo;

import java.util.ArrayList;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Setter
@Getter
@NoArgsConstructor
@AllArgsConstructor
@ToString
public class ReservationDto {
	
	private ArrayList<Reservation> list;
	private String currentDate;
	private String dayOfWeek;

}

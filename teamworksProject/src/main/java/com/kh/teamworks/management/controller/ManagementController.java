package com.kh.teamworks.management.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.kh.teamworks.management.model.service.ManagementService;

@Controller
public class ManagementController {
	
	@Autowired
	private ManagementService mgService;
	
}
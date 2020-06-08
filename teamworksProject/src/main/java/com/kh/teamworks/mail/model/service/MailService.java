package com.kh.teamworks.mail.model.service;

import java.util.ArrayList;

import com.kh.teamworks.common.model.vo.PageInfo;
import com.kh.teamworks.mail.model.vo.MailDTO;

public interface MailService {
	
	int selectInboxListCount(String empId);
	ArrayList<MailDTO> selectInboxList(PageInfo pi, String empId);
}

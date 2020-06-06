package com.kh.teamworks.mail.model.vo;

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
public class ImportMail {
	private String from;
    private ArrayList<String> to = new ArrayList<String>();
    private ArrayList<String> cc = new ArrayList<String>();
    private ArrayList<String> bcc = new ArrayList<String>();
    private ArrayList<String> file = new ArrayList<String>();
    
    public String subject;
    public String content;
    public String entryDate;
    
}

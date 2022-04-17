package com.study.springboot.dto;

import java.util.Date;

import lombok.Data;

//lombok
@Data
public class One2one_replyDto {
	private int reply_idx; 
	private String reply_title; 
	private String reply_content;  
	private Date reply_date; 
	private int reply_member_idx;
	private int reply_one2one_idx; 
	private String member_name; 
}

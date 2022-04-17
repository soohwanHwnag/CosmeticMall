package com.study.springboot.dto;

import java.util.Date;

import lombok.Data;

//lombok
@Data
public class One2oneDto {
	private int one2one_idx;
	private String one2one_category; 
	private String one2one_title;  
	private String one2one_content;   
	private Date one2one_date;
	private String one2one_reply_YN; 
	private int one2one_member_idx; 
	private String member_name; 
}

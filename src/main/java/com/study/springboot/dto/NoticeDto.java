package com.study.springboot.dto;

import java.util.Date;

import lombok.Data;

//lombok
@Data
public class NoticeDto {
	private int notice_idx;
	private String notice_title;
	private String notice_content;
	private Date notice_date;
	private int notice_hit;
	private String notice_important_YN;
	private int notice_member_idx;
	private String member_name;
}

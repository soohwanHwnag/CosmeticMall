package com.study.springboot.dto;

import java.util.Date;

import lombok.Data;

//lombok
@Data
public class EventDto {
	private int event_idx;
	private String event_title;
	private String event_slogan;
	private Date event_start_date;
	private Date event_end_date;
	private String event_banner_filename;
	private String event_detail_filename;
	private Date event_date;
	private int event_hit;
	private int event_member_idx;
	private String event_finish;
	
}

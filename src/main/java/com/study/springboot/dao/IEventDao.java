package com.study.springboot.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.study.springboot.dto.EventDto;

@Mapper
public interface IEventDao {

	public List<EventDto> eventList(String event_finish,String page_start,String page_end);
	
	public List<EventDto> eventList_both_total(String event_finish,String page_start,String page_end,String value);
	
	public List<EventDto> eventList_both_title(String event_finish,String page_start,String page_end,String value);
	
	public List<EventDto> eventList_both_slogan(String event_finish,String page_start,String page_end,String value);
		
	public int count(String event_finish);
	
	public int count_both_total(String event_finish,String value);
	
	public int count_both_title(String event_finish,String value);
	
	public int count_both_slogan(String event_finish,String value);
	
	public int eventJoinAction(String event_title,String event_slogan,
			String event_start_date,String event_end_date,
			String event_detail_filename,String upload_url,String member_idx);
	
	public int eventListMove(String check);
	
	public int eventListDelete(String check);
	
	public EventDto dto(String event_idx);
	
	public int eventModifyAction(String event_idx,String event_title,String event_slogan,
			String event_start_date,String event_end_date,
			String event_detail_filename,String upload_url);
	
	public int eventDeleteAction(String event_idx);
}

package com.study.springboot.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.study.springboot.dao.IEventDao;
import com.study.springboot.dto.EventDto;

@Service
public class EventService {
	
	@Autowired
	private IEventDao eventDao;
	

	public List<EventDto> eventList(String event_finish,String page_start, String page_end){
		List<EventDto> eventList= eventDao.eventList(event_finish,page_start,page_end);
		
		return eventList;
	}
	
	public List<EventDto> eventList_both(String event_finish,String page_start, String page_end,String category,String value){
		List<EventDto> eventList1=null;
		if(category.equals("event_title")) {
			eventList1=eventDao.eventList_both_title(event_finish,page_start,page_end,value);
		}
		if(category.equals("event_slogan")) {
			eventList1=eventDao.eventList_both_slogan(event_finish,page_start,page_end,value);
		}
		if(category.equals("total")) {
			eventList1=eventDao.eventList_both_total(event_finish,page_start,page_end,value);
		}
		
		return eventList1;
	}
	
	public int count(String event_finish) {
		int count = eventDao.count(event_finish);
		return count;
	}
	
	public int count_both(String event_finish,String category, String value) {
		int count = 0;
		
		if(category.equals("event_title")) {
			count=eventDao.count_both_title(event_finish,value);
		}
		if(category.equals("event_slogan")) {
			count=eventDao.count_both_slogan(event_finish,value);
		}
		if(category.equals("total")) {
			count=eventDao.count_both_total(event_finish,value);
		}
		return count;
	}
	
	public int eventJoinAction(String event_title,String event_slogan,
			String event_start_date,String event_end_date,
			String event_detail_filename,String upload_url,String member_idx) {
		
		int result = eventDao.eventJoinAction(event_title,event_slogan,
													event_start_date,event_end_date,
													event_detail_filename,upload_url,member_idx);
		if(result == 1) {
			return 1;
		}
		return 0;
	}
	
	public int eventListMove(String check) {
		int result = eventDao.eventListMove(check);
		if(result == 1) {
			return 1;
		}
		return 0;
	}
	
	public int eventListDelete(String check) {
		int result = eventDao.eventListDelete(check);
		if(result == 1) {
			return 1;
		}
		return 0;
	}
	
	public EventDto dto(String event_idx) {
		EventDto dto = eventDao.dto(event_idx);
		return dto;
	}
	
	public int eventModifyAction(String event_idx,String event_title,String event_slogan,
			String event_start_date,String event_end_date,
			String event_detail_filename,String upload_url) {
		
		int result = eventDao.eventModifyAction(event_idx,event_title,event_slogan,
													event_start_date,event_end_date,
													event_detail_filename,upload_url);
		if(result == 1) {
			return 1;
		}
		return 0;
	}
	
	public int eventDeleteAction(String event_idx) {
		int result = eventDao.eventDeleteAction(event_idx);
		if(result == 1) {
			return 1;
		}
		return 0;
	}
}

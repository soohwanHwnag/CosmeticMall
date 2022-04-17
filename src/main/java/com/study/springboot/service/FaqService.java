package com.study.springboot.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.study.springboot.dao.IFaqDao;
import com.study.springboot.dto.FaqDto;

@Service
public class FaqService {
	
	@Autowired
	private IFaqDao faqDao;
	
	public List<FaqDto> faq_list_t(String start, String end){
		List<FaqDto> faq_event_list= faqDao.faq_list_t(start, end);
		return faq_event_list;
	}
	
	public List<FaqDto> faq_list_t_v(String value,String start, String end){
		List<FaqDto> faq_event_list= faqDao.faq_list_t_v(value,start, end);
		return faq_event_list;
	}
	
	public List<FaqDto> faq_list(String faqCategory,String start, String end){
		List<FaqDto> faq_event_list= faqDao.faq_list(faqCategory,start, end);
		return faq_event_list;
	}
	public List<FaqDto> faq_list_v(String faqCategory,String value,String start, String end){
		List<FaqDto> faq_event_list= faqDao.faq_list_v(faqCategory,value,start, end);
		return faq_event_list;
	}
	
	public int count_t_v(String value) {
		int count_t_v = faqDao.count_t_v(value);
		return count_t_v;
	}
	
	public int count_t() {
		int count_t = faqDao.count_t();
		return count_t;
	}
	
	public int count_v(String faqCategory,String value) {
		int count_v = faqDao.count_v(faqCategory,value);
		return count_v;
	}
	
	public int count(String faqCategory) {
		int count = faqDao.count(faqCategory);
		return count;
	}
	
	public int faq_write(String select,String title,String content,String member_idx) {
		int result =faqDao.faq_write(select,title,content,member_idx);
		return result;
	}
	
	public int faq_update(String select,String title,String content,String member_idx,String faq_idx) {
		int result =faqDao.faq_update(select,title,content,member_idx,faq_idx);
		return result;
	}
	
	public int faq_delete(String faq_idx) {
		int result =faqDao.faq_delete(faq_idx);
		return result;
	}
	
	public FaqDto dto(String faq_idx) {
		FaqDto dto = faqDao.dto(faq_idx);
		return dto;
	}
}

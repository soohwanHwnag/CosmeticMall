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
	
	public List<FaqDto> faq_list(String faqCategory){
		List<FaqDto> faq_event_list= faqDao.faq_list(faqCategory);
		return faq_event_list;
	}
	public List<FaqDto> faq_list_v(String faqCategory,String value){
		List<FaqDto> faq_event_list= faqDao.faq_list_v(faqCategory,value);
		return faq_event_list;
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

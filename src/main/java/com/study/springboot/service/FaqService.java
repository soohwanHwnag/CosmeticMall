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
}

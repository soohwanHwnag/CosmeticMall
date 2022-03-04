package com.study.springboot.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.study.springboot.dao.IFaqDao;

@Service
public class FaqService {
	@Autowired
	private IFaqDao faqDao;
}

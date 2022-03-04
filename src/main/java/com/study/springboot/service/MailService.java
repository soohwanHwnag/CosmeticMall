package com.study.springboot.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.study.springboot.dao.IMailDao;

@Service
public class MailService {
	@Autowired
	private IMailDao mailDao;
}

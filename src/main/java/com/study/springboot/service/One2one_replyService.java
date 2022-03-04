package com.study.springboot.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.study.springboot.dao.IOne2one_replyDao;

@Service
public class One2one_replyService {
	@Autowired
	private IOne2one_replyDao one2one_replyDao;
}

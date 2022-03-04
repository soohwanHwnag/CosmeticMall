package com.study.springboot.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.study.springboot.dao.INoticeDao;

@Service
public class NoticeService {
	@Autowired
	private INoticeDao noticeDao;
}

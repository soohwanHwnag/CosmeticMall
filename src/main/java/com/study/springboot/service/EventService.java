package com.study.springboot.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.study.springboot.dao.IEventDao;

@Service
public class EventService {
	@Autowired
	private IEventDao eventDao;
}

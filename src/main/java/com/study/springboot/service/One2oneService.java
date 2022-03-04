package com.study.springboot.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.study.springboot.dao.IOne2oneDao;

@Service
public class One2oneService {
	@Autowired
	private IOne2oneDao one2oneDao;
}

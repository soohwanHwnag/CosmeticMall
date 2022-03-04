package com.study.springboot.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.study.springboot.dao.IReturnDao;

@Service
public class ReturnService {
	@Autowired
	private IReturnDao returnDao;
}

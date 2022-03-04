package com.study.springboot.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.study.springboot.dao.IReturn_imageDao;

@Service
public class Return_imageService {
	@Autowired
	private IReturn_imageDao return_imageDao;
}

package com.study.springboot.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.study.springboot.dao.IReview_imageDao;

@Service
public class Review_imageService {
	@Autowired
	private IReview_imageDao review_imageDao;
}

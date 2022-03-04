package com.study.springboot.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.study.springboot.dao.IReviewDao;

@Service
public class ReviewService {
	@Autowired
	private IReviewDao reviewDao;
}

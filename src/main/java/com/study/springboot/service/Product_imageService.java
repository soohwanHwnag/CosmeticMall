package com.study.springboot.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.study.springboot.dao.IProduct_imageDao;

@Service
public class Product_imageService {
	@Autowired
	private IProduct_imageDao product_imageDao;
}

package com.study.springboot.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.study.springboot.dao.IProductDao;

@Service
public class ProductService {
	@Autowired
	private IProductDao productDao;
}

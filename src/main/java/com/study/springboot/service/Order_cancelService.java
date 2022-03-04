package com.study.springboot.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.study.springboot.dao.IOrder_cancelDao;

@Service
public class Order_cancelService {
	@Autowired
	private IOrder_cancelDao order_cancelDao;
}

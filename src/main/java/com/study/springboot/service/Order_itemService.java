package com.study.springboot.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.study.springboot.dao.IOrder_itemDao;

@Service
public class Order_itemService {
	@Autowired
	private IOrder_itemDao order_itemDao;
}

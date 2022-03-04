package com.study.springboot.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.study.springboot.dao.IOrder_listDao;

@Service
public class Order_listService {
	@Autowired
	private IOrder_listDao order_listDao;
}

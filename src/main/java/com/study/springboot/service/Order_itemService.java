package com.study.springboot.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.study.springboot.dao.IOrder_itemDao;

@Service
public class Order_itemService {
	@Autowired
	IOrder_itemDao order_itemDao;
	
	public int add(String product_n,String cart_total_price_n,String cart_count_n,String product_shipping_fee_n,String seq) {
		int result= order_itemDao.add(product_n,cart_total_price_n,cart_count_n,product_shipping_fee_n,seq);
		return result;
	}
}

package com.study.springboot.dao;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface IOrder_itemDao {

	public int add(String product_n,String cart_total_price_n,String cart_count_n,String product_shipping_fee_n,String seq);
}

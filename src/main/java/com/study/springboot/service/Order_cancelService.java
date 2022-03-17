package com.study.springboot.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.study.springboot.dao.IOrder_cancelDao;
import com.study.springboot.dto.Order_cancelDto;

@Service
public class Order_cancelService {
	

	@Autowired
	IOrder_cancelDao Iorder_cancelDao;
	
	public List<Order_cancelDto> orderCancelList(String page_start,String page_end,String status){
		List<Order_cancelDto> orderList = Iorder_cancelDao.orderCancelList(page_start,page_end,status);
		return orderList;
	}
	
	public List<Order_cancelDto> orderCancelList_date(String orderStartDate, String orderEndDate,String page_start,String page_end,String status){
		List<Order_cancelDto> orderList = Iorder_cancelDao.orderCancelList_date(orderStartDate,orderEndDate,page_start,page_end,status);
		return orderList;
	}
	
	public List<Order_cancelDto> orderCancelList_value(String category,String value,String page_start,String page_end,String status){
		List<Order_cancelDto> orderList = null;
		if(category.equals("total")) {
			orderList = Iorder_cancelDao.orderCancelList_value_total(value,page_start,page_end,status);
		}
		if(category.equals("order_number")) {
			orderList = Iorder_cancelDao.orderCancelList_value_order_number(value,page_start,page_end,status);
		}
		if(category.equals("product_name")) {
			orderList = Iorder_cancelDao.orderCancelList_value_product_name(value,page_start,page_end,status);
		}
		if(category.equals("member_name")) {
			orderList = Iorder_cancelDao.orderCancelList_value_member_name(value,page_start,page_end,status);
		}
		return orderList;
	}
	
	public List<Order_cancelDto> orderCancelList_both(String orderStartDate, String orderEndDate,String category,String value,String page_start,String page_end,String status){
		List<Order_cancelDto> orderList = null;
		if(category.equals("total")) {
			orderList = Iorder_cancelDao.orderCancelList_both_total(orderStartDate,orderEndDate,value,page_start,page_end,status);
		}
		if(category.equals("order_number")) {
			orderList = Iorder_cancelDao.orderCancelList_both_order_number(orderStartDate,orderEndDate,value,page_start,page_end,status);
		}
		if(category.equals("product_name")) {
			orderList = Iorder_cancelDao.orderCancelList_both_product_name(orderStartDate,orderEndDate,value,page_start,page_end,status);
		}
		if(category.equals("member_name")) {
			orderList = Iorder_cancelDao.orderCancelList_both_member_name(orderStartDate,orderEndDate,value,page_start,page_end,status);
		}
		return orderList;
	}
	
	
	public int  count_d(String orderStartDate, String orderEndDate,String status) {
		int count = Iorder_cancelDao.count_d(orderStartDate,orderEndDate,status);
		return count;
	}
	public int  count_v(String category,String value,String status) {
		int count = 0;
		if(category.equals("total")) {
			count = Iorder_cancelDao.count_v_t(value,status);
		}
		if(category.equals("order_number")) {
			count = Iorder_cancelDao.count_v_n(value,status);
			}
		if(category.equals("product_name")) {
			count = Iorder_cancelDao.count_v_p(value,status);
			}
		if(category.equals("member_name")) {
			count = Iorder_cancelDao.count_v_m(value,status);
			}
		return count;
	}
	public int  count_b(String orderStartDate, String orderEndDate,String category,String value,String status) {
		int count = 0;
		if(category.equals("total")) {
			count = Iorder_cancelDao.count_b_t(orderStartDate,orderEndDate,value,status);
		}
		if(category.equals("order_number")) {
			count = Iorder_cancelDao.count_b_n(orderStartDate,orderEndDate,value,status);
			}
		if(category.equals("product_name")) {
			count = Iorder_cancelDao.count_b_p(orderStartDate,orderEndDate,value,status);
			}
		if(category.equals("member_name")) {
			count = Iorder_cancelDao.count_b_m(orderStartDate,orderEndDate,value,status);
			}
		return count;
	}
	public int  count(String status) {
		int count = Iorder_cancelDao.count(status);
		return count;
	}
	
	public int orderCancelListMove(String check) {
		int result=Iorder_cancelDao.orderCancelListMove(check);
		return result;
	}
	
}

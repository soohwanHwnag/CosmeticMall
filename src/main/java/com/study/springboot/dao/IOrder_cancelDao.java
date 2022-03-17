package com.study.springboot.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.study.springboot.dto.Order_cancelDto;

@Mapper
public interface IOrder_cancelDao {
	
public List<Order_cancelDto> orderCancelList_date(String orderStartDate, String orderEndDate,String page_start,String page_end,String status);
	
	public List<Order_cancelDto> orderCancelList_value_total(String value,String page_start,String page_end,String status);
	
	public List<Order_cancelDto> orderCancelList_value_order_number(String value,String page_start,String page_end,String status);
	
	public List<Order_cancelDto> orderCancelList_value_product_name(String value,String page_start,String page_end,String status);
	
	public List<Order_cancelDto> orderCancelList_value_member_name(String value,String page_start,String page_end,String status);
	
	public List<Order_cancelDto> orderCancelList_both_total(String orderStartDate, String orderEndDate,String value,String page_start,String page_end,String status);
	
	public List<Order_cancelDto> orderCancelList_both_order_number(String orderStartDate, String orderEndDate,String value,String page_start,String page_end,String status);
	
	public List<Order_cancelDto> orderCancelList_both_product_name(String orderStartDate, String orderEndDate,String value,String page_start,String page_end,String status);
	
	public List<Order_cancelDto> orderCancelList_both_member_name(String orderStartDate, String orderEndDate,String value,String page_start,String page_end,String status);
	
	public List<Order_cancelDto> orderCancelList(String page_start,String page_end,String status);
	
	public int count(String status);
	public int count_d(String orderStartDate, String orderEndDate,String status);
	public int count_v_t(String value,String status);
	public int count_v_n(String value,String status);
	public int count_v_p(String value,String status);
	public int count_v_m(String value,String status);
	public int count_b_t(String orderStartDate, String orderEndDate,String value,String status);
	public int count_b_n(String orderStartDate, String orderEndDate,String value,String status);
	public int count_b_p(String orderStartDate, String orderEndDate,String value,String status);
	public int count_b_m(String orderStartDate, String orderEndDate,String value,String status);
	
	public int orderCancelListMove(String check);
}

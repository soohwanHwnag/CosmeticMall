package com.study.springboot.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.study.springboot.dto.MemberDto;
import com.study.springboot.dto.Order_itemDto;
import com.study.springboot.dto.Order_listDto;

@Mapper
public interface IOrder_listDao {
	
	public List<Order_listDto> orderList_date(String orderStartDate, String orderEndDate,String page_start,String page_end);
	
	public List<Order_listDto> orderList_value_total(String value,String page_start,String page_end);
	
	public List<Order_listDto> orderList_value_order_number(String value,String page_start,String page_end);
	
	public List<Order_listDto> orderList_value_product_name(String value,String page_start,String page_end);
	
	public List<Order_listDto> orderList_value_member_name(String value,String page_start,String page_end);
	
	public List<Order_listDto> orderList_both_total(String orderStartDate, String orderEndDate,String value,String page_start,String page_end);
	
	public List<Order_listDto> orderList_both_order_number(String orderStartDate, String orderEndDate,String value,String page_start,String page_end);
	
	public List<Order_listDto> orderList_both_product_name(String orderStartDate, String orderEndDate,String value,String page_start,String page_end);
	
	public List<Order_listDto> orderList_both_member_name(String orderStartDate, String orderEndDate,String value,String page_start,String page_end);
	
	public List<Order_listDto> orderList(String page_start,String page_end);
	
	
public List<Order_listDto> orderList_date1(String orderStartDate, String orderEndDate,String page_start,String page_end,String status);
	
	public List<Order_listDto> orderList_value_total1(String value,String page_start,String page_end,String status);
	
	public List<Order_listDto> orderList_value_order_number1(String value,String page_start,String page_end,String status);
	
	public List<Order_listDto> orderList_value_product_name1(String value,String page_start,String page_end,String status);
	
	public List<Order_listDto> orderList_value_member_name1(String value,String page_start,String page_end,String status);
	
	public List<Order_listDto> orderList_both_total1(String orderStartDate, String orderEndDate,String value,String page_start,String page_end,String status);
	
	public List<Order_listDto> orderList_both_order_number1(String orderStartDate, String orderEndDate,String value,String page_start,String page_end,String status);
	
	public List<Order_listDto> orderList_both_product_name1(String orderStartDate, String orderEndDate,String value,String page_start,String page_end,String status);
	
	public List<Order_listDto> orderList_both_member_name1(String orderStartDate, String orderEndDate,String value,String page_start,String page_end,String status);
	
	public List<Order_listDto> orderList1(String page_start,String page_end,String status);
	
	public int count();
	public int count_d(String orderStartDate, String orderEndDate);
	public int count_v_t(String value);
	public int count_v_n(String value);
	public int count_v_p(String value);
	public int count_v_m(String value);
	public int count_b_t(String orderStartDate, String orderEndDate,String value);
	public int count_b_n(String orderStartDate, String orderEndDate,String value);
	public int count_b_p(String orderStartDate, String orderEndDate,String value);
	public int count_b_m(String orderStartDate, String orderEndDate,String value);
	
	
	public int count1(String status);
	public int count_d1(String orderStartDate, String orderEndDate,String status);
	public int count_v_t1(String value,String status);
	public int count_v_n1(String value,String status);
	public int count_v_p1(String value,String status);
	public int count_v_m1(String value,String status);
	public int count_b_t1(String orderStartDate, String orderEndDate,String value,String status);
	public int count_b_n1(String orderStartDate, String orderEndDate,String value,String status);
	public int count_b_p1(String orderStartDate, String orderEndDate,String value,String status);
	public int count_b_m1(String orderStartDate, String orderEndDate,String value,String status);
	
	public int orderListMove(String check,String category);
	
	public Order_listDto orderListDto( String order_idx);
	public MemberDto memberDto(String order_member_idx);
	public List<Order_itemDto> itemList(String order_idx);
	
	public int orderCancel(String order_idx);
	public int cancelInsert(String order_idx);
	public int seq();
	public int order(String order_number,String recipientName,String recipientPhone,String member_addr1,String member_addr2,
			String member_addr3,String delivery_m,String total_shipping_fee,String paymentMethod,String total_price,String member_idx);

}

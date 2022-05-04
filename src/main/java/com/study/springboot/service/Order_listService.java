package com.study.springboot.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.study.springboot.dao.IOrder_listDao;
import com.study.springboot.dto.MemberDto;
import com.study.springboot.dto.Order_itemDto;
import com.study.springboot.dto.Order_listDto;

@Service
public class Order_listService {
	@Autowired
	private IOrder_listDao order_listDao;
	

	public List<Order_listDto> orderList(String page_start,String page_end){
		List<Order_listDto> orderList = order_listDao.orderList(page_start,page_end);
		return orderList;
	}
	
	public List<Order_listDto> orderList_date(String orderStartDate, String orderEndDate,String page_start,String page_end){
		List<Order_listDto> orderList = order_listDao.orderList_date(orderStartDate,orderEndDate,page_start,page_end);
		return orderList;
	}
	
	public List<Order_listDto> orderList_value(String category,String value,String page_start,String page_end){
		List<Order_listDto> orderList = null;
		if(category.equals("total")) {
			orderList = order_listDao.orderList_value_total(value,page_start,page_end);
		}
		if(category.equals("order_number")) {
			orderList = order_listDao.orderList_value_order_number(value,page_start,page_end);
		}
		if(category.equals("product_name")) {
			orderList = order_listDao.orderList_value_product_name(value,page_start,page_end);
		}
		if(category.equals("member_name")) {
			orderList = order_listDao.orderList_value_member_name(value,page_start,page_end);
		}
		return orderList;
	}
	
	public List<Order_listDto> orderList_both(String orderStartDate, String orderEndDate,String category,String value,String page_start,String page_end){
		List<Order_listDto> orderList = null;
		if(category.equals("total")) {
			orderList = order_listDao.orderList_both_total(orderStartDate,orderEndDate,value,page_start,page_end);
		}
		if(category.equals("order_number")) {
			orderList = order_listDao.orderList_both_order_number(orderStartDate,orderEndDate,value,page_start,page_end);
		}
		if(category.equals("product_name")) {
			orderList = order_listDao.orderList_both_product_name(orderStartDate,orderEndDate,value,page_start,page_end);
		}
		if(category.equals("member_name")) {
			orderList = order_listDao.orderList_both_member_name(orderStartDate,orderEndDate,value,page_start,page_end);
		}
		return orderList;
	}
	
	public List<Order_listDto> orderList1(String page_start,String page_end,String status){
		List<Order_listDto> orderList = order_listDao.orderList1(page_start,page_end,status);
		return orderList;
	}
	
	public List<Order_listDto> orderList_date1(String orderStartDate, String orderEndDate,String page_start,String page_end,String status){
		List<Order_listDto> orderList = order_listDao.orderList_date1(orderStartDate,orderEndDate,page_start,page_end,status);
		return orderList;
	}
	
	public List<Order_listDto> orderList_value1(String category,String value,String page_start,String page_end,String status){
		List<Order_listDto> orderList = null;
		if(category.equals("total")) {
			orderList = order_listDao.orderList_value_total1(value,page_start,page_end,status);
		}
		if(category.equals("order_number")) {
			orderList = order_listDao.orderList_value_order_number1(value,page_start,page_end,status);
		}
		if(category.equals("product_name")) {
			orderList = order_listDao.orderList_value_product_name1(value,page_start,page_end,status);
		}
		if(category.equals("member_name")) {
			orderList = order_listDao.orderList_value_member_name1(value,page_start,page_end,status);
		}
		return orderList;
	}
	
	public List<Order_listDto> orderList_both1(String orderStartDate, String orderEndDate,String category,String value,String page_start,String page_end,String status){
		List<Order_listDto> orderList = null;
		if(category.equals("total")) {
			orderList = order_listDao.orderList_both_total1(orderStartDate,orderEndDate,value,page_start,page_end,status);
		}
		if(category.equals("order_number")) {
			orderList = order_listDao.orderList_both_order_number1(orderStartDate,orderEndDate,value,page_start,page_end,status);
		}
		if(category.equals("product_name")) {
			orderList = order_listDao.orderList_both_product_name1(orderStartDate,orderEndDate,value,page_start,page_end,status);
		}
		if(category.equals("member_name")) {
			orderList = order_listDao.orderList_both_member_name1(orderStartDate,orderEndDate,value,page_start,page_end,status);
		}
		return orderList;
	}
	
	public int  count_d(String orderStartDate, String orderEndDate) {
		int count = order_listDao.count_d(orderStartDate,orderEndDate);
		return count;
	}
	public int  count_v(String category,String value) {
		int count = 0;
		if(category.equals("total")) {
			count = order_listDao.count_v_t(value);
		}
		if(category.equals("order_number")) {
			count = order_listDao.count_v_n(value);
			}
		if(category.equals("product_name")) {
			count = order_listDao.count_v_p(value);
			}
		if(category.equals("member_name")) {
			count = order_listDao.count_v_m(value);
			}
		return count;
	}
	public int  count_b(String orderStartDate, String orderEndDate,String category,String value) {
		int count = 0;
		if(category.equals("total")) {
			count = order_listDao.count_b_t(orderStartDate,orderEndDate,value);
		}
		if(category.equals("order_number")) {
			count = order_listDao.count_b_n(orderStartDate,orderEndDate,value);
			}
		if(category.equals("product_name")) {
			count = order_listDao.count_b_p(orderStartDate,orderEndDate,value);
			}
		if(category.equals("member_name")) {
			count = order_listDao.count_b_m(orderStartDate,orderEndDate,value);
			}
		return count;
	}
	public int  count() {
		int count = order_listDao.count();
		return count;
	}
	
	public int  count_d1(String orderStartDate, String orderEndDate,String status) {
		int count = order_listDao.count_d1(orderStartDate,orderEndDate,status);
		return count;
	}
	public int  count_v1(String category,String value,String status) {
		int count = 0;
		if(category.equals("total")) {
			count = order_listDao.count_v_t1(value,status);
		}
		if(category.equals("order_number")) {
			count = order_listDao.count_v_n1(value,status);
			}
		if(category.equals("product_name")) {
			count = order_listDao.count_v_p1(value,status);
			}
		if(category.equals("member_name")) {
			count = order_listDao.count_v_m1(value,status);
			}
		return count;
	}
	public int  count_b1(String orderStartDate, String orderEndDate,String category,String value,String status) {
		int count = 0;
		if(category.equals("total")) {
			count = order_listDao.count_b_t1(orderStartDate,orderEndDate,value,status);
		}
		if(category.equals("order_number")) {
			count = order_listDao.count_b_n1(orderStartDate,orderEndDate,value,status);
			}
		if(category.equals("product_name")) {
			count = order_listDao.count_b_p1(orderStartDate,orderEndDate,value,status);
			}
		if(category.equals("member_name")) {
			count = order_listDao.count_b_m1(orderStartDate,orderEndDate,value,status);
			}
		return count;
	}
	public int  count1(String status) {
		int count = order_listDao.count1(status);
		return count;
	}
	
	public int orderListMove(String check, String category) {
		int result = order_listDao.orderListMove(check,category);
		if(result == 1) {
			return 1;
		}
		return 0;
	}
	public Order_listDto orderListDto(String order_idx){
		Order_listDto orderListDto = order_listDao.orderListDto(order_idx);
		return orderListDto;
	}
	public MemberDto memberDto(String order_member_idx){
		MemberDto memberDto = order_listDao.memberDto(order_member_idx);
		return memberDto;
	}
	
	public List<Order_itemDto> itemList(String order_idx){
		List<Order_itemDto> itemList = order_listDao.itemList(order_idx);
		return itemList;
	}
	
	public int orderCancel(String order_idx){
		int result=order_listDao.orderCancel(order_idx);
		return result;
	}
	public int cancelInsert(String order_idx){
		int result=order_listDao.cancelInsert(order_idx);
		return result;
	}
	
	public int seq() {
		int seq = order_listDao.seq();
		return seq;
	}
	
	public int order(String order_number,String recipientName,String recipientPhone,String member_addr1,String member_addr2,
						String member_addr3,String delivery_m,String total_shipping_fee,String paymentMethod,String total_price,String member_idx) {
		int result = order_listDao.order(order_number,recipientName,recipientPhone,member_addr1,member_addr2,
				 member_addr3,delivery_m,total_shipping_fee,paymentMethod,total_price,member_idx);
		return result;
	}
}

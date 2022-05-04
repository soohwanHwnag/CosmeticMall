package com.study.springboot.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.study.springboot.dao.ICartDao;
import com.study.springboot.dto.CartDto;

@Service
public class CartService {
	@Autowired
	private ICartDao cartDao;
	
	public List<CartDto> cartList(String member_idx){
		List<CartDto> cartList = cartDao.cartList(member_idx);
		return cartList;
	}
	public CartDto cartList_order(String member_idx, String p_check){
		CartDto dto= cartDao.cartList_order(member_idx,p_check);
		return dto;
	}
	
	public int cart_add(String member_idx,String product_idx, String amount, String total_price) {
		int result= cartDao.cart_add(member_idx,product_idx,amount,total_price);
		return result;
	}
	
	public int cart_update(String check,String p_price,String p_count) {
		int result = cartDao.cart_update(check,p_price,p_count);
		return result;
	}
	
	public int delete(String cart_idx) {
		int result = cartDao.delete(cart_idx);
		return result;
	}
}

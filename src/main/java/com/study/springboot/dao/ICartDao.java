package com.study.springboot.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.study.springboot.dto.CartDto;

///@Mapper : MyBatis 맵핑 어노테이션
@Mapper
//mapper xml파일의 mapper namespace "ICartDao"와 연결
public interface ICartDao {

	public List<CartDto> cartList(String member_idx);
	public CartDto cartList_order(String member_idx, String p_check);
	
	public int cart_add(String member_idx,String product_idx, String amount, String total_price);
	
	public int cart_update(String check,String p_price,String p_count);
	
	public int delete(String cart_idx);
}

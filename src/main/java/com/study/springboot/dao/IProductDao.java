package com.study.springboot.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.study.springboot.dto.ProductDto;

///@Mapper : MyBatis 맵핑 어노테이션
@Mapper
//mapper xml파일의 mapper namespace "IProductDao"와 연결
public interface IProductDao {

	public List<ProductDto> productList(String start, String end);
	public List<ProductDto> productList_v(String value,String start, String end);
	public List<ProductDto> productList_d(String display_status,String start, String end);
	public List<ProductDto> productList_c(String category,String start, String end);
	public List<ProductDto> productList_b(String category,String display_status,String start, String end);
	public int count();
	public int count_v(String value);
	public int count_c(String category);
	public int count_d(String display_status);
	public int count_b(String category, String display_status);
	public int productAdd( String product_category,String product_name,String product_comment,String product_price,String product_volume,
			String product_stock,String product_shipping_fee,String product_fliename,String product_fliename_detail,String product_content);
	public ProductDto dto(String product_idx);
	
	// 선택 진열
		public int updateDisplay(String check);
		
		// 선택 숨김
		public int updateHidden(String check);
		
		// 선택 품절
		public int updateSoldOut(String check);
}

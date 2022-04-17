package com.study.springboot.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.study.springboot.dao.IProductDao;
import com.study.springboot.dto.ProductDto;

@Service
public class ProductService {
	
	@Autowired
	private IProductDao productDao;
	
	public List<ProductDto> productList(String start, String end){
		List<ProductDto> productList = productDao.productList(start,end);
		return productList;
	}
	public List<ProductDto> productList_v(String value,String start, String end){
		List<ProductDto> productList = productDao.productList_v(value,start,end);
		return productList;
	}
	public List<ProductDto> productList_d(String display_status,String start, String end){
		List<ProductDto> productList = productDao.productList_d(display_status,start,end);
		return productList;
	}
	public List<ProductDto> productList_c(String category,String start, String end){
		List<ProductDto> productList = productDao.productList_c(category,start,end);
		return productList;
	}
	public List<ProductDto> productList_b(String category,String display_status,String start, String end){
		List<ProductDto> productList = productDao.productList_b(category,display_status,start,end);
		return productList;
	}
	
	public int count() {
		int count = productDao.count();
		return count;
	}
	public int count_v(String value) {
		int count_v = productDao.count_v(value);
		return count_v;
	}
	public int count_c(String category) {
		int count_c = productDao.count_c(category);
		return count_c;
	}
	public int count_d(String display_status) {
		int count_d = productDao.count_d(display_status);
		return count_d;
	}
	public int count_b(String category, String display_status) {
		int count_b = productDao.count_b(category,display_status);
		return count_b;
	}
	public int productAdd( String product_category,String product_name,String product_comment,String product_price,String product_volume,
			String product_stock,String product_shipping_fee,String product_fliename,String product_fliename_detail,String product_content) {
		int result = productDao.productAdd(product_category,product_name,product_comment,product_price,product_volume,
				product_stock,product_shipping_fee,product_fliename,product_fliename_detail,product_content);
		return result;
	}
	
	public ProductDto dto(String product_idx) {
		ProductDto dto = productDao.dto(product_idx);
		return dto;
	}
}

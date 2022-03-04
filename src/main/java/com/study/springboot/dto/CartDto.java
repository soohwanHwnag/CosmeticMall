package com.study.springboot.dto;

import lombok.Data;

//lombok
@Data
public class CartDto {
	private int cart_idx;
	private int cart_product_idx;
	private int cart_count;
	private int cart_member_idx;
}

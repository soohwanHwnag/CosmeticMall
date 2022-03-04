package com.study.springboot.dto;

import lombok.Data;

//lombok
@Data
public class Order_itemDto {
	private int item_idx;
	private int item_product_idx;
	private int item_price;
	private int item_count;
	private int item_shipping_fee;
	private int item_order_idx;
}

package com.study.springboot.dto;

import lombok.Data;

//lombok
@Data
public class DeliveryDto {
	private int delivery_idx;
	private String delivery_courier;
	private int delivery_tracking_number;
	private int delivery_order_idx;
}

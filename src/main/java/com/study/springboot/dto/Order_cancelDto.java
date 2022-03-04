package com.study.springboot.dto;

import java.util.Date;

import lombok.Data;

//lombok
@Data
public class Order_cancelDto {
	private int cancel_idx;
	private Date cancel_date; 
	private int cancel_order_idx;
}

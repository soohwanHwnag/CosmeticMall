package com.study.springboot.dto;

import java.util.Date;

import lombok.Data;

//lombok
@Data
public class Order_listDto {
	private int order_idx;
	private String order_number;
	private String order_recipient;
	private String order_phone;
	private String order_addr1;
	private String order_addr2;
	private String order_addr3;
	private String order_message;
	private int shipping_fee;
	private String order_payment_method;
	private String order_payment_amount;
	private Date order_date;
	private String order_status;
	private int order_member_idx;
	private String member_name;
	private String product_name;
}

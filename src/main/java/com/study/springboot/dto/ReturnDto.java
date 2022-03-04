package com.study.springboot.dto;

import java.util.Date;

import lombok.Data;

//lombok
@Data
public class ReturnDto {
	private int return_idx;
	private String return_number;
	private int return_item_idx;
	private int return_count;
	private String return_option; 
	private String return_reason;  
	private String return_reason_detail; 
	private int return_refund; 
	private int return_shipping_fee;
	private Date return_request_date; 
	private Date return_process_date; 
	private String return_status; 
	private int return_order_idx;  
	private int return_member_idx; 
}

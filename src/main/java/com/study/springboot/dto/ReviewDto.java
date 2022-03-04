package com.study.springboot.dto;

import java.util.Date;

import lombok.Data;

//lombok
@Data
public class ReviewDto {
	private int review_idx;  
	private int review_product_idx;
	//유의 - int or float 편한 쪽으로 수정 
	private int review_score;
	private String review_content;
	private Date review_date; 
	private int review_item_idx;
	private int review_member_idx;
}

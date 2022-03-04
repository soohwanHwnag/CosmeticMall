package com.study.springboot.dto;

import lombok.Data;

//lombok
@Data
public class FaqDto {
	private int faq_idx;
	private String faq_category; 
	private String faq_title; 
	private String faq_content;
	private int faq_member_idx;
}

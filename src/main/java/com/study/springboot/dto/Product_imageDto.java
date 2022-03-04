package com.study.springboot.dto;

import lombok.Data;

//lombok
@Data
public class Product_imageDto {
	private int image_idx; 
    private String image_category;
    private String image_filename;
    private int image_product_idx;
}

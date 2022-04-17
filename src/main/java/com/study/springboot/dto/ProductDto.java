package com.study.springboot.dto;

import java.util.Date;

import lombok.Data;

//lombok
@Data
public class ProductDto {
	private int product_idx;
    private String product_category;
    private String product_name;
    private String product_comment;
    private int product_price;
    private String product_volume;
    private int product_stock;
    private int product_shipping_fee;
    private String product_content;
    private String product_display;
    private int product_hit;
    private Date product_add_date;
    private String product_filename;
    private String product_filename_detail;
}


package com.study.springboot.dto;

import lombok.Data;

//lombok
@Data
public class MailDto {
	private int mail_idx;
    private String mail_category;
    private String mail_title;
    private String mail_content; 
    private String mail_auto_YN;
}

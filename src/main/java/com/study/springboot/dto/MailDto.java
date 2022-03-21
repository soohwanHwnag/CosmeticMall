package com.study.springboot.dto;

import lombok.Data;

//lombok
@Data
public class MailDto {
	 	private String address;
	    private String title;
	    private String message;
}

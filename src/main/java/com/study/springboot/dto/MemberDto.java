package com.study.springboot.dto;

import java.util.Date;

import lombok.Data;

//lombok
@Data
public class MemberDto {
	private int member_idx;
	private String member_name;
	private String member_email;
	private String member_email_YN;
	private String member_password;
	private String member_phone;
	private String member_addr1;
	private String member_addr2;
	private String member_addr3;
	private Date member_joindate;
	private int member_amount;
	private String member_grade;
}


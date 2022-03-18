package com.study.springboot.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.study.springboot.dto.FaqDto;

///@Mapper : MyBatis 맵핑 어노테이션
@Mapper
//mapper xml파일의 mapper namespace "IFaqDao"와 연결
public interface IFaqDao {

	public List<FaqDto> faq_list(String faqCategory);
	
	public List<FaqDto> faq_list_v(String faqCategory,String value);
}

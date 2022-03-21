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
	
	public int faq_write(String select,String title,String content,String member_idx);
	
	public int faq_update(String select,String title,String content,String member_idx,String faq_idx);
	
	public int faq_delete(String faq_idx);
	
	public FaqDto dto(String faq_idx);
}

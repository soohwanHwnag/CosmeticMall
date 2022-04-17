package com.study.springboot.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.study.springboot.dto.One2oneDto;

///@Mapper : MyBatis 맵핑 어노테이션
@Mapper
//mapper xml파일의 mapper namespace "IOne2oneDao"와 연결
public interface IOne2oneDao {

	public List<One2oneDto> o2oList(String start,String end);
	
	public int count();
	
	public int one2oneJoin(String category,String title, String content);
	
	public int one2oneModifyForm(String one2one_idx,String category,String title, String content);
	
	public One2oneDto dto(String one2one_idx);
	
	public int one2oneDelete(String one2one_idx);
}

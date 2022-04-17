package com.study.springboot.dao;

import org.apache.ibatis.annotations.Mapper;

import com.study.springboot.dto.One2one_replyDto;

///@Mapper : MyBatis 맵핑 어노테이션
@Mapper
//mapper xml파일의 mapper namespace "IOne2one_replyDao"와 연결
public interface IOne2one_replyDao {

	public One2one_replyDto dto(String one2one_idx);
}

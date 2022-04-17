package com.study.springboot.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.study.springboot.dto.NoticeDto;

@Mapper
public interface INoticeDao {
	
	public List<NoticeDto> noticeList(String page_start, String page_end);
	public List<NoticeDto> noticeList_total(String page_start, String page_end,String value);
	public List<NoticeDto> noticeList_title(String page_start, String page_end,String value);
	public List<NoticeDto> noticeList_content(String page_start, String page_end,String value);
	
	public int count();
	public int count_total(String value);
	public int count_title(String value);
	public int count_content(String value);
	
	public NoticeDto dto(String notice_idx);
	
	public int noticeJoin(String member_idx,String important_yn,String notice_title, String notice_content);
	
	public int noticeModify(String notice_idx,String important_yn,String notice_title, String notice_content);
	
	public int noticeDelete(String notice_idx);
	
	public int update_hit(String notice_idx);

}

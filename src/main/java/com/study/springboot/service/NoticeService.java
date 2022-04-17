package com.study.springboot.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.study.springboot.dao.INoticeDao;
import com.study.springboot.dto.NoticeDto;

@Service
public class NoticeService {
	@Autowired
	private INoticeDao noticeDao;
	
	public List<NoticeDto> noticeList(String page_start,String page_end){
		List<NoticeDto> noticeList = noticeDao.noticeList(page_start,page_end);
		return noticeList;
	}
	public List<NoticeDto> noticeList_both(String page_start,String page_end,String category,String value){
		List<NoticeDto> noticeList = null;
		if(category.equals("total")) {
		noticeList = noticeDao.noticeList_total(page_start,page_end,value);
		}
		if(category.equals("title")) {
			noticeList = noticeDao.noticeList_title(page_start,page_end,value);
		}
		if(category.equals("content")) {
			noticeList = noticeDao.noticeList_content(page_start,page_end,value);
		}
	
		return noticeList;
	}
	
	public int count() {
		int count = noticeDao.count();
		return count;
	}
	
	public int count_both(String category,String value) {
		int count = 0;
		if(category.equals("total")) {
		   count = noticeDao.count_total(value);
		}
		if(category.equals("title")) {
		   count = noticeDao.count_title(value);	
		}
		if(category.equals("content")) {
			count = noticeDao.count_content(value);	
		}
		return count;
	}
	
	public NoticeDto dto(String notice_idx) {
		NoticeDto dto = noticeDao.dto(notice_idx);
		return dto;
	}
	
	public int noticeJoin(String member_idx,String important_yn,String notice_title, String notice_content) {
		int result = noticeDao.noticeJoin(member_idx,important_yn,notice_title,notice_content);
		return result;
	}
	
	public int noticeModify(String notice_idx,String important_yn,String notice_title, String notice_content) {
		int result = noticeDao.noticeModify(notice_idx,important_yn,notice_title,notice_content);
		return result;
	}
	
	public int noticeDelete(String notice_idx) {
		int result = noticeDao.noticeDelete(notice_idx);
		return result;
	}
	public int update_hit(String notice_idx) {
		int update_hit = noticeDao.update_hit(notice_idx);
		return update_hit;
	}
}

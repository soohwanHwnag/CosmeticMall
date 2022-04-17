package com.study.springboot.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.study.springboot.dao.IOne2oneDao;
import com.study.springboot.dto.One2oneDto;

@Service
public class One2oneService {
	
	@Autowired
	private IOne2oneDao one2oneDao;
	
	public List<One2oneDto> o2oList(String start,String end){
		List<One2oneDto> o2oList = one2oneDao.o2oList(start,end);
		return o2oList;
	}
	
	public int count() {
		int count = one2oneDao.count();
		return count;
	}
	
	public int one2oneJoin(String category,String title, String content) {
		int result = one2oneDao.one2oneJoin(category, title, content);
		return result;
	}
	
	public int one2oneModifyForm(String one2one_idx,String category,String title, String content) {
		int result = one2oneDao.one2oneModifyForm(one2one_idx,category, title, content);
		return result;
	}
	
	public One2oneDto dto(String one2one_idx) {
		One2oneDto dto=one2oneDao.dto(one2one_idx);
		return dto;
	}
	
	public int one2oneDelete(String one2one_idx) {
		int result = one2oneDao.one2oneDelete(one2one_idx);
		return result;
	}
}

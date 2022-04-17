package com.study.springboot.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.study.springboot.dao.IOne2one_replyDao;
import com.study.springboot.dto.One2one_replyDto;

@Service
public class One2one_replyService {
	
	@Autowired
	private IOne2one_replyDao one2one_replyDao;
	
	public One2one_replyDto dto(String one2one_idx) {
		One2one_replyDto dto=one2one_replyDao.dto(one2one_idx);
		return dto;
	}
}

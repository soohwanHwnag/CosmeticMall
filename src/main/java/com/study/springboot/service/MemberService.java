package com.study.springboot.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.study.springboot.dao.IMemberDao;

@Service
public class MemberService {
	@Autowired
	private IMemberDao memberDao;
}

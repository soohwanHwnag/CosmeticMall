package com.study.springboot.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.study.springboot.dao.IMemberDao;
import com.study.springboot.dto.MemberDto;

@Service
public class MemberService {
	@Autowired
	private IMemberDao memberDao;
	
	public List<MemberDto> memberList(String page_start,String page_end){
		List<MemberDto> memberList = memberDao.memberList(page_start,page_end);
		return memberList;
	}
	
	public List<MemberDto> memberList_value(String category,String value,String page_start,String page_end){
		List<MemberDto> memberList = null;
		if(category.equals("total")) {
			memberList=memberDao.memberList_total(value,page_start,page_end);
		}
		if(category.equals("member_name")) {
			memberList=memberDao.memberList_name(value,page_start,page_end);
		}
		if(category.equals("member_email")) {
			memberList=memberDao.memberList_email(value,page_start,page_end);
		}
		return memberList;
	}
	
	public List<MemberDto> memberList_date(String start,String end,String detail_select,String email_yn,String page_start,String page_end){
		List<MemberDto> memberList = null;
		if(detail_select.equals("total")) {
			memberList=memberDao.memberList_totaldate(start,end,email_yn,page_start,page_end);
		}
		if(detail_select.equals("member")) {
			memberList=memberDao.memberList_member(start,end,email_yn,page_start,page_end);
		}
		if(detail_select.equals("admin")) {
			memberList=memberDao.memberList_admin(start,end,email_yn,page_start,page_end);
		}
		return memberList;
	}
	
	public List<MemberDto> memberList_amount(String start,String end,String detail_select,String email_yn,String page_start,String page_end){
		List<MemberDto> memberList = null;
		if(detail_select.equals("total")) {
			memberList=memberDao.memberList_totalAmount(start,end,email_yn,page_start,page_end);
		}
		if(detail_select.equals("member")) {
			memberList=memberDao.memberList_memberAmount(start,end,email_yn,page_start,page_end);
		}
		if(detail_select.equals("admin")) {
			memberList=memberDao.memberList_adminAmount(start,end,email_yn,page_start,page_end);
		}
		return memberList;
	}
	
	public List<MemberDto> memberList_email_yn(String detail_select,String email_yn,String page_start,String page_end){
		List<MemberDto> memberList = null;
		if(detail_select.equals("total")) {
			memberList=memberDao.memberList_totalEmail_yn(email_yn,page_start,page_end);
		}
		if(detail_select.equals("member")) {
			memberList=memberDao.memberList_memberEmail_yn(email_yn,page_start,page_end);
		}
		if(detail_select.equals("admin")) {
			memberList=memberDao.memberList_adminEmail_yn(email_yn,page_start,page_end);
		}
		return memberList;
	}
	
	public List<MemberDto> memberList_both(String joindate_start,String joindate_end,String amount_start,String amount_end,String detail_select,String email_yn,String page_start,String page_end){
		List<MemberDto> memberList = null;
		if(detail_select.equals("total")) {
			memberList=memberDao.memberList_totalBoth(joindate_start,joindate_end,amount_start,amount_start,email_yn,page_start,page_end);
		}
		if(detail_select.equals("member")) {
			memberList=memberDao.memberList_memberBoth(joindate_start,joindate_end,amount_start,amount_start,email_yn,page_start,page_end);
		}
		if(detail_select.equals("admin")) {
			memberList=memberDao.memberList_adminBoth(joindate_start,joindate_end,amount_start,amount_start,email_yn,page_start,page_end);
		}
		return memberList;
	}
	public int count_admin() {
		int count_admin = memberDao.count_admin();
		return count_admin;
	}
	public int count_member() {
		int count_member = memberDao.count_member();
		return count_member;
	}
	public int count_search() {
		int count = memberDao.count_search();
		return count;
	}
	public int count_search_value(String category,String value){
		int count = 0;
		if(category.equals("total")) {
			count=memberDao.count_search_value_t(value);
		}
		if(category.equals("member_name")) {
			count=memberDao.count_search_value_n(value);
		}
		if(category.equals("member_email")) {
			count=memberDao.count_search_value_e(value);
		}
		return count;
	}
	
	public int count_search_date(String start,String end,String detail_select,String email_yn){
		int count = 0;
		if(detail_select.equals("total")) {
			count=memberDao.count_search_date_t(start,end,email_yn);
		}
		if(detail_select.equals("member")) {
			count=memberDao.count_search_date_m(start,end,email_yn);
		}
		if(detail_select.equals("admin")) {
			count=memberDao.count_search_date_a(start,end,email_yn);
		}
		return count;
	}
	
	public int count_search_amount(String start,String end,String detail_select,String email_yn){
		int count = 0;
		if(detail_select.equals("total")) {
			count=memberDao.count_search_amount_t(start,end,email_yn);
		}
		if(detail_select.equals("member")) {
			count=memberDao.count_search_amount_m(start,end,email_yn);
		}
		if(detail_select.equals("admin")) {
			count=memberDao.count_search_amount_a(start,end,email_yn);
		}
		return count;
	}
	
	public int count_search_email_yn(String detail_select,String email_yn){
		int count = 0;
		if(detail_select.equals("total")) {
			count=memberDao.count_search_email_yn_t(email_yn);
		}
		if(detail_select.equals("member")) {
			count=memberDao.count_search_email_yn_m(email_yn);
		}
		if(detail_select.equals("admin")) {
			count=memberDao.count_search_email_yn_a(email_yn);
		}
		return count;
	}
	
	public int count_search_both (String joindate_start,String joindate_end,String amount_start,String amount_end,String detail_select,String email_yn){
		int count = 0;
		if(detail_select.equals("total")) {
			count=memberDao.count_search_both_t(joindate_start,joindate_end,amount_start,amount_start,email_yn);
		}
		if(detail_select.equals("member")) {
			count=memberDao.count_search_both_m(joindate_start,joindate_end,amount_start,amount_start,email_yn);
		}
		if(detail_select.equals("admin")) {
			count=memberDao.count_search_both_a(joindate_start,joindate_end,amount_start,amount_start,email_yn);
		}
		return count;
	}
	
	
	public int memberDelete(String check) {
		int result = memberDao.memberDelete(check);
		return result;
	}
	
	public MemberDto dto(String member_idx) {
		MemberDto dto=memberDao.dto(member_idx);
		return dto;
	}
	
	public int memberModify(String member_idx,String email_yn,String member_password,String tel,String addr1,String addr2,String addr3) {
		int result = memberDao.memberModify(member_idx,email_yn,member_password,tel,addr1,addr2,addr3);
		return result;
	}
}

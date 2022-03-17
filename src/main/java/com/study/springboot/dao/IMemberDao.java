package com.study.springboot.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.study.springboot.dto.MemberDto;

@Mapper
public interface IMemberDao {

	public List<MemberDto> memberList(String page_start,String page_end);
	public List<MemberDto> memberList_total(String value,String page_start,String page_end);
	public List<MemberDto> memberList_name(String value,String page_start,String page_end);
	public List<MemberDto> memberList_email(String value,String page_start,String page_end);
	public List<MemberDto> memberList_totaldate(String start,String end,String email_yn,String page_start,String page_end);
	public List<MemberDto> memberList_member(String start,String end,String email_yn,String page_start,String page_end);
	public List<MemberDto> memberList_admin(String start,String end,String email_yn,String page_start,String page_end);
	public List<MemberDto> memberList_totalAmount(String start,String end,String email_yn,String page_start,String page_end);
	public List<MemberDto> memberList_memberAmount(String start,String end,String email_yn,String page_start,String page_end);
	public List<MemberDto> memberList_adminAmount(String start,String end,String email_yn,String page_start,String page_end);
	public List<MemberDto> memberList_totalEmail_yn(String email_yn,String page_start,String page_end);
	public List<MemberDto> memberList_memberEmail_yn(String email_yn,String page_start,String page_end);
	public List<MemberDto> memberList_adminEmail_yn(String email_yn,String page_start,String page_end);
	public List<MemberDto> memberList_totalBoth(String joindate_start,String joindate_end,String amount_start,String amount_end,String email_yn,String page_start,String page_end);
	public List<MemberDto> memberList_memberBoth(String joindate_start,String joindate_end,String amount_start,String amount_end,String email_yn,String page_start,String page_end);
	public List<MemberDto> memberList_adminBoth(String joindate_start,String joindate_end,String amount_start,String amount_end,String email_yn,String page_start,String page_end);
	
	public int count_admin();
	public int count_member();
	public int count_search();
	public int count_search_value_t(String value);
	public int count_search_value_n(String value);
	public int count_search_value_e(String value);
	public int count_search_date_t(String start,String end,String email_yn);
	public int count_search_date_m(String start,String end,String email_yn);
	public int count_search_date_a(String start,String end,String email_yn);
	public int count_search_amount_t(String start,String end,String email_yn);
	public int count_search_amount_m(String start,String end,String email_yn);
	public int count_search_amount_a(String start,String end,String email_yn);
	public int count_search_email_yn_t(String email_yn);
	public int count_search_email_yn_m(String email_yn);
	public int count_search_email_yn_a(String email_yn);
	public int count_search_both_t(String joindate_start,String joindate_end,String amount_start,String amount_end,String email_yn);
	public int count_search_both_m(String joindate_start,String joindate_end,String amount_start,String amount_end,String email_yn);
	public int count_search_both_a(String joindate_start,String joindate_end,String amount_start,String amount_end,String email_yn);

	
	public int memberDelete(String check);
	
	public MemberDto dto(String member_idx);
	
	public int memberModify(String member_idx,String email_yn,String member_password,String tel,String addr1,String addr2,String addr3);
}

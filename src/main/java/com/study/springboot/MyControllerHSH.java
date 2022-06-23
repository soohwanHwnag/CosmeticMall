package com.study.springboot;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.commons.CommonsMultipartResolver;

import com.study.springboot.dao.IProductDao;
import com.study.springboot.dto.CartDto;
import com.study.springboot.dto.EventDto;
import com.study.springboot.dto.FaqDto;
import com.study.springboot.dto.MailDto;
import com.study.springboot.dto.MemberDto;
import com.study.springboot.dto.NoticeDto;
import com.study.springboot.dto.One2oneDto;
import com.study.springboot.dto.One2one_replyDto;
import com.study.springboot.dto.Order_cancelDto;
import com.study.springboot.dto.Order_itemDto;
import com.study.springboot.dto.Order_listDto;
import com.study.springboot.dto.ProductDto;
import com.study.springboot.service.CartService;
import com.study.springboot.service.EventService;
import com.study.springboot.service.FaqService;
import com.study.springboot.service.FileUploadService;
import com.study.springboot.service.MailService;
import com.study.springboot.service.MemberService;
import com.study.springboot.service.NoticeService;
import com.study.springboot.service.One2oneService;
import com.study.springboot.service.One2one_replyService;
import com.study.springboot.service.Order_cancelService;
import com.study.springboot.service.Order_itemService;
import com.study.springboot.service.Order_listService;
import com.study.springboot.service.ProductService;



@Controller
public class MyControllerHSH {
	
	@Autowired
	IProductDao productDao;
	@Autowired
	EventService eventservice;
	@Autowired
	FileUploadService fileuploadservice;
	@Autowired
	Order_listService orderlistservice;
	@Autowired
	Order_itemService orderitemservice;
	@Autowired
	MemberService memberservice;
	@Autowired
	NoticeService noticeservice;
	@Autowired
	Order_cancelService ordercancellistservice;
	@Autowired
	FaqService faqservice;
	@Autowired
	MailService mailservice;
	@Autowired
	One2oneService o2oservice;
	@Autowired
	One2one_replyService o2o_replyservice;
	@Autowired
	ProductService productservice;
	@Autowired
	CartService cartservice;

	@RequestMapping("/")
	public String root(Model model) {
		model.addAttribute("mainPage","main.jsp");
		return "index";
	}
	@RequestMapping("/main")
	public String main(Model model) {
		model.addAttribute("mainPage","main.jsp");
		return "index";
	}
	
//	이벤트 
	
	//이벤트 진행중
	@RequestMapping("/customer/eventList_Y")
	public String eventList_Y(@RequestParam(value="page", required=false) String page,
							Model model) {
		String event_finish = "y";
		int count =0;
		List<EventDto> eventList = null;
		if (page == null) {
			page = "1";
		}
		int page_number = Integer.parseInt(page);
		int page_size = 9;
		int page_start = (page_number - 1) * page_size + 1;
		int page_end = page_number * page_size;
		int block_size = 5;
		int block_group = (int)Math.ceil((double)page_number/block_size);
		int block_start = (block_group -1) * block_size +1;
		int block_end = block_group * block_size;
		int block_total =0;
		
			 count = eventservice.count(event_finish);
			eventList = eventservice.eventList(event_finish, String.valueOf(page_start),
					String.valueOf(page_end));
			block_total = (int)Math.ceil((double)count/page_size);
	
        if(block_end >= block_total) {
			block_end = block_total;
		}
        
        model.addAttribute("nowpage", page_number);
		model.addAttribute("block_total", block_total);
		model.addAttribute("block_start", block_start);
		model.addAttribute("block_end", block_end);
		model.addAttribute("eventList", eventList);
		model.addAttribute("count", count);
		model.addAttribute("mainPage", "customer/eventList_Y.jsp");
		return "index";
	}
	
	
	//이벤트 종료
	@RequestMapping("/customer/eventList_N")
	public String eventList_N(@RequestParam(value="page", required=false) String page,
							Model model) {
		String event_finish = "n";
		int count =0;
		List<EventDto> eventList = null;
		if (page == null) {
			page = "1";
		}
		int page_number = Integer.parseInt(page);
		int page_size = 9;
		int page_start = (page_number - 1) * page_size + 1;
		int page_end = page_number * page_size;
		int block_size = 5;
		int block_group = (int)Math.ceil((double)page_number/block_size);
		int block_start = (block_group -1) * block_size +1;
		int block_end = block_group * block_size;
		int block_total =0;
		
			 count = eventservice.count(event_finish);
			eventList = eventservice.eventList(event_finish, String.valueOf(page_start),
					String.valueOf(page_end));
			block_total = (int)Math.ceil((double)count/page_size);
	
        if(block_end >= block_total) {
			block_end = block_total;
		}
        
        model.addAttribute("nowpage", page_number);
		model.addAttribute("block_total", block_total);
		model.addAttribute("block_start", block_start);
		model.addAttribute("block_end", block_end);
		model.addAttribute("eventList", eventList);
		model.addAttribute("count", count);
		model.addAttribute("mainPage", "customer/eventList_N.jsp");
		return "index";
	}
	
	//이벤트 상세보기
	@RequestMapping("/customer/eventView")
	public String eventView(@RequestParam("event_idx") String event_idx,
								Model model) {
		EventDto dto = eventservice.dto(event_idx);
		model.addAttribute("dto", dto);
		model.addAttribute("mainPage", "customer/eventView.jsp");
		return "index";
	}
	
	//공지사항
	//공지사랑 리스트
	@RequestMapping("/customer/noticeList")
	public String noticeListU (@RequestParam(value="page",required=false) String page,
								Model model) {
	int count =0;
	List<NoticeDto> noticeList = null;
	if (page == null) {
	page = "1";
	}
	int page_number = Integer.parseInt(page);
	int page_size = 10;
	int page_start = (page_number - 1) * page_size + 1;
	int page_end = page_number * page_size;
	int block_size = 5;
	int block_group = (int)Math.ceil((double)page_number/block_size);
	int block_start = (block_group -1) * block_size +1;
	int block_end = block_group * block_size;
	int block_total =0;
	
	count = noticeservice.count();
	noticeList = noticeservice.noticeList( String.valueOf(page_start),
		String.valueOf(page_end));
	block_total = (int)Math.ceil((double)count/page_size);
	
	if(block_end >= block_total) {
		block_end = block_total;
	}
    model.addAttribute("nowpage", page_number);
	model.addAttribute("block_total", block_total);
	model.addAttribute("block_start", block_start);
	model.addAttribute("block_end", block_end);
	model.addAttribute("count", count);
	model.addAttribute("noticeList", noticeList);
	model.addAttribute("mainPage", "customer/noticeList.jsp");
	return "index";
}
	
	//공지사항 상세보기
	@RequestMapping("/customer/noticeView")
	public String noticeViewU (@RequestParam("notice_idx") String notice_idx,
								Model model) {
	int hit_update = noticeservice.update_hit(notice_idx);
	NoticeDto dto = noticeservice.dto(notice_idx);
	model.addAttribute("dto", dto);
	model.addAttribute("mainPage", "customer/noticeView.jsp");
	return "index";
	}
	
	//faq 
	
	// faq 전체 리스트
	@RequestMapping("/customer/faqList/total")
	public String faqTotal(@RequestParam(value="page",required=false) String page,
										@RequestParam(value="faq_value",required=false) String value,
										Model model) {
		if (page == null) {
			page = "1";
			}
			int page_number = Integer.parseInt(page);
			int page_size = 10;
			int page_start = (page_number - 1) * page_size + 1;
			int page_end = page_number * page_size;
			int block_size = 5;
			int block_group = (int)Math.ceil((double)page_number/block_size);
			int block_start = (block_group -1) * block_size +1;
			int block_end = block_group * block_size;
			int block_total =0;
		    int count=0;
		List<FaqDto> faq_list_t = null;
		if(StringUtils.hasText(value)) {
			faq_list_t=faqservice.faq_list_t_v(value,String.valueOf(page_start),String.valueOf(page_end));
			count = faqservice.count_t_v(value);
			block_total = (int)Math.ceil((double)count/page_size);
		}else {
			faq_list_t=faqservice.faq_list_t(String.valueOf(page_start),String.valueOf(page_end));
			count = faqservice.count_t();
			block_total = (int)Math.ceil((double)count/page_size);
		}
		if(block_end >= block_total) {
			block_end = block_total;
		}
		model.addAttribute("value", value);
		model.addAttribute("nowpage", page_number);
		 model.addAttribute("block_total", block_total);
		model.addAttribute("block_start", block_start);
		model.addAttribute("block_end", block_end);
		model.addAttribute("faq_list", faq_list_t);
		model.addAttribute("mainPage", "customer/faqList/total.jsp");
		
		return "index";	
	} 
	
	//FAQ 교환/환불
	@RequestMapping("/customer/faqList/changeRefund")
	public String faqChangeRefund(@RequestParam(value="page",required=false) String page,
										@RequestParam(value="faq_value",required=false) String value,
										Model model) {
		String faqCategory = "ChangeRefund";
		if (page == null) {
			page = "1";
			}
			int page_number = Integer.parseInt(page);
			int page_size = 10;
			int page_start = (page_number - 1) * page_size + 1;
			int page_end = page_number * page_size;
			int block_size = 5;
			int block_group = (int)Math.ceil((double)page_number/block_size);
			int block_start = (block_group -1) * block_size +1;
			int block_end = block_group * block_size;
			int block_total =0;
		    int count=0;
		List<FaqDto> faq_list = null;
		if(StringUtils.hasText(value)) {
			faq_list=faqservice.faq_list_v(faqCategory,value,String.valueOf(page_start),String.valueOf(page_end));
			count = faqservice.count_v(faqCategory,value);
			block_total = (int)Math.ceil((double)count/page_size);
		}else {
			faq_list=faqservice.faq_list(faqCategory,String.valueOf(page_start),String.valueOf(page_end));
			count = faqservice.count(faqCategory);
			block_total = (int)Math.ceil((double)count/page_size);
		}
		if(block_end >= block_total) {
			block_end = block_total;
		}
		model.addAttribute("value", value);
		model.addAttribute("nowpage", page_number);
		 model.addAttribute("block_total", block_total);
		model.addAttribute("block_start", block_start);
		model.addAttribute("block_end", block_end);
		model.addAttribute("faq_list", faq_list);
		model.addAttribute("mainPage", "customer/faqList/changeRefund.jsp");
		
		return "index";	
	} 
	
	//FAQ EVENT
		@RequestMapping("/customer/faqList/event")
		public String faqEvent(@RequestParam(value="page",required=false) String page,
									@RequestParam(value="faq_value",required=false) String value,
									Model model) {
			String faqCategory = "Event";
			if (page == null) {
				page = "1";
				}
				int page_number = Integer.parseInt(page);
				int page_size = 10;
				int page_start = (page_number - 1) * page_size + 1;
				int page_end = page_number * page_size;
				int block_size = 5;
				int block_group = (int)Math.ceil((double)page_number/block_size);
				int block_start = (block_group -1) * block_size +1;
				int block_end = block_group * block_size;
				int block_total =0;
			    int count=0;
			List<FaqDto> faq_list = null;
			if(StringUtils.hasText(value)) {
				faq_list=faqservice.faq_list_v(faqCategory,value,String.valueOf(page_start),String.valueOf(page_end));
				count = faqservice.count_v(faqCategory,value);
				block_total = (int)Math.ceil((double)count/page_size);
			}else {
				faq_list=faqservice.faq_list(faqCategory,String.valueOf(page_start),String.valueOf(page_end));
				count = faqservice.count(faqCategory);
				block_total = (int)Math.ceil((double)count/page_size);
			}
			if(block_end >= block_total) {
				block_end = block_total;
			}
			model.addAttribute("value", value);
			model.addAttribute("nowpage", page_number);
			 model.addAttribute("block_total", block_total);
			model.addAttribute("block_start", block_start);
			model.addAttribute("block_end", block_end);
			model.addAttribute("faq_list", faq_list);
			model.addAttribute("mainPage", "customer/faqList/event.jsp");
			
			return "index";	
		} 
		//FAQ 주문/배송
		@RequestMapping("/customer/faqList/orderShip")
		public String faqOrderShip(@RequestParam(value="page",required=false) String page,
										@RequestParam(value="faq_value",required=false) String value,
										Model model) {	
			String faqCategory = "OrderShip";
			if (page == null) {
				page = "1";
				}
				int page_number = Integer.parseInt(page);
				int page_size = 10;
				int page_start = (page_number - 1) * page_size + 1;
				int page_end = page_number * page_size;
				int block_size = 5;
				int block_group = (int)Math.ceil((double)page_number/block_size);
				int block_start = (block_group -1) * block_size +1;
				int block_end = block_group * block_size;
				int block_total =0;
			    int count=0;
			List<FaqDto> faq_list = null;
			if(StringUtils.hasText(value)) {
				faq_list=faqservice.faq_list_v(faqCategory,value,String.valueOf(page_start),String.valueOf(page_end));
				count = faqservice.count_v(faqCategory,value);
				block_total = (int)Math.ceil((double)count/page_size);
			}else {
				faq_list=faqservice.faq_list(faqCategory,String.valueOf(page_start),String.valueOf(page_end));
				count = faqservice.count(faqCategory);
				block_total = (int)Math.ceil((double)count/page_size);
			}
			if(block_end >= block_total) {
				block_end = block_total;
			}
			model.addAttribute("value", value);
			model.addAttribute("nowpage", page_number);
			 model.addAttribute("block_total", block_total);
			model.addAttribute("block_start", block_start);
			model.addAttribute("block_end", block_end);
			model.addAttribute("faq_list", faq_list);
			model.addAttribute("mainPage", "customer/faqList/orderShip.jsp");
			
			return "index";	
		} 
		
		//FAQ 제품
		@RequestMapping("/customer/faqList/product")
		public String faqProduct(@RequestParam(value="page",required=false) String page,
									@RequestParam(value="faq_value",required=false) String value,
									Model model) {
			String faqCategory = "Product";	
			if (page == null) {
				page = "1";
				}
				int page_number = Integer.parseInt(page);
				int page_size = 10;
				int page_start = (page_number - 1) * page_size + 1;
				int page_end = page_number * page_size;
				int block_size = 5;
				int block_group = (int)Math.ceil((double)page_number/block_size);
				int block_start = (block_group -1) * block_size +1;
				int block_end = block_group * block_size;
				int block_total =0;
			    int count=0;
			List<FaqDto> faq_list = null;
			if(StringUtils.hasText(value)) {
				faq_list=faqservice.faq_list_v(faqCategory,value,String.valueOf(page_start),String.valueOf(page_end));
				count = faqservice.count_v(faqCategory,value);
				block_total = (int)Math.ceil((double)count/page_size);
			}else {
				faq_list=faqservice.faq_list(faqCategory,String.valueOf(page_start),String.valueOf(page_end));
				count = faqservice.count(faqCategory);
				block_total = (int)Math.ceil((double)count/page_size);
			}
			if(block_end >= block_total) {
				block_end = block_total;
			}
			model.addAttribute("value", value);
			model.addAttribute("nowpage", page_number);
			 model.addAttribute("block_total", block_total);
			model.addAttribute("block_start", block_start);
			model.addAttribute("block_end", block_end);
			model.addAttribute("faq_list", faq_list);
			model.addAttribute("mainPage", "customer/faqList/product.jsp");
			
			return "index";	
		} 
		@RequestMapping("/customer/one2oneList")
		public String one2oneList(@RequestParam(value="page",required=false) String page,
				Model model) {
				if (page == null) {
				page = "1";
				}
				int page_number = Integer.parseInt(page);
				int page_size = 10;
				int page_start = (page_number - 1) * page_size + 1;
				int page_end = page_number * page_size;
				int block_size = 5;
				int block_group = (int)Math.ceil((double)page_number/block_size);
				int block_start = (block_group -1) * block_size +1;
				int block_end = block_group * block_size;
				int block_total =0;
				int count=0;
				List<One2oneDto> o2oList = o2oservice.o2oList(String.valueOf(page_start),String.valueOf(page_end));
				count = o2oservice.count();
				block_total = (int)Math.ceil((double)count/page_size);
				if(block_end >= block_total) {
				block_end = block_total;
				}
				model.addAttribute("nowpage", page_number);
				model.addAttribute("block_total", block_total);
				model.addAttribute("block_start", block_start);
				model.addAttribute("block_end", block_end);
				model.addAttribute("one2oneList", o2oList);
				model.addAttribute("mainPage", "customer/one2oneList.jsp");
				
				return "index";	
			}
		
			@RequestMapping("/customer/one2oneWrite")
			public String one2oneWrite(Model model) {
				model.addAttribute("mainPage", "customer/one2oneWrite.jsp");
				return "index";
			}
			
			@RequestMapping("/customer/one2oneModify")
			public String one2oneModify(@RequestParam("one2one_idx") String one2one_idx,
											Model model) {
				One2oneDto dto = o2oservice.dto(one2one_idx);
				model.addAttribute("dto",dto);
				model.addAttribute("mainPage", "customer/one2oneModify.jsp");
				return "index";
			}
			@RequestMapping("/customer/one2oneModifyForm")
			@ResponseBody
			public String one2oneModifyForm(@RequestParam("one2one_idx") String one2one_idx,
										@RequestParam("one2one_category") String category,
										@RequestParam("one2one_title") String title,
										@RequestParam("editor4") String content,
										Model model) {
				int result= o2oservice.one2oneModifyForm(one2one_idx,category,title,content);
				if (result == 1) {
					return "<script>alert('수정 되었습니다'); location.href='/customer/one2oneList';</script>";
				} else {
					return "<script>alert('수정 실패되었습니다'); history.back(-1);</script>";
				}

			}
			
			@RequestMapping("/customer/one2oneJoin")
			@ResponseBody
			public String one2oneJoin(@RequestParam("one2one_category") String category,
										@RequestParam("one2one_title") String title,
										@RequestParam("editor4") String content,
										Model model) {
				int result= o2oservice.one2oneJoin(category,title,content);
				if (result == 1) {
					return "<script>alert('등록 되었습니다'); location.href='/customer/one2oneList';</script>";
				} else {
					return "<script>alert('등록 실패되었습니다'); history.back(-1);</script>";
				}

			}
			
			@RequestMapping("/customer/one2oneDelete")
			@ResponseBody
			public String one2oneJoin(@RequestParam("one2one_idx") String one2one_idx,
										Model model) {
				int result= o2oservice.one2oneDelete(one2one_idx);
				if (result == 1) {
					return "<script>alert('삭제 되었습니다'); location.href='/customer/one2oneList';</script>";
				} else {
					return "<script>alert('삭제 실패되었습니다'); history.back(-1);</script>";
				}

			}	
			@RequestMapping("/customer/one2oneView")
			public String one2oneView(@RequestParam("one2one_idx") String one2one_idx,
										Model model) {
				One2oneDto dto = o2oservice.dto(one2one_idx);
				One2one_replyDto reply_dto = o2o_replyservice.dto(one2one_idx);
				
				model.addAttribute("dto", dto);
				model.addAttribute("reply_dto", reply_dto);
				model.addAttribute("mainPage", "customer/one2oneView.jsp");
				return "index";
			}
			@RequestMapping("/login/login")
			public String login	(Model model) {
				
				model.addAttribute("mainPage", "login/login.jsp");
				return "index";
			}
			@RequestMapping("/login/logout")
			@ResponseBody
			public String logout(HttpServletRequest req,
					Model model) {
				req.getSession().invalidate();
				model.addAttribute("mainPage", "login/login.jsp");
				return "<script>alert('로그아웃 되었습니다'); location.href='/main';</script>";
			}
			@RequestMapping("/login/loginForm")
			@ResponseBody
			public String loginForm(@RequestParam("id") String id,
									@RequestParam("pw") String pw,
									Model model,HttpServletRequest req) {
				int result = memberservice.login(id,pw);
				if (result == 1) {
					MemberDto memberC = memberservice.memberC(id);
					req.getSession().setAttribute("member_idx", String.valueOf(memberC.getMember_idx()));
					System.out.println(memberC.getMember_idx());
					String member_grade = memberC.getMember_grade();
					System.out.println(member_grade);
					if(member_grade.equals("관리자")) {
						return "<script>alert('로그인 되었습니다'); location.href='/admin';</script>";
					}else {
						return "<script>alert('로그인 되었습니다'); location.href='/main';</script>";
					}
				} else {
					return "<script>alert('로그인 실패되었습니다'); history.back(-1);</script>";
				}
			}
			@RequestMapping("/join/Join")
			public String join(Model model) {
				
				model.addAttribute("mainPage", "join/Join.jsp");
				return "index";
			}
			@RequestMapping("/join/memberJoin")
			@ResponseBody
			public String join(@RequestParam("member_name") String member_name,
								@RequestParam("member_email") String member_email,
								@RequestParam("member_password") String member_password,
								@RequestParam("member_phone") String member_phone,
								@RequestParam(value="member_email_YN",required=false) String member_email_YN,
								Model model) {
				if(member_email_YN==null) {
					member_email_YN = "N";
				}
				int result = memberservice.memberJoin(member_name,member_email,member_password,member_phone,member_email_YN);
				if (result == 1) {
					return "<script>alert('회원가입 되었습니다'); location.href='/main';</script>";
				} else {
					return "<script>alert('회원가입 실패되었습니다'); history.back(-1);</script>";
				}
			}
			
			@RequestMapping("/product/productList")
			public String product(@RequestParam( value="page", required=false) String page,
									Model model) {
				if (page == null) {
					page = "1";
					}
					int page_number = Integer.parseInt(page);
					int page_size = 10;
					int page_start = (page_number - 1) * page_size + 1;
					int page_end = page_number * page_size;
					int block_size = 5;
					int block_group = (int)Math.ceil((double)page_number/block_size);
					int block_start = (block_group -1) * block_size +1;
					int block_end = block_group * block_size;
					int block_total =0;
					List<ProductDto> productList = productservice.productList(String.valueOf(page_start),String.valueOf(page_end));
					int count = productservice.count();
					block_total = (int)Math.ceil((double)count/page_size);
					if(block_end >= block_total) {
						block_end = block_total;
					}
					  model.addAttribute("nowpage", page_number);
						model.addAttribute("block_total", block_total);
						model.addAttribute("block_start", block_start);
						model.addAttribute("block_end", block_end);
						model.addAttribute("product_list", productList);
						model.addAttribute("count", count);
				model.addAttribute("mainPage", "product/productList.jsp");

				return "index";
			}
			@RequestMapping("/product/productView")
			public String productView(@RequestParam("product_idx") String product_idx,
									HttpServletRequest req,
									Model model) {
				ProductDto dto = productservice.dto(product_idx);
				model.addAttribute("dto", dto);
				model.addAttribute("mainPage", "product/productView.jsp");
				return "index";
			}
			@RequestMapping("/check/loginCheck")
			public String loginCheck(
									HttpServletRequest req,
									Model model) {
				model.addAttribute("msg", "로그인 후 이용해주시기 바랍니다");
				model.addAttribute("url", "/login/login");
				model.addAttribute("mainPage", "check/loginCheck.jsp");
				return "index";
			}
			@RequestMapping("/product/cart_add")
			@ResponseBody
			public String cart_add(@RequestParam("product_idx") String product_idx,
									@RequestParam("amount") String amount,
									@RequestParam("total_price") String total_price,
									HttpServletRequest req,
									Model model) {
				String member_idx = (String)req.getSession().getAttribute("member_idx");
				if(!StringUtils.hasText(member_idx)) {
					return "<script>location.href='/check/loginCheck';</script>";
					}
				
						int result = cartservice.cart_add(member_idx,product_idx,amount,total_price);
						model.addAttribute("mainPage", "order/cart.jsp");
						if (result == 1) {
							return "<script>alert('장바구니 추가되었습니다'); location.href='/order/cart';</script>";
						} else {
							return "<script>alert('장바구니 추가실패되었습니다'); history.back(-1);</script>";
						}
					
			}
			@RequestMapping("/order/cart")
			public String cart(
									HttpServletRequest req,
									Model model) {
				String member_idx = (String)req.getSession().getAttribute("member_idx");
				if(!StringUtils.hasText(member_idx)) {
					model.addAttribute("msg", "로그인 후 이용해주시기 바랍니다");
					model.addAttribute("url", "/login/login");
					return "check/loginCheck";		
					} 
						List<CartDto> cartList = cartservice.cartList(member_idx);
						int total_price = 0;
						int select_price = 0;
						int shipping_fee =0;
						int total_shipping_fee=0;
						
						for( int i=0; i<cartList.size();i++) {
							select_price += cartList.get(i).getCart_total_price();
							shipping_fee += cartList.get(i).getProduct_shipping_fee();
							if(shipping_fee >= 3000) {
								total_shipping_fee=3000;
							}
							total_price= select_price + total_shipping_fee;
						}
						System.out.println(select_price);
						System.out.println(total_shipping_fee);
						System.out.println(total_price);
						model.addAttribute("select_price", select_price);
						model.addAttribute("total_shipping_fee", total_shipping_fee);
						model.addAttribute("total_price", total_price);
						model.addAttribute("cartList", cartList);
						model.addAttribute("mainPage", "order/cart.jsp");
						return "index";
					
			}

		
			  @RequestMapping("/product/paynow") 
			  public String paynow(@RequestParam("product_chk") String check,
								  @RequestParam("product_price") String product_price,
								  @RequestParam("product_count") String product_count,
								  @RequestParam("select_price") String select_price,
								  @RequestParam("total_shipping_fee") String total_shipping_fee,
								  @RequestParam("total_price") String total_price,
								  @RequestParam("product_name") String product_name, 
								  @RequestParam("product_filename") String product_filename, 
								  HttpServletRequest req,
								  Model model) { 
			String member_idx =(String)req.getSession().getAttribute("member_idx");
			  if(!StringUtils.hasText(member_idx)) {
			model.addAttribute("msg", "로그인 후 이용해주시기 바랍니다"); 
			model.addAttribute("url", "/login/login");
			return "check/loginCheck"; 
			}else {
			ArrayList<CartDto> cartList = new ArrayList<CartDto>();
			  CartDto dto = new CartDto();
			  dto.setCart_product_idx(Integer.parseInt(check));
			  dto.setProduct_name(product_name);
			  dto.setProduct_filename(product_filename);		
			  dto.setProduct_shipping_fee(Integer.parseInt(total_shipping_fee));	
			  dto.setCart_count(Integer.parseInt(product_count));
			  dto.setProduct_price(Integer.parseInt(product_price));
			  cartList.add(dto);
			  MemberDto m_dto = memberservice.dto(member_idx);
			  System.out.println(cartList.isEmpty());
			  model.addAttribute("select_price", select_price);
			  model.addAttribute("total_shipping_fee", total_shipping_fee);
			  model.addAttribute("total_price", total_price);
			  model.addAttribute("cartList", cartList); 
			 model.addAttribute("dto", m_dto);
			 model.addAttribute("mainPage", "order/order.jsp");
			 return "index";
			   } 
			  }
			 
			@RequestMapping("/order/order")
			public String order(@RequestParam(value="product_chk", required=false) List<String> check,
								@RequestParam("product_price") List<String> product_price,
								@RequestParam("product_count") List<String> product_count,
								@RequestParam("select_price") String select_price,
								@RequestParam("total_shipping_fee") String total_shipping_fee,
								@RequestParam("total_price") String total_price,
									HttpServletRequest req,
									Model model) {
				String member_idx = (String)req.getSession().getAttribute("member_idx");
				if(!StringUtils.hasText(member_idx)) {
					model.addAttribute("msg", "로그인 후 이용해주시기 바랍니다");
					model.addAttribute("url", "/login/login");
					return "check/loginCheck";		
					}else {
						
						List<CartDto> cartList = new ArrayList<CartDto>();
						CartDto dto = null;
						for(int i=0; i<check.size(); i++) {
							String p_check = check.get(i);
							String p_price = product_price.get(i);
							String p_count = product_count.get(i);
							int result = cartservice.cart_update(p_check,p_price,p_count);
							dto = cartservice.cartList_order(member_idx ,p_check);	
							cartList.add(dto);	
						}
						MemberDto m_dto = memberservice.dto(member_idx);
						int o_total_price = 0;
						int o_select_price = 0;
						int o_shipping_fee =0;
						int o_total_shipping_fee=0;
						
						for( int i=0; i<cartList.size();i++) {
							o_select_price += cartList.get(i).getCart_total_price();
							o_shipping_fee += cartList.get(i).getProduct_shipping_fee();
							if(o_shipping_fee >= 3000) {
								o_total_shipping_fee=3000;
							}
							o_total_price= o_select_price + o_total_shipping_fee;
						}
						System.out.println(o_select_price);
						System.out.println(o_total_shipping_fee);
						System.out.println(o_total_price);
						model.addAttribute("select_price", o_select_price);
						model.addAttribute("total_shipping_fee", o_total_shipping_fee);
						model.addAttribute("total_price", o_total_price);
						model.addAttribute("cartList", cartList);
						model.addAttribute("dto", m_dto);
						model.addAttribute("mainPage", "order/order.jsp");
						return "index";
					}
			}
			@RequestMapping("/product/orderForm")
			@ResponseBody
			public String orderForm_p(@RequestParam("cart_idx") List<String> cart_idx,
									@RequestParam("product_idx") List<String> product_idx,
									@RequestParam("cart_count") List<String> cart_count,
									@RequestParam("cart_total_price") List<String> cart_total_price,
									@RequestParam("product_shipping_fee") List<String> product_shipping_fee,
									@RequestParam("recipientName") String recipientName,
									@RequestParam("recipientPhone") String recipientPhone,
									@RequestParam("member_addr1") String member_addr1,
									@RequestParam("member_addr2") String member_addr2,
									@RequestParam("member_addr3") String member_addr3,
									@RequestParam("delivery_m") String delivery_m,
									@RequestParam("total_shipping_fee") String total_shipping_fee,
									@RequestParam("total_price") String total_price,
									@RequestParam("paymentMethod") String paymentMethod,
									HttpServletRequest req,
									Model model) {
				String member_idx = (String)req.getSession().getAttribute("member_idx");
				Date t_date = new Date();
				SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd");
				String d_number= sdf.format(t_date);	
				String seq = String.valueOf(orderlistservice.seq());
				String order_number ="s"+d_number+"_"+seq;
				model.addAttribute("mainPage", "order/orderFinish.jsp");
				int result = orderlistservice.order(order_number,recipientName,recipientPhone,member_addr1,member_addr2,
						 member_addr3,delivery_m,total_shipping_fee,paymentMethod,total_price,member_idx);
				if (result == 1) {
					for(int i=0; i<cart_idx.size(); i++) {
						String cart_n = cart_idx.get(i);
						String product_n = product_idx.get(i);
						String cart_count_n = cart_count.get(i);
						String cart_total_price_n = cart_total_price.get(i);
						String product_shipping_fee_n = product_shipping_fee.get(i);
						int order_item = orderitemservice.add(product_n,cart_total_price_n,cart_count_n,product_shipping_fee_n,seq);
						int cart_delete= cartservice.delete(cart_n);
					}
					return "<script>alert('주문 되었습니다'); location.href='/order/orderFinish?order_number="+order_number+"&total_price="+total_price+"';</script>";
				} else {
					return "<script>alert('주문 실패되었습니다'); history.back(-1);</script>";
				}
			}
			@RequestMapping("/order/orderForm")
			@ResponseBody
			public String orderForm(@RequestParam("cart_idx") List<String> cart_idx,
									@RequestParam("product_idx") List<String> product_idx,
									@RequestParam("cart_count") List<String> cart_count,
									@RequestParam("cart_total_price") List<String> cart_total_price,
									@RequestParam("product_shipping_fee") List<String> product_shipping_fee,
									@RequestParam("recipientName") String recipientName,
									@RequestParam("recipientPhone") String recipientPhone,
									@RequestParam("member_addr1") String member_addr1,
									@RequestParam("member_addr2") String member_addr2,
									@RequestParam("member_addr3") String member_addr3,
									@RequestParam("delivery_m") String delivery_m,
									@RequestParam("total_shipping_fee") String total_shipping_fee,
									@RequestParam("total_price") String total_price,
									@RequestParam("paymentMethod") String paymentMethod,
									HttpServletRequest req,
									Model model) {
				String member_idx = (String)req.getSession().getAttribute("member_idx");
				Date t_date = new Date();
				SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd");
				String d_number= sdf.format(t_date);	
				String seq = String.valueOf(orderlistservice.seq());
				String order_number ="s"+d_number+"_"+seq;
				model.addAttribute("mainPage", "order/orderFinish.jsp");
				int result = orderlistservice.order(order_number,recipientName,recipientPhone,member_addr1,member_addr2,
						 member_addr3,delivery_m,total_shipping_fee,paymentMethod,total_price,member_idx);
				if (result == 1) {
					for(int i=0; i<cart_idx.size(); i++) {
						String cart_n = cart_idx.get(i);
						String product_n = product_idx.get(i);
						String cart_count_n = cart_count.get(i);
						String cart_total_price_n = cart_total_price.get(i);
						String product_shipping_fee_n = product_shipping_fee.get(i);
						int order_item = orderitemservice.add(product_n,cart_total_price_n,cart_count_n,product_shipping_fee_n,seq);
						int cart_delete= cartservice.delete(cart_n);
					}
					return "<script>alert('주문 되었습니다'); location.href='/order/orderFinish?order_number="+order_number+"&total_price="+total_price+"';</script>";
				} else {
					return "<script>alert('주문 실패되었습니다'); history.back(-1);</script>";
				}
			}
			@RequestMapping(value="/order/orderFinish")
			public String orderFinish(@RequestParam("order_number") String order_number,
									@RequestParam("total_price") String total_price,
										Model model) {
				model.addAttribute("order_number", order_number);
				model.addAttribute("total_price", total_price);
				model.addAttribute("mainPage", "order/orderFinish.jsp");
				return "index";
			}
			
			@RequestMapping("/brand/brand")
			public String brand(Model model) {
				model.addAttribute("mainPage", "brand/brand.jsp");
				return "index";
			}
			
			@RequestMapping("/mypage/orderList")
			public String orderList_m(Model model) {
				model.addAttribute("mainPage", "mypage/orderList.jsp");
				return "index";
			}
			@RequestMapping("/mypage/memberModify")
			public String memberModify_m(Model model) {
				model.addAttribute("mainPage", "mypage/memberModify.jsp");
				return "index";
			}
			@RequestMapping("/mypage/passwordModify")
			public String passwordModify_m(Model model) {
				model.addAttribute("mainPage", "mypage/passwordModify.jsp");
				return "index";
			}
			@RequestMapping("/mypage/memberDelete")
			public String memberDelete_m(Model model) {
				model.addAttribute("mainPage", "mypage/memberDelete.jsp");
				return "index";
			}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
//   관리자 페이지 컨트롤러
			
	@RequestMapping("/admin")
	public String admin (Model model) {
	return "/admin/header";
	}		
	@RequestMapping("/admin/logout")
	@ResponseBody
	public String adminLogout(HttpServletRequest req,
							Model model) {
		req.getSession().invalidate();
		return "<script>alert('로그아웃 되었습니다'); location.href='/main';</script>";
	}
	@RequestMapping("/admin/board/eventlist/continue")
	public String adminEvent1(@RequestParam(value = "page", required = false) String page,
								@RequestParam(value="eventSearchCategory",required=false) String category,
								@RequestParam(value="eventSearchValue",required=false) String value,
								Model model) {
		String event_finish = "y";
		int count =0;
		List<EventDto> eventList = null;
		if (page == null) {
			page = "1";
		}
		int page_number = Integer.parseInt(page);
		int page_size = 10;
		int page_start = (page_number - 1) * page_size + 1;
		int page_end = page_number * page_size;
		int block_size = 5;
		int block_group = (int)Math.ceil((double)page_number/block_size);
		int block_start = (block_group -1) * block_size +1;
		int block_end = block_group * block_size;
		int block_total =0;
		System.out.println(category);
		System.out.println(value);
		
        if( StringUtils.hasText(value) ) {
			count = eventservice.count_both(event_finish,category,value);
			eventList=eventservice.eventList_both(event_finish, String.valueOf(page_start),
					String.valueOf(page_end),category, value);
			block_total = (int)Math.ceil((double)count/page_size);
			model.addAttribute("category", category);
			model.addAttribute("value", value);
		}else {
			 count = eventservice.count(event_finish);
			eventList = eventservice.eventList(event_finish, String.valueOf(page_start),
					String.valueOf(page_end));
			block_total = (int)Math.ceil((double)count/page_size);
		}
        if(block_end >= block_total) {
			block_end = block_total;
		}
        model.addAttribute("nowpage", page_number);
		model.addAttribute("block_total", block_total);
		model.addAttribute("block_start", block_start);
		model.addAttribute("block_end", block_end);
		model.addAttribute("eventList", eventList);
		model.addAttribute("count", count);
		model.addAttribute("mainPage", "board/eventlist/continue.jsp");
		return "admin/index";
	}

	 @RequestMapping("/admin/board/eventlist/finish") 
	 public String finish
	 (@RequestParam(value = "page", required = false) String page,
				@RequestParam(value="eventSearchCategory",required=false) String category,
				@RequestParam(value="eventSearchValue",required=false) String value,
				Model model) {
		String event_finish = "n";
		int count =0;
		List<EventDto> eventList = null;
		if (page == null) {
		page = "1";
		}
		int page_number = Integer.parseInt(page);
		int page_size = 10;
		int page_start = (page_number - 1) * page_size + 1;
		int page_end = page_number * page_size;
		int block_size = 5;
		int block_group = (int)Math.ceil((double)page_number/block_size);
		int block_start = (block_group -1) * block_size +1;
		int block_end = block_group * block_size;
		int block_total =0;
		System.out.println(category);
		System.out.println(value);
		
		if( StringUtils.hasText(value) ) {
		count = eventservice.count_both(event_finish,category,value);
		eventList=eventservice.eventList_both(event_finish, String.valueOf(page_start),
			String.valueOf(page_end),category, value);
		model.addAttribute("category", category);
		model.addAttribute("value", value);
		block_total = (int)Math.ceil((double)count/page_size);
		}else {
		count = eventservice.count(event_finish);
		eventList = eventservice.eventList(event_finish, String.valueOf(page_start),
			String.valueOf(page_end));
		block_total = (int)Math.ceil((double)count/page_size);
		}
		if(block_end >= block_total) {
			block_end = block_total;
		}
        model.addAttribute("nowpage", page_number);
		model.addAttribute("block_total", block_total);
		model.addAttribute("block_start", block_start);
		model.addAttribute("block_end", block_end);
		model.addAttribute("eventList", eventList);
		model.addAttribute("count", count);
		model.addAttribute("page", page);
		model.addAttribute("mainPage", "board/eventlist/finish.jsp");
		return "admin/index";
		}

		@RequestMapping("/admin/board/eventlist/eventListDelete")
		@ResponseBody
		public String eventListDelete(@RequestParam("RowCheck") List<String> checkvalue) {
			int result = 0;
			for (String check : checkvalue) {
				result = eventservice.eventListDelete(check);
			}
			if (result == 1) {
				return "<script>alert('삭제 되었습니다'); location.href='/admin/board/eventlist/finish';</script>";
			} else {
				return "<script>alert('삭제 실패되었습니다'); history.back(-1);</script>";
			}
		}
	@RequestMapping("/admin/board/eventlisteventListMove")
	@ResponseBody
	public String eventListMove(@RequestParam("RowCheck") List<String> checkvalue) {
		int result = 0;
		for (String check : checkvalue) {
			result = eventservice.eventListMove(check);
		}
		if (result == 1) {
			return "<script>alert('이동 되었습니다'); location.href='/admin/board/eventlistcontinue';</script>";
		} else {
			return "<script>alert('이동 실패되었습니다'); history.back(-1);</script>";
		}
	}

	@RequestMapping("/admin/board/adminEventView")
	public String adminEvent2(@RequestParam("event_idx") String event_idx,
								Model model) {
		EventDto dto = eventservice.dto(event_idx);
		model.addAttribute("dto", dto);
		model.addAttribute("mainPage", "board/adminEventView.jsp");
		return "admin/index";
	}

	@RequestMapping("/admin/board/adminEventJoin")
	public String adminEventJoin(Model model) {
		model.addAttribute("mainPage", "board/adminEventJoin.jsp");
		return "admin/index";
	}

	@Bean(name = "multipartResolver")
	public CommonsMultipartResolver multipartResolver() {
		CommonsMultipartResolver multipartResolver = new CommonsMultipartResolver();
		multipartResolver.setMaxUploadSize(200000000);
		multipartResolver.setMaxInMemorySize(200000000);
		multipartResolver.setDefaultEncoding("utf-8");
		return multipartResolver;
	}

	@RequestMapping("/admin/board/eventJoinForm")
	@ResponseBody
	public String eventJoinForm(@RequestParam("event_title") String event_title,
			@RequestParam("event_slogan") String event_slogan,
			@RequestParam("event_start_date") String event_start_date,
			@RequestParam("event_end_date") String event_end_date,
			@RequestParam(value = "event_detail_filename", required = false) MultipartFile event_detail_filename,
			@RequestParam(value = "event_banner_filename", required = false) MultipartFile event_banner_filename,
			Model model,HttpServletRequest req) {
//		int member_idx1 = req.getAttribute("member_idx");
		int member_idx = 1;
		String upload_url = fileuploadservice.restore(event_banner_filename);
		String upload_url2 = fileuploadservice.restore(event_detail_filename);
		int result = eventservice.eventJoinAction(event_title, event_slogan, event_start_date, event_end_date,
				upload_url2, upload_url,String.valueOf(member_idx));
		if (result == 1) {
			return "<script>alert('등록 되었습니다'); location.href='/admin/board/eventlist/continue';</script>";
		} else {
			return "<script>alert('등록 실패되었습니다'); history.back(-1);</script>";
		}

	}

	@RequestMapping("/admin/board/adminEventModify")
	public String adminEventModify(@RequestParam("event_idx") String event_idx,
									Model model) {
		EventDto dto = eventservice.dto(event_idx);
		DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
		Date event_start_date = dto.getEvent_start_date();       
		String event_start_date_new = dateFormat.format(event_start_date);
		Date event_end_date = dto.getEvent_end_date();       
		String event_end_date_new = dateFormat.format(event_end_date);
		String banner_filename = dto.getEvent_banner_filename();
		String banner_filename_new= banner_filename.substring(banner_filename.lastIndexOf("/")+1, banner_filename.length());
		dto.setEvent_banner_filename(banner_filename_new);
		String detail_filename = dto.getEvent_detail_filename();
		String detail_filename_new= detail_filename.substring(detail_filename.lastIndexOf("/")+1, detail_filename.length());
		dto.setEvent_detail_filename(detail_filename_new);
		
		model.addAttribute("event_end_date", event_end_date_new); 
		model.addAttribute("event_start_date", event_start_date_new); 
		model.addAttribute("dto", dto);
		model.addAttribute("mainPage", "board/adminEventModify.jsp");
		return "admin/index";
	}
	@RequestMapping("/admin/board/eventModifyAction")
	@ResponseBody
	public String eventModifyAction(@RequestParam("event_idx") String event_idx,
									@RequestParam("event_title") String event_title,
									@RequestParam("event_slogan") String event_slogan,
									@RequestParam("event_start_date") String event_start_date,
									@RequestParam("event_end_date") String event_end_date,
									@RequestParam(value = "event_detail_filename", required = false) MultipartFile event_detail_filename,
									@RequestParam(value = "event_banner_filename", required = false) MultipartFile event_banner_filename,
									Model model) {
		System.out.println(event_detail_filename.getOriginalFilename());
		System.out.println(event_banner_filename.getOriginalFilename());
		String upload_url = fileuploadservice.restore(event_banner_filename);
		String upload_url2 = fileuploadservice.restore(event_detail_filename);
		int result = eventservice.eventModifyAction(event_idx,event_title, event_slogan, event_start_date, event_end_date,
				upload_url2, upload_url);
		if (result == 1) {
			return "<script>alert('수정 되었습니다'); location.href='/admin/board/eventlist/continue';</script>";
		} else {
			return "<script>alert('수정 실패되었습니다'); history.back(-1);</script>";
		}
	}
	
	  @RequestMapping("/admin/board/eventDeleteAction")
	  @ResponseBody
	  public String eventDeleteAction(@RequestParam("event_idx") String event_idx,
			  							Model model	){
		  int result = eventservice.eventDeleteAction(event_idx);
		  if(result == 1) {
			  return "<script>alert('삭제 되었습니다'); location.href='/admin/board/eventlist/continue';</script>";
		  }else {
			  return "<script>alert('삭제 실패되었습니다'); history.back(-1);</script>";
		  }
	
	 }

		@RequestMapping("/admin/order/list/total")
		public String total(@RequestParam(value="orderListCategory",required=false) String category,
							@RequestParam(value="orderValue",required=false) String value,
							@RequestParam(value="orderDateStart",required=false) String orderDateStart,
							@RequestParam(value="orderDateEnd",required=false) String orderDateEnd,
							@RequestParam(value="page",required=false) String page,
							Model model) {
			List<Order_listDto> orderList=null;
			if (page == null) {
				page = "1";
				}
				int page_number = Integer.parseInt(page);
				int page_size = 10;
				int page_start = (page_number - 1) * page_size + 1;
				int page_end = page_number * page_size;
				int block_size = 5;
				int block_group = (int)Math.ceil((double)page_number/block_size);
				int block_start = (block_group -1) * block_size +1;
				int block_end = block_group * block_size;
				int block_total =0;
				int count =0;
			if(StringUtils.hasText(orderDateStart) && StringUtils.hasText(orderDateEnd) && !StringUtils.hasText(value)) {
				System.out.println("date");
				orderList= orderlistservice.orderList_date(orderDateStart,orderDateEnd,String.valueOf(page_start),String.valueOf(page_end));
				count = orderlistservice.count_d(orderDateStart,orderDateEnd);
				block_total = (int)Math.ceil((double)count/page_size);
			}
			else if(StringUtils.hasText(category) && StringUtils.hasText(value) && !StringUtils.hasText(orderDateStart) && !StringUtils.hasText(orderDateEnd)) {
				orderList= orderlistservice.orderList_value(category,value,String.valueOf(page_start),String.valueOf(page_end));
				count = orderlistservice.count_v(category,value);
				block_total = (int)Math.ceil((double)count/page_size);
				System.out.println("value");
			}
			else if(StringUtils.hasText(orderDateStart) && StringUtils.hasText(orderDateEnd) && StringUtils.hasText(value) && StringUtils.hasText(category)) {
				orderList= orderlistservice.orderList_both(orderDateStart,orderDateEnd,category,value,String.valueOf(page_start),String.valueOf(page_end));
				count = orderlistservice.count_b(orderDateStart,orderDateEnd,category,value);
				block_total = (int)Math.ceil((double)count/page_size);
				System.out.println("both");
			}else{
				orderList= orderlistservice.orderList(String.valueOf(page_start),String.valueOf(page_end));
				count = orderlistservice.count();
				block_total = (int)Math.ceil((double)count/page_size);
				System.out.println("other");
			}
			System.out.println(count);
			if(block_end >= block_total) {
				block_end = block_total;
			}
			model.addAttribute("nowpage", page_number);
			model.addAttribute("block_total", block_total);
			model.addAttribute("block_start", block_start);
			model.addAttribute("block_end", block_end);
			model.addAttribute("orderDateStart", orderDateStart);
			model.addAttribute("orderDateEnd", orderDateEnd);
			model.addAttribute("category", category);
			model.addAttribute("value", value);
			model.addAttribute("orderList", orderList);
			model.addAttribute("mainPage", "order/list/total.jsp");
			return "admin/index";
		}
		
		@RequestMapping("/admin/order/list/deliveryCompletion")
		public String deliveryCompletion(@RequestParam(value="orderListCategory",required=false) String category,
							@RequestParam(value="orderValue",required=false) String value,
							@RequestParam(value="orderDateStart",required=false) String orderDateStart,
							@RequestParam(value="orderDateEnd",required=false) String orderDateEnd,
							@RequestParam(value="page",required=false) String page,
							Model model) {
			String status="배송완료";
			List<Order_listDto> orderList=null;
			if (page == null) {
				page = "1";
				}
				int page_number = Integer.parseInt(page);
				int page_size = 10;
				int page_start = (page_number - 1) * page_size + 1;
				int page_end = page_number * page_size;
				int block_size = 5;
				int block_group = (int)Math.ceil((double)page_number/block_size);
				int block_start = (block_group -1) * block_size +1;
				int block_end = block_group * block_size;
				int block_total =0;
				int count =0;
			if(StringUtils.hasText(orderDateStart) && StringUtils.hasText(orderDateEnd) && !StringUtils.hasText(value)) {
				System.out.println("date");
				orderList= orderlistservice.orderList_date1(orderDateStart,orderDateEnd,String.valueOf(page_start),String.valueOf(page_end),status);
				count = orderlistservice.count_d1(orderDateStart,orderDateEnd,status);
				block_total = (int)Math.ceil((double)count/page_size);
			}
			else if(StringUtils.hasText(category) && StringUtils.hasText(value) && !StringUtils.hasText(orderDateStart) && !StringUtils.hasText(orderDateEnd)) {
				orderList= orderlistservice.orderList_value1(category,value,String.valueOf(page_start),String.valueOf(page_end),status);
				count = orderlistservice.count_v1(category,value,status);
				block_total = (int)Math.ceil((double)count/page_size);
				System.out.println("value");
			}
			else if(StringUtils.hasText(orderDateStart) && StringUtils.hasText(orderDateEnd) && StringUtils.hasText(value) && StringUtils.hasText(category)) {
				orderList= orderlistservice.orderList_both1(orderDateStart,orderDateEnd,category,value,String.valueOf(page_start),String.valueOf(page_end),status);
				count = orderlistservice.count_b1(orderDateStart,orderDateEnd,category,value,status);
				block_total = (int)Math.ceil((double)count/page_size);
				System.out.println("both");
			}else{
				orderList= orderlistservice.orderList1(String.valueOf(page_start),String.valueOf(page_end),status);
				count = orderlistservice.count1(status);
				block_total = (int)Math.ceil((double)count/page_size);
				System.out.println("other");
			}
			System.out.println(count);
			if(block_end >= block_total) {
				block_end = block_total;
			}
			model.addAttribute("nowpage", page_number);
			model.addAttribute("block_total", block_total);
			model.addAttribute("block_start", block_start);
			model.addAttribute("block_end", block_end);
			model.addAttribute("orderDateStart", orderDateStart);
			model.addAttribute("orderDateEnd", orderDateEnd);
			model.addAttribute("category", category);
			model.addAttribute("value", value);
			model.addAttribute("orderList", orderList);
			model.addAttribute("mainPage", "order/list/deliveryCompletion.jsp");
			return "admin/index";
		}
		@RequestMapping("/admin/order/list/deliveryReady")
		public String deliveryReady(@RequestParam(value="orderListCategory",required=false) String category,
							@RequestParam(value="orderValue",required=false) String value,
							@RequestParam(value="orderDateStart",required=false) String orderDateStart,
							@RequestParam(value="orderDateEnd",required=false) String orderDateEnd,
							@RequestParam(value="page",required=false) String page,
							Model model) {
			String status="배송준비중";
			List<Order_listDto> orderList=null;
			if (page == null) {
				page = "1";
				}
				int page_number = Integer.parseInt(page);
				int page_size = 10;
				int page_start = (page_number - 1) * page_size + 1;
				int page_end = page_number * page_size;
				int block_size = 5;
				int block_group = (int)Math.ceil((double)page_number/block_size);
				int block_start = (block_group -1) * block_size +1;
				int block_end = block_group * block_size;
				int block_total =0;
				int count =0;
			if(StringUtils.hasText(orderDateStart) && StringUtils.hasText(orderDateEnd) && !StringUtils.hasText(value)) {
				System.out.println("date");
				orderList= orderlistservice.orderList_date1(orderDateStart,orderDateEnd,String.valueOf(page_start),String.valueOf(page_end),status);
				count = orderlistservice.count_d1(orderDateStart,orderDateEnd,status);
				block_total = (int)Math.ceil((double)count/page_size);
			}
			else if(StringUtils.hasText(category) && StringUtils.hasText(value) && !StringUtils.hasText(orderDateStart) && !StringUtils.hasText(orderDateEnd)) {
				orderList= orderlistservice.orderList_value1(category,value,String.valueOf(page_start),String.valueOf(page_end),status);
				count = orderlistservice.count_v1(category,value,status);
				block_total = (int)Math.ceil((double)count/page_size);
				System.out.println("value");
			}
			else if(StringUtils.hasText(orderDateStart) && StringUtils.hasText(orderDateEnd) && StringUtils.hasText(value) && StringUtils.hasText(category)) {
				orderList= orderlistservice.orderList_both1(orderDateStart,orderDateEnd,category,value,String.valueOf(page_start),String.valueOf(page_end),status);
				count = orderlistservice.count_b1(orderDateStart,orderDateEnd,category,value,status);
				block_total = (int)Math.ceil((double)count/page_size);
				System.out.println("both");
			}else{
				orderList= orderlistservice.orderList1(String.valueOf(page_start),String.valueOf(page_end),status);
				count = orderlistservice.count1(status);
				block_total = (int)Math.ceil((double)count/page_size);
				System.out.println("other");
			}
			System.out.println(count);
			if(block_end >= block_total) {
				block_end = block_total;
			}
			model.addAttribute("nowpage", page_number);
			model.addAttribute("block_total", block_total);
			model.addAttribute("block_start", block_start);
			model.addAttribute("block_end", block_end);
			model.addAttribute("orderDateStart", orderDateStart);
			model.addAttribute("orderDateEnd", orderDateEnd);
			model.addAttribute("category", category);
			model.addAttribute("value", value);
			model.addAttribute("orderList", orderList);
			model.addAttribute("mainPage", "order/list/deliveryReady.jsp");
			return "admin/index";
		}
		@RequestMapping("/admin/order/list/payCompletion")
		public String payCompletion(@RequestParam(value="orderListCategory",required=false) String category,
							@RequestParam(value="orderValue",required=false) String value,
							@RequestParam(value="orderDateStart",required=false) String orderDateStart,
							@RequestParam(value="orderDateEnd",required=false) String orderDateEnd,
							@RequestParam(value="page",required=false) String page,
							Model model) {
			String status="결제완료";
			List<Order_listDto> orderList=null;
			if (page == null) {
				page = "1";
				}
				int page_number = Integer.parseInt(page);
				int page_size = 10;
				int page_start = (page_number - 1) * page_size + 1;
				int page_end = page_number * page_size;
				int block_size = 5;
				int block_group = (int)Math.ceil((double)page_number/block_size);
				int block_start = (block_group -1) * block_size +1;
				int block_end = block_group * block_size;
				int block_total =0;
				int count =0;
			if(StringUtils.hasText(orderDateStart) && StringUtils.hasText(orderDateEnd) && !StringUtils.hasText(value)) {
				System.out.println("date");
				orderList= orderlistservice.orderList_date1(orderDateStart,orderDateEnd,String.valueOf(page_start),String.valueOf(page_end),status);
				count = orderlistservice.count_d1(orderDateStart,orderDateEnd,status);
				block_total = (int)Math.ceil((double)count/page_size);
			}
			else if(StringUtils.hasText(category) && StringUtils.hasText(value) && !StringUtils.hasText(orderDateStart) && !StringUtils.hasText(orderDateEnd)) {
				orderList= orderlistservice.orderList_value1(category,value,String.valueOf(page_start),String.valueOf(page_end),status);
				count = orderlistservice.count_v1(category,value,status);
				block_total = (int)Math.ceil((double)count/page_size);
				System.out.println("value");
			}
			else if(StringUtils.hasText(orderDateStart) && StringUtils.hasText(orderDateEnd) && StringUtils.hasText(value) && StringUtils.hasText(category)) {
				orderList= orderlistservice.orderList_both1(orderDateStart,orderDateEnd,category,value,String.valueOf(page_start),String.valueOf(page_end),status);
				count = orderlistservice.count_b1(orderDateStart,orderDateEnd,category,value,status);
				block_total = (int)Math.ceil((double)count/page_size);
				System.out.println("both");
			}else{
				orderList= orderlistservice.orderList1(String.valueOf(page_start),String.valueOf(page_end),status);
				count = orderlistservice.count1(status);
				block_total = (int)Math.ceil((double)count/page_size);
				System.out.println("other");
			}
			System.out.println(count);
			if(block_end >= block_total) {
				block_end = block_total;
			}
			model.addAttribute("nowpage", page_number);
			model.addAttribute("block_total", block_total);
			model.addAttribute("block_start", block_start);
			model.addAttribute("block_end", block_end);
			model.addAttribute("orderDateStart", orderDateStart);
			model.addAttribute("orderDateEnd", orderDateEnd);
			model.addAttribute("category", category);
			model.addAttribute("value", value);
			model.addAttribute("orderList", orderList);
			model.addAttribute("mainPage", "order/list/payCompletion.jsp");
			return "admin/index";
		}
		@RequestMapping("/admin/order/list/shipping")
		public String shipping(@RequestParam(value="orderListCategory",required=false) String category,
							@RequestParam(value="orderValue",required=false) String value,
							@RequestParam(value="orderDateStart",required=false) String orderDateStart,
							@RequestParam(value="orderDateEnd",required=false) String orderDateEnd,
							@RequestParam(value="page",required=false) String page,
							Model model) {
			String status="배송중";
			List<Order_listDto> orderList=null;
			if (page == null) {
				page = "1";
				}
				int page_number = Integer.parseInt(page);
				int page_size = 10;
				int page_start = (page_number - 1) * page_size + 1;
				int page_end = page_number * page_size;
				int block_size = 5;
				int block_group = (int)Math.ceil((double)page_number/block_size);
				int block_start = (block_group -1) * block_size +1;
				int block_end = block_group * block_size;
				int block_total =0;
				int count =0;
			if(StringUtils.hasText(orderDateStart) && StringUtils.hasText(orderDateEnd) && !StringUtils.hasText(value)) {
				System.out.println("date");
				orderList= orderlistservice.orderList_date1(orderDateStart,orderDateEnd,String.valueOf(page_start),String.valueOf(page_end),status);
				count = orderlistservice.count_d1(orderDateStart,orderDateEnd,status);
				block_total = (int)Math.ceil((double)count/page_size);
			}
			else if(StringUtils.hasText(category) && StringUtils.hasText(value) && !StringUtils.hasText(orderDateStart) && !StringUtils.hasText(orderDateEnd)) {
				orderList= orderlistservice.orderList_value1(category,value,String.valueOf(page_start),String.valueOf(page_end),status);
				count = orderlistservice.count_v1(category,value,status);
				block_total = (int)Math.ceil((double)count/page_size);
				System.out.println("value");
			}
			else if(StringUtils.hasText(orderDateStart) && StringUtils.hasText(orderDateEnd) && StringUtils.hasText(value) && StringUtils.hasText(category)) {
				orderList= orderlistservice.orderList_both1(orderDateStart,orderDateEnd,category,value,String.valueOf(page_start),String.valueOf(page_end),status);
				count = orderlistservice.count_b1(orderDateStart,orderDateEnd,category,value,status);
				block_total = (int)Math.ceil((double)count/page_size);
				System.out.println("both");
			}else{
				orderList= orderlistservice.orderList1(String.valueOf(page_start),String.valueOf(page_end),status);
				count = orderlistservice.count1(status);
				block_total = (int)Math.ceil((double)count/page_size);
				System.out.println("other");
			}
			System.out.println(count);
			if(block_end >= block_total) {
				block_end = block_total;
			}
			model.addAttribute("nowpage", page_number);
			model.addAttribute("block_total", block_total);
			model.addAttribute("block_start", block_start);
			model.addAttribute("block_end", block_end);
			model.addAttribute("orderDateStart", orderDateStart);
			model.addAttribute("orderDateEnd", orderDateEnd);
			model.addAttribute("category", category);
			model.addAttribute("value", value);
			model.addAttribute("orderList", orderList);
			model.addAttribute("mainPage", "order/list/shipping.jsp");
			return "admin/index";
		}
		@RequestMapping("/admin/order/list/waiting")
		public String waiting(@RequestParam(value="orderListCategory",required=false) String category,
							@RequestParam(value="orderValue",required=false) String value,
							@RequestParam(value="orderDateStart",required=false) String orderDateStart,
							@RequestParam(value="orderDateEnd",required=false) String orderDateEnd,
							@RequestParam(value="page",required=false) String page,
							Model model) {
			String status="입금대기";
			List<Order_listDto> orderList=null;
			if (page == null) {
				page = "1";
				}
				int page_number = Integer.parseInt(page);
				int page_size = 10;
				int page_start = (page_number - 1) * page_size + 1;
				int page_end = page_number * page_size;
				int block_size = 5;
				int block_group = (int)Math.ceil((double)page_number/block_size);
				int block_start = (block_group -1) * block_size +1;
				int block_end = block_group * block_size;
				int block_total =0;
				int count =0;
			if(StringUtils.hasText(orderDateStart) && StringUtils.hasText(orderDateEnd) && !StringUtils.hasText(value)) {
				System.out.println("date");
				orderList= orderlistservice.orderList_date1(orderDateStart,orderDateEnd,String.valueOf(page_start),String.valueOf(page_end),status);
				count = orderlistservice.count_d1(orderDateStart,orderDateEnd,status);
				block_total = (int)Math.ceil((double)count/page_size);
			}
			else if(StringUtils.hasText(category) && StringUtils.hasText(value) && !StringUtils.hasText(orderDateStart) && !StringUtils.hasText(orderDateEnd)) {
				orderList= orderlistservice.orderList_value1(category,value,String.valueOf(page_start),String.valueOf(page_end),status);
				count = orderlistservice.count_v1(category,value,status);
				block_total = (int)Math.ceil((double)count/page_size);
				System.out.println("value");
			}
			else if(StringUtils.hasText(orderDateStart) && StringUtils.hasText(orderDateEnd) && StringUtils.hasText(value) && StringUtils.hasText(category)) {
				orderList= orderlistservice.orderList_both1(orderDateStart,orderDateEnd,category,value,String.valueOf(page_start),String.valueOf(page_end),status);
				count = orderlistservice.count_b1(orderDateStart,orderDateEnd,category,value,status);
				block_total = (int)Math.ceil((double)count/page_size);
				System.out.println("both");
			}else{
				orderList= orderlistservice.orderList1(String.valueOf(page_start),String.valueOf(page_end),status);
				count = orderlistservice.count1(status);
				block_total = (int)Math.ceil((double)count/page_size);
				System.out.println("other");
			}
			System.out.println(count);
			if(block_end >= block_total) {
				block_end = block_total;
			}
			model.addAttribute("nowpage", page_number);
			model.addAttribute("block_total", block_total);
			model.addAttribute("block_start", block_start);
			model.addAttribute("block_end", block_end);
			model.addAttribute("orderDateStart", orderDateStart);
			model.addAttribute("orderDateEnd", orderDateEnd);
			model.addAttribute("category", category);
			model.addAttribute("value", value);
			model.addAttribute("orderList", orderList);
			model.addAttribute("mainPage", "order/list/waiting.jsp");
			return "admin/index";
		}
		@RequestMapping("/admin/order/list/orderListMove")
		@ResponseBody
		public String orderMove(@RequestParam("RowCheck") List<String> checkvalue,
								@RequestParam("orderMoveSelect") String category,
								Model model) {
			int result = 0;
			for (String check : checkvalue) {
				result = orderlistservice.orderListMove(check,category);
			}
			if (result == 1) {
				return "<script>alert('이동 되었습니다'); location.href='/admin/order/list/total';</script>";
			} else {
				return "<script>alert('이동 실패되었습니다'); history.back(-1);</script>";
			}
		}
		@RequestMapping("/admin/order/orderListMove")
		@ResponseBody
		public String orderMove(@RequestParam("orderMoveSelect") String category,
								@RequestParam("order_idx") String order_idx,
								Model model) {
			int result = 0;
			
			result = orderlistservice.orderListMove(order_idx,category);

			if (result == 1) {
				return "<script>alert('이동 되었습니다'); location.href='/admin/order/list/total';</script>";
			} else {
				return "<script>alert('이동 실패되었습니다'); history.back(-1);</script>";
			}
		}
		
		@RequestMapping("/admin/order/adminOrderView")
		public String adminOrderView(@RequestParam("order_idx") String order_idx,
									@RequestParam("order_member_idx") String order_member_idx,
										Model model) {
		Order_listDto orderListDto = orderlistservice.orderListDto(order_idx);
		MemberDto memberDto = orderlistservice.memberDto(order_member_idx);
		List<Order_itemDto> itemList = orderlistservice.itemList(order_idx);
		model.addAttribute("itemList", itemList);
		model.addAttribute("orderListDto", orderListDto);
		model.addAttribute("memberDto", memberDto);
		model.addAttribute("mainPage", "order/adminOrderView.jsp");
		return "admin/index";
		}
		@RequestMapping("/admin/order/orderCancel")
		@ResponseBody
		public String orderCancel(@RequestParam("order_idx") String order_idx,
									Model model) {
			int result = orderlistservice.orderCancel(order_idx);
			int cancelInsert =orderlistservice.cancelInsert(order_idx);
			if (result == 1) {
				return "<script>alert('주문 취소되었습니다'); location.href='/admin/order/list/total';</script>";
			} else {
				return "<script>alert('주문 취소실패되었습니다'); history.back(-1);</script>";
			}
		}
		@RequestMapping("/admin/order/cancel/before")
		public String before(@RequestParam(value="orderListCategory",required=false) String category,
							@RequestParam(value="orderValue",required=false) String value,
							@RequestParam(value="orderDateStart",required=false) String orderDateStart,
							@RequestParam(value="orderDateEnd",required=false) String orderDateEnd,
							@RequestParam(value="page",required=false) String page,
							Model model) {
			String status="주문취소";
			List<Order_cancelDto> orderCancelList=null;
			if (page == null) {
				page = "1";
				}
				int page_number = Integer.parseInt(page);
				int page_size = 10;
				int page_start = (page_number - 1) * page_size + 1;
				int page_end = page_number * page_size;
				int block_size = 5;
				int block_group = (int)Math.ceil((double)page_number/block_size);
				int block_start = (block_group -1) * block_size +1;
				int block_end = block_group * block_size;
				int block_total =0;
				int count =0;
			if(StringUtils.hasText(orderDateStart) && StringUtils.hasText(orderDateEnd) && !StringUtils.hasText(value)) {
				System.out.println("date");
				orderCancelList= ordercancellistservice.orderCancelList_date(orderDateStart,orderDateEnd,String.valueOf(page_start),String.valueOf(page_end),status);
				count = ordercancellistservice.count_d(orderDateStart,orderDateEnd,status);
				block_total = (int)Math.ceil((double)count/page_size);
			}
			else if(StringUtils.hasText(category) && StringUtils.hasText(value) && !StringUtils.hasText(orderDateStart) && !StringUtils.hasText(orderDateEnd)) {
				orderCancelList= ordercancellistservice.orderCancelList_value(category,value,String.valueOf(page_start),String.valueOf(page_end),status);
				count = ordercancellistservice.count_v(category,value,status);
				block_total = (int)Math.ceil((double)count/page_size);
				System.out.println("value");
			}
			else if(StringUtils.hasText(orderDateStart) && StringUtils.hasText(orderDateEnd) && StringUtils.hasText(value) && StringUtils.hasText(category)) {
				orderCancelList= ordercancellistservice.orderCancelList_both(orderDateStart,orderDateEnd,category,value,String.valueOf(page_start),String.valueOf(page_end),status);
				count = ordercancellistservice.count_b(orderDateStart,orderDateEnd,category,value,status);
				block_total = (int)Math.ceil((double)count/page_size);
				System.out.println("both");
			}else{
				orderCancelList= ordercancellistservice.orderCancelList(String.valueOf(page_start),String.valueOf(page_end),status);
				count = ordercancellistservice.count(status);
				block_total = (int)Math.ceil((double)count/page_size);
				System.out.println("other");
			}
			System.out.println(count);
			if(block_end >= block_total) {
				block_end = block_total;
			}
			model.addAttribute("nowpage", page_number);
			model.addAttribute("block_total", block_total);
			model.addAttribute("block_start", block_start);
			model.addAttribute("block_end", block_end);
			model.addAttribute("orderDateStart", orderDateStart);
			model.addAttribute("orderDateEnd", orderDateEnd);
			model.addAttribute("category", category);
			model.addAttribute("value", value);
			model.addAttribute("orderCancelList", orderCancelList);
			model.addAttribute("mainPage", "order/cancel/before.jsp");
			return "admin/index";
		}
		@RequestMapping("/admin/order/cancel/after")
		public String after(@RequestParam(value="orderListCategory",required=false) String category,
							@RequestParam(value="orderValue",required=false) String value,
							@RequestParam(value="orderDateStart",required=false) String orderDateStart,
							@RequestParam(value="orderDateEnd",required=false) String orderDateEnd,
							@RequestParam(value="page",required=false) String page,
							Model model) {
			String status="주문취소완료";
			List<Order_cancelDto> orderCancelList=null;
			if (page == null) {
				page = "1";
				}
				int page_number = Integer.parseInt(page);
				int page_size = 10;
				int page_start = (page_number - 1) * page_size + 1;
				int page_end = page_number * page_size;
				int block_size = 5;
				int block_group = (int)Math.ceil((double)page_number/block_size);
				int block_start = (block_group -1) * block_size +1;
				int block_end = block_group * block_size;
				int block_total =0;
				int count =0;
			if(StringUtils.hasText(orderDateStart) && StringUtils.hasText(orderDateEnd) && !StringUtils.hasText(value)) {
				System.out.println("date");
				orderCancelList= ordercancellistservice.orderCancelList_date(orderDateStart,orderDateEnd,String.valueOf(page_start),String.valueOf(page_end),status);
				count = ordercancellistservice.count_d(orderDateStart,orderDateEnd,status);
				block_total = (int)Math.ceil((double)count/page_size);
			}
			else if(StringUtils.hasText(category) && StringUtils.hasText(value) && !StringUtils.hasText(orderDateStart) && !StringUtils.hasText(orderDateEnd)) {
				orderCancelList= ordercancellistservice.orderCancelList_value(category,value,String.valueOf(page_start),String.valueOf(page_end),status);
				count = ordercancellistservice.count_v(category,value,status);
				block_total = (int)Math.ceil((double)count/page_size);
				System.out.println("value");
			}
			else if(StringUtils.hasText(orderDateStart) && StringUtils.hasText(orderDateEnd) && StringUtils.hasText(value) && StringUtils.hasText(category)) {
				orderCancelList= ordercancellistservice.orderCancelList_both(orderDateStart,orderDateEnd,category,value,String.valueOf(page_start),String.valueOf(page_end),status);
				count = ordercancellistservice.count_b(orderDateStart,orderDateEnd,category,value,status);
				block_total = (int)Math.ceil((double)count/page_size);
				System.out.println("both");
			}else{
				orderCancelList= ordercancellistservice.orderCancelList(String.valueOf(page_start),String.valueOf(page_end),status);
				count = ordercancellistservice.count(status);
				block_total = (int)Math.ceil((double)count/page_size);
				System.out.println("other");
			}
			System.out.println(count);
			if(block_end >= block_total) {
				block_end = block_total;
			}
			model.addAttribute("nowpage", page_number);
			model.addAttribute("block_total", block_total);
			model.addAttribute("block_start", block_start);
			model.addAttribute("block_end", block_end);
			model.addAttribute("orderDateStart", orderDateStart);
			model.addAttribute("orderDateEnd", orderDateEnd);
			model.addAttribute("category", category);
			model.addAttribute("value", value);
			model.addAttribute("orderCancelList", orderCancelList);
			model.addAttribute("mainPage", "order/cancel/after.jsp");
			return "admin/index";
		}
		@RequestMapping("/admin/order/adminOrderCancelView")
		public String adminOrderCancelView( @RequestParam("order_idx") String order_idx,
											@RequestParam("order_member_idx") String order_member_idx,
											 Model model)
											  {
			
			  Order_listDto orderListDto = orderlistservice.orderListDto(order_idx);
			  MemberDto memberDto = orderlistservice.memberDto(order_member_idx);
			  List<Order_itemDto> itemList = orderlistservice.itemList(order_idx);
			  model.addAttribute("itemList", itemList);
			  model.addAttribute("orderListDto",orderListDto);
			  model.addAttribute("memberDto", memberDto);
			 
		model.addAttribute("mainPage", "order/adminOrderCancelView.jsp");
		return "admin/index";
		}
		@RequestMapping("/admin/order/cancel/orderCancelListMove")
		@ResponseBody
		public String orderCancelListMove(@RequestParam("RowCheck") List<String> checkvalue,
								Model model) {
			int result = 0;
			for (String check : checkvalue) {
				result = ordercancellistservice.orderCancelListMove(check);
			}
			if (result == 1) {
				return "<script>alert('이동 되었습니다'); location.href='/admin/order/cancel/before';</script>";
			} else {
				return "<script>alert('이동 실패되었습니다'); history.back(-1);</script>";
			}
		}
		@RequestMapping("/admin/member/memberList")
		public String memberList(@RequestParam(value="memberSearchSelect",required=false) String category,
								@RequestParam(value="memberSearchValue",required=false) String value,
								@RequestParam(value="member_joindate_start",required=false) String joindate_start,
								@RequestParam(value="member_joindate_end",required=false) String joindate_end,
								@RequestParam(value="member_amount_start",required=false) String amount_start,
								@RequestParam(value="member_amount_end",required=false) String amount_end,
								@RequestParam(value="member_detail_select",required=false) String detail_select,
								@RequestParam(value="email_YN",required=false) String email_yn,
								@RequestParam(value="page",required=false) String page,
									Model model) {
			List<MemberDto> memberList = null;
			if (page == null) {
				page = "1";
				}
				int page_number = Integer.parseInt(page);
				int page_size = 10;
				int page_start = (page_number - 1) * page_size + 1;
				int page_end = page_number * page_size;
				int block_size = 5;
				int block_group = (int)Math.ceil((double)page_number/block_size);
				int block_start = (block_group -1) * block_size +1;
				int block_end = block_group * block_size;
				int block_total =0;
			int count_member = memberservice.count_member();
			int count_admin = memberservice.count_admin();
			int count_search = 0;
			if(StringUtils.hasText(value)) {
			    memberList = memberservice.memberList_value(category,value,String.valueOf(page_start),String.valueOf(page_end));
			    count_search= memberservice.count_search_value(category,value);
			    block_total = (int)Math.ceil((double)count_search/page_size);
			    System.out.println("value");
			    model.addAttribute("category", category);
			    model.addAttribute("value", value);
			}else if(StringUtils.hasText(joindate_start)&&StringUtils.hasText(joindate_end)&&
					!StringUtils.hasText(amount_start)&& !StringUtils.hasText(amount_end)&& StringUtils.hasText(email_yn)) {
				System.out.println("date");
			    memberList = memberservice.memberList_date(joindate_start,joindate_end,detail_select,email_yn,String.valueOf(page_start),String.valueOf(page_end));
			    count_search= memberservice.count_search_date(joindate_start,joindate_end,detail_select,email_yn);
			    block_total = (int)Math.ceil((double)count_search/page_size);
			}else if(!StringUtils.hasText(joindate_start)&& !StringUtils.hasText(joindate_end)&&
					StringUtils.hasText(amount_start)&& StringUtils.hasText(amount_end)&& StringUtils.hasText(email_yn)) {
				System.out.println("amount");
			    memberList = memberservice.memberList_amount(amount_start,amount_end,detail_select,email_yn,String.valueOf(page_start),String.valueOf(page_end));
			    count_search= memberservice.count_search_amount(amount_start,amount_end,detail_select,email_yn);
			    block_total = (int)Math.ceil((double)count_search/page_size);
			}else if(!StringUtils.hasText(joindate_start)&& !StringUtils.hasText(joindate_end)&&
					!StringUtils.hasText(amount_start)&& !StringUtils.hasText(amount_end)&& StringUtils.hasText(email_yn)) {
				System.out.println("email_yn");
			    memberList = memberservice.memberList_email_yn(detail_select,email_yn,String.valueOf(page_start),String.valueOf(page_end));
			    count_search= memberservice.count_search_email_yn(detail_select,email_yn);
			    block_total = (int)Math.ceil((double)count_search/page_size);
			}else if(StringUtils.hasText(joindate_start)&& StringUtils.hasText(joindate_end)&&
					StringUtils.hasText(amount_start)&& StringUtils.hasText(amount_end)&& StringUtils.hasText(email_yn)) {
				System.out.println("both");
			    memberList = memberservice.memberList_both(joindate_start,joindate_end,amount_start,amount_end,detail_select,email_yn,String.valueOf(page_start),String.valueOf(page_end));
			    count_search= memberservice.count_search_both(joindate_start,joindate_end,amount_start,amount_end,detail_select,email_yn);
			    block_total = (int)Math.ceil((double)count_search/page_size);
			}
			else {
				System.out.println("other");
				memberList = memberservice.memberList(String.valueOf(page_start),String.valueOf(page_end));
				count_search= memberservice.count_search();
				block_total = (int)Math.ceil((double)count_search/page_size);
			}
			System.out.println(block_total);
			if(block_end >= block_total) {
				block_end = block_total;
			}
			 model.addAttribute("joindate_start", joindate_start);
			 model.addAttribute("joindate_end", joindate_end);
			 model.addAttribute("amount_start", amount_start);
			 model.addAttribute("amount_end", amount_end);
			 model.addAttribute("detail_select", detail_select);
			 model.addAttribute("email_yn", email_yn);
			model.addAttribute("nowpage", page_number);
			model.addAttribute("block_total", block_total);
			model.addAttribute("block_start", block_start);
			model.addAttribute("block_end", block_end);
			model.addAttribute("count_search", count_search);
			model.addAttribute("count_member", count_member);
			model.addAttribute("count_admin", count_admin);
			model.addAttribute("memberList", memberList);
			model.addAttribute("mainPage", "member/memberList.jsp");
			return "admin/index";
		}
		@RequestMapping("/admin/member/memberDelete")
		@ResponseBody
		public String memberDelete(@RequestParam("RowCheck") List<String> checkvalue,
									Model model) {
			int result = 0;
			for(String check : checkvalue) {
				 result = memberservice.memberDelete(check);
			}
			if(result==1) {
				return "<script>alert('탈퇴 되었습니다');location.href='/admin/member/memberList';</script>";
			}else {
				return "<script>alert('탈퇴 실패되었습니다');history.back(-1);</script>";
			}
			
		}
		
		@RequestMapping("/admin/member/memberView")
		public String memberView(@RequestParam("member_idx") String member_idx,
								Model model) {
			MemberDto dto = memberservice.dto(member_idx);
			String tel = dto.getMember_phone();
			String tel1 = tel.substring(0, 3);
			String tel2 = tel.substring(3, 7);
			String tel3 = tel.substring(7, tel.length());
			model.addAttribute("tel1", tel1);
			model.addAttribute("tel2", tel2);
			model.addAttribute("tel3", tel3);
			model.addAttribute("dto", dto);
			model.addAttribute("mainPage", "member/memberView.jsp");
			return "admin/index";
		}
		@RequestMapping("/admin/member/memberModify")
		@ResponseBody
		public String memberModify(@RequestParam("member_idx") String member_idx,
									@RequestParam("email_YN") String email_yn,
									@RequestParam("member_password") String member_password,
									@RequestParam("tel1") String tel1,
									@RequestParam("tel2") String tel2,
									@RequestParam("tel3") String tel3,
									@RequestParam("member_addr1") String addr1,
									@RequestParam("member_addr2") String addr2,
									@RequestParam("member_addr3") String addr3,
									Model model) {
			
			String tel = tel1+tel2+tel3;
			int result = memberservice.memberModify(member_idx,email_yn,member_password,tel,addr1,addr2,addr3);
			if(result==1) {
				return "<script>alert('수정 되었습니다');location.href='/admin/member/memberList';</script>";
			}else {
				return "<script>alert('수정 실패되었습니다');history.back(-1);</script>";
			}
		}
		@RequestMapping("/admin/board/noticeList")
			public String noticeList (@RequestParam(value="page",required=false) String page,
									 @RequestParam(value="noticeCategory",required=false) String category,
									 @RequestParam(value="noticeValue",required=false) String value,
										Model model) {
			int count =0;
			List<NoticeDto> noticeList = null;
			if (page == null) {
			page = "1";
			}
			int page_number = Integer.parseInt(page);
			int page_size = 10;
			int page_start = (page_number - 1) * page_size + 1;
			int page_end = page_number * page_size;
			int block_size = 5;
			int block_group = (int)Math.ceil((double)page_number/block_size);
			int block_start = (block_group -1) * block_size +1;
			int block_end = block_group * block_size;
			int block_total =0;
			System.out.println(category);
			System.out.println(value);
			
			if( StringUtils.hasText(value) ) {
			count = noticeservice.count_both(category,value);
			noticeList=noticeservice.noticeList_both(String.valueOf(page_start),
				String.valueOf(page_end),category, value);
			model.addAttribute("category", category);
			model.addAttribute("value", value);
			block_total = (int)Math.ceil((double)count/page_size);
			}else {
			count = noticeservice.count();
			noticeList = noticeservice.noticeList( String.valueOf(page_start),
				String.valueOf(page_end));
			block_total = (int)Math.ceil((double)count/page_size);
			}
			if(block_end >= block_total) {
				block_end = block_total;
			}
	        model.addAttribute("nowpage", page_number);
			model.addAttribute("block_total", block_total);
			model.addAttribute("block_start", block_start);
			model.addAttribute("block_end", block_end);
			model.addAttribute("count", count);
			model.addAttribute("noticeList", noticeList);
			model.addAttribute("mainPage", "board/noticeList.jsp");
			return "admin/index";
		}
		@RequestMapping("/admin/board/noticeJoin")
		public String noticeJoin (Model model) {
		model.addAttribute("mainPage", "board/noticeJoin.jsp");
		return "admin/index";
		}
		@RequestMapping("/admin/board/noticeJoinForm")
		@ResponseBody
		public String noticeJoinForm (@RequestParam(value="notice_important_YN" ,required=false) String important_yn,
								 @RequestParam("notice_title") String notice_title,
								 @RequestParam("editor4") String notice_content,
									Model model,HttpServletRequest req) {
//		int member_idx1 = req.getAttribute("member_idx");
		int member_idx = 1;
		if(important_yn == null) {
			important_yn ="N";
		}
		int result = noticeservice.noticeJoin(String.valueOf(member_idx),important_yn,notice_title,notice_content);
		if(result == 1) {
			return "<script>alert('공지사항이 등록되었습니다');location.href='/admin/board/noticeList';</script>";
		}else {
			return "<script>alert('공지사항이 등록실패되었습니다');history.back(-1);</script>";
		}
		
		}
		@RequestMapping("/admin/board/noticeModify")
		public String noticeModify (@RequestParam("notice_idx") String notice_idx,
									Model model) {
			NoticeDto dto = noticeservice.dto(notice_idx);
			model.addAttribute("dto", dto);
		model.addAttribute("mainPage", "board/noticeModify.jsp");
		return "admin/index";
		}
		
		@RequestMapping("/admin/board/noticeModifyForm")
		@ResponseBody
		public String noticeModifyForm (@RequestParam("notice_idx") String notice_idx,
								@RequestParam(value="notice_important_YN" ,required=false) String important_yn,
								 @RequestParam("notice_title") String notice_title,
								 @RequestParam("editor4") String notice_content,
									Model model) {
		if(important_yn == null) {
			important_yn ="N";
		}
		int result = noticeservice.noticeModify(notice_idx,important_yn,notice_title,notice_content);
		if(result == 1) {
			return "<script>alert('공지사항이 수정되었습니다');location.href='admin/board/noticeList';</script>";
		}else {
			return "<script>alert('공지사항이 수정실패되었습니다');history.back(-1);</script>";
		}
		
		}
		@RequestMapping("/admin/board/noticeDelete")
		@ResponseBody
		public String noticeDelete (@RequestParam("notice_idx") String notice_idx,
									Model model) {
	
		int result = noticeservice.noticeDelete(notice_idx);
		if(result == 1) {
			return "<script>alert('공지사항이 삭제되었습니다');location.href='/admin/board/noticeList';</script>";
		}else {
			return "<script>alert('공지사항이 삭제실패되었습니다');history.back(-1);</script>";
		}
		
		}
		
		@RequestMapping("/admin/board/noticeView")
		public String noticeView (@RequestParam("notice_idx") String notice_idx,
									Model model) {
		NoticeDto dto = noticeservice.dto(notice_idx);
		model.addAttribute("dto", dto);
		model.addAttribute("mainPage", "board/noticeView.jsp");
		return "admin/index";
		}
		
		//메일관리
		@RequestMapping("/admin/member/mailList")
		public String adminMailList(Model model) {
			System.out.println("Dispatch : admin/member/mailList.jsp");
			
			model.addAttribute("mainPage", "member/mailList.jsp");
			
			return "admin/index";		//"admin/member/mailList.jsp" 디스패치
		} 
		
		@RequestMapping("/admin/member/mail")
		  public String execMail(MailDto mailDto,
				  					Model model) {
	        mailservice.mailSend(mailDto);
	        model.addAttribute("mainPage", "member/mailList.jsp");
	        return "admin/index";
	    }
		
		//FAQ 교환/환불
		@RequestMapping("/admin/inquiry/faqChangeRefund")
		public String adminfaqChangeRefund(@RequestParam(value="page",required=false) String page,
											@RequestParam(value="faq_value",required=false) String value,
											Model model) {
			System.out.println("Dispatch : admin/inquiry/faqChangeRefund.jsp");
			if (page == null) {
				page = "1";
				}
				int page_number = Integer.parseInt(page);
				int page_size = 10;
				int page_start = (page_number - 1) * page_size + 1;
				int page_end = page_number * page_size;
				int block_size = 5;
				int block_group = (int)Math.ceil((double)page_number/block_size);
				int block_start = (block_group -1) * block_size +1;
				int block_end = block_group * block_size;
				int block_total =1;
			
			String faqCategory = "ChangeRefund";
			List<FaqDto> faq_list = null;
			if(StringUtils.hasText(value)) {
				faq_list=faqservice.faq_list_v(faqCategory,value,String.valueOf(page_start),String.valueOf(page_end));
			}else {
				faq_list=faqservice.faq_list(faqCategory,String.valueOf(page_start),String.valueOf(page_end));
			}
			model.addAttribute("value", value);
			model.addAttribute("nowpage", page_number);
			 model.addAttribute("block_total", block_total);
			model.addAttribute("block_start", block_start);
			model.addAttribute("block_end", block_end);
			model.addAttribute("faq_list", faq_list);
			model.addAttribute("mainPage", "inquiry/faqChangeRefund.jsp");
			
			return "admin/index";		//"admin/inquiry/faqChangeRefund.jsp" 디스패치
		} 
		
		//FAQ 질문 수정
		@RequestMapping("/admin/inquiry/faqEditPopup")
		public String adminfaqEditPopup(@RequestParam("faq_idx") String faq_idx,
										Model model) {
			System.out.println("Dispatch : admin/inquiry/faqEditPopup.jsp");
			FaqDto dto = faqservice.dto(faq_idx);
			model.addAttribute("dto", dto);
			model.addAttribute("faqEditPopup", "faqEditPopup.jsp");
			
			return "admin/inquiry/faqEditPopup";		//"admin/inquiry/faqEditPopup.jsp" 디스패치
		} 
		
		//FAQ EVENT
			@RequestMapping("/admin/inquiry/faqEvent")
			public String adminfaqEvent(@RequestParam(value="page",required=false) String page,
										@RequestParam(value="faq_value",required=false) String value,
										Model model) {
				System.out.println("Dispatch : admin/inquiry/faqEvent.jsp");
				if (page == null) {
					page = "1";
					}
					int page_number = Integer.parseInt(page);
					int page_size = 10;
					int page_start = (page_number - 1) * page_size + 1;
					int page_end = page_number * page_size;
					int block_size = 5;
					int block_group = (int)Math.ceil((double)page_number/block_size);
					int block_start = (block_group -1) * block_size +1;
					int block_end = block_group * block_size;
					int block_total =1;
				
				String faqCategory = "Event";
				List<FaqDto> faq_list = null;
				if(StringUtils.hasText(value)) {
					faq_list=faqservice.faq_list_v(faqCategory,value,String.valueOf(page_start),String.valueOf(page_end));
				}else {
					faq_list=faqservice.faq_list(faqCategory,String.valueOf(page_start),String.valueOf(page_end));
				}
				model.addAttribute("value", value);
				model.addAttribute("nowpage", page_number);
				 model.addAttribute("block_total", block_total);
				model.addAttribute("block_start", block_start);
				model.addAttribute("block_end", block_end);
				model.addAttribute("faq_list", faq_list);
				model.addAttribute("mainPage", "inquiry/faqEvent.jsp");
				
				return "admin/index";		//"admin/inquiry/faqEventp.jsp" 디스패치
			} 
			//FAQ 주문/배송
			@RequestMapping("/admin/inquiry/faqOrderShip")
			public String adminfaqOrderShip(@RequestParam(value="page",required=false) String page,
											@RequestParam(value="faq_value",required=false) String value,
											Model model) {
				System.out.println("Dispatch : admin/inquiry/faqOrderShip.jsp");	
				if (page == null) {
					page = "1";
					}
					int page_number = Integer.parseInt(page);
					int page_size = 10;
					int page_start = (page_number - 1) * page_size + 1;
					int page_end = page_number * page_size;
					int block_size = 5;
					int block_group = (int)Math.ceil((double)page_number/block_size);
					int block_start = (block_group -1) * block_size +1;
					int block_end = block_group * block_size;
					int block_total =1;
				
				String faqCategory = "OrderShip";
				List<FaqDto> faq_list = null;
				if(StringUtils.hasText(value)) {
					faq_list=faqservice.faq_list_v(faqCategory,value,String.valueOf(page_start),String.valueOf(page_end));
				}else {
					faq_list=faqservice.faq_list(faqCategory,String.valueOf(page_start),String.valueOf(page_end));
				}
				model.addAttribute("value", value);
				model.addAttribute("nowpage", page_number);
				 model.addAttribute("block_total", block_total);
				model.addAttribute("block_start", block_start);
				model.addAttribute("block_end", block_end);
				model.addAttribute("faq_list", faq_list);
				model.addAttribute("mainPage", "inquiry/faqOrderShip.jsp");
				
				return "admin/index";		//"admin/inquiry/faqOrderShip.jsp" 디스패치
			} 
			
			//FAQ 제품
			@RequestMapping("/admin/inquiry/faqProduct")
			public String adminfaqProduct(@RequestParam(value="page",required=false) String page,
										@RequestParam(value="faq_value",required=false) String value,
										Model model) {
				System.out.println("Dispatch : admin/inquiry/faqProduct.jsp");	
				if (page == null) {
					page = "1";
					}
					int page_number = Integer.parseInt(page);
					int page_size = 10;
					int page_start = (page_number - 1) * page_size + 1;
					int page_end = page_number * page_size;
					int block_size = 5;
					int block_group = (int)Math.ceil((double)page_number/block_size);
					int block_start = (block_group -1) * block_size +1;
					int block_end = block_group * block_size;
					int block_total =1;
				
				String faqCategory = "Product";
				List<FaqDto> faq_list = null;
				if(StringUtils.hasText(value)) {
					faq_list=faqservice.faq_list_v(faqCategory,value,String.valueOf(page_start),String.valueOf(page_end));
				}else {
					faq_list=faqservice.faq_list(faqCategory,String.valueOf(page_start),String.valueOf(page_end));
				}
				model.addAttribute("value", value);
				model.addAttribute("nowpage", page_number);
				 model.addAttribute("block_total", block_total);
				model.addAttribute("block_start", block_start);
				model.addAttribute("block_end", block_end);
				model.addAttribute("faq_list", faq_list);
				model.addAttribute("mainPage", "inquiry/faqProduct.jsp");
	
				return "admin/index";		//"admin/inquiry/faqProduct.jsp" 디스패치
			} 
			
			//FAQ 질문/답변 등록
			@RequestMapping("/admin/inquiry/faqWritePopup")
			public String adminfaqWritePopup(Model model) {
				System.out.println("Dispatch : admin/inquiry/faqWritePopup.jsp");
				
				model.addAttribute("faqWritePopup", "inquiry/faqWritePopup.jsp");
				
				return "admin/inquiry/faqWritePopup";		//"admin/inquiry/faqWritePopup.jsp" 디스패치
			} 
			
			@RequestMapping("/admin/inquiry/writeAction")
			@ResponseBody
			public String writeAction(@RequestParam("faq_select") String select,
										@RequestParam("minititle") String title,
										@RequestParam("editor4") String content,
										Model model) {
				//관리자 아이디 맴버 인덱스 섹션값 추가
				int member_idx = 1;
				int result = faqservice.faq_write(select,title,content,String.valueOf(member_idx));
				if(result == 1) {
					return "<script>alert('faq가 등록되었습니다');window.close();</script>";
				}else {
					return "<script>alert('faq가  등록실패되었습니다');history.back(-1);</script>";
				}
				
			} 
			
			@RequestMapping("/admin/inquiry/updateAction")
			@ResponseBody
			public String updateAction(@RequestParam("faq_idx") String faq_idx,
										@RequestParam("faq_select") String select,
										@RequestParam("minititle") String title,
										@RequestParam("editor4") String content,
										Model model) {
				//관리자 아이디 맴버 인덱스 섹션값 추가
				int member_idx = 1;
				int result = faqservice.faq_update(select,title,content,String.valueOf(member_idx),faq_idx);
				if(result == 1) {
					return "<script>alert('faq가 수정되었습니다');window.close();</script>";
				}else {
					return "<script>alert('faq가  수정실패되었습니다');history.back(-1);</script>";
				}
				
			} 
			
			@RequestMapping("/admin/inquiry/faq_delete")
			@ResponseBody
			public String faq_delete(@RequestParam("faq_idx") String faq_idx,
										Model model) {
				FaqDto dto = faqservice.dto(faq_idx);
				String faq_category = dto.getFaq_category();
				int result = faqservice.faq_delete(faq_idx);
				if(result == 1) {
					return "<script>alert('faq가 삭제되었습니다');window.location.href='/admin/inquiry/faq"+faq_category+"';</script>";
				}else {
					return "<script>alert('faq가 삭제실패되었습니다');history.back(-1);</script>";
				}
				
			} 
			@RequestMapping("/admin/product/product_list")
			public String productList( @RequestParam(value="page",required=false) String page,
										@RequestParam(value="value",required=false) String value,
										@RequestParam(value="category",required=false) String category,
										@RequestParam(value="display_status",required=false) String display_status,
										Model model) {
				if (page == null) {
					page = "1";
					}
					int page_number = Integer.parseInt(page);
					int page_size = 10;
					int page_start = (page_number - 1) * page_size + 1;
					int page_end = page_number * page_size;
					int block_size = 5;
					int block_group = (int)Math.ceil((double)page_number/block_size);
					int block_start = (block_group -1) * block_size +1;
					int block_end = block_group * block_size;
					int block_total =0;
					int count = 0;
					int total_count = productservice.count();
				List<ProductDto> productList = null;
				if(StringUtils.hasText(value) && !StringUtils.hasText(category) && !StringUtils.hasText(display_status)) {
					System.out.println("검색");
					productList = productservice.productList_v(value,String.valueOf(page_start),String.valueOf(page_end));
					count = productservice.count_v(value);
					block_total = (int)Math.ceil((double)count/page_size);
				}
				else if(!StringUtils.hasText(value) && StringUtils.hasText(category) && !StringUtils.hasText(display_status)) {
					System.out.println("상세(카테고리)검색");
					productList = productservice.productList_c(category,String.valueOf(page_start),String.valueOf(page_end));
					count=productservice.count_c(category);
					block_total = (int)Math.ceil((double)count/page_size);
				}
				else if(!StringUtils.hasText(value) && !StringUtils.hasText(category) && StringUtils.hasText(display_status)) {
					System.out.println("상세(디피)검색");
					productList = productservice.productList_d(display_status,String.valueOf(page_start),String.valueOf(page_end));
					count = productservice.count_d(display_status);
					block_total = (int)Math.ceil((double)count/page_size);
				}
				else if(!StringUtils.hasText(value) && StringUtils.hasText(category) && StringUtils.hasText(display_status)) {
					System.out.println("상세(둘다)검색");
					productList = productservice.productList_b(category,display_status,String.valueOf(page_start),String.valueOf(page_end));
					count = productservice.count_b(category,display_status);
					block_total = (int)Math.ceil((double)count/page_size);
				}
				else {
					System.out.println("상세(전체)검색");
					productList = productservice.productList(String.valueOf(page_start),String.valueOf(page_end));
					count = productservice.count();
					block_total = (int)Math.ceil((double)count/page_size);
				}
				if(block_end >= block_total) {
					block_end = block_total;
				}
				model.addAttribute("total_count", total_count);
				model.addAttribute("count", count);
				model.addAttribute("value", value);
				model.addAttribute("nowpage", page_number);
				 model.addAttribute("block_total", block_total);
				model.addAttribute("block_start", block_start);
				model.addAttribute("block_end", block_end);
				model.addAttribute("mainPage", "product/product_list2.jsp");
				model.addAttribute("list",productList);
				return "admin/index";
			}
			@RequestMapping("/admin/product/product_detail")
			public String product_detail(@RequestParam("product_idx") String product_idx,
											Model model) {
				ProductDto dto = productservice.dto(product_idx);
				model.addAttribute("dto", dto);
				model.addAttribute("mainPage", "product/product_detail.jsp");
				return "admin/index";
			}
			@RequestMapping("/admin/product/product_add")
			public String productAdd(Model model) {
				model.addAttribute("mainPage", "product/product_add.jsp");
				return "admin/index";
			}
			@RequestMapping("/admin/product/productAdd")
			@ResponseBody
			public String productAdd1(@RequestParam("product_category") String product_category,
										@RequestParam("product_name") String product_name,
										@RequestParam("product_comment") String product_comment,
										@RequestParam("product_price") String product_price,
										@RequestParam("product_volume") String product_volume,
										@RequestParam("product_stock") String product_stock,
										@RequestParam("product_shipping_fee") String product_shipping_fee,
										@RequestParam(value = "product_fliename", required = false) MultipartFile product_fliename,
										@RequestParam(value = "product_fliename_detail", required = false) MultipartFile product_fliename_detail,
										@RequestParam("product_content") String product_content,
										Model model) {
				String filename = fileuploadservice.restore(product_fliename);
				String filename_detail = fileuploadservice.restore(product_fliename_detail);
				int result = productservice.productAdd(product_category,product_name,product_comment,product_price,product_volume,
						product_stock,product_shipping_fee,filename,filename_detail,product_content);
				if(result == 1) {
					return "<script>alert('상품이 등록되었습니다');window.location.href='/admin/product/product_list';</script>";
				}else {
					return "<script>alert('상품이 등록실패되었습니다');history.back(-1);</script>";
				}
			}
			// 선택한 상품 진열로 변경
			@RequestMapping("/admin/product/updateDisplay")
			@ResponseBody
			public String updateDisplay(HttpServletRequest request) {
				//Array chk = request.getParameter("checkvalues");
				String chk = request.getParameter("checkvalues");
//				System.out.println(request.getParameter("checkvalues"));
				String[] chkList = chk.split(",");
				
				int result = 0;
				for(String check : chkList) {
					result = productDao.updateDisplay(check);
				}
				if(result == 1) {
					return "<script>alert('상품이 수정되었습니다');window.location.href='/admin/product/product_list';</script>";
				}else {
					return "<script>alert('상품이 수정실패되었습니다');history.back(-1);</script>";
				}
			}
			
			// 선택한 상품 숨김으로 변경
			@RequestMapping("/admin/product/updateHidden")
			@ResponseBody
			public String updateHidden(HttpServletRequest request) {
				String chk = request.getParameter("checkvalues");
				String[] chkList = chk.split(",");
				
				int result = 0;
				for(String check : chkList) {
					result = productDao.updateHidden(check);
				}
				if(result == 1) {
					return "<script>alert('상품이 수정되었습니다');window.location.href='/admin/product/product_list';</script>";
				}else {
					return "<script>alert('상품이 수정실패되었습니다');history.back(-1);</script>";
				}
			}
			// 선택한 상품 품절로 변경
			@RequestMapping("/admin/product/updateSoldOut")
			@ResponseBody
			public String updateSoldOut(HttpServletRequest request) {
				String chk = request.getParameter("checkvalues");
				String[] chkList = chk.split(",");
				
				int result = 0;
				for(String check : chkList) {
					result = productDao.updateSoldOut(check);
				}
				if(result == 1) {
					return "<script>alert('상품이 수정되었습니다');window.location.href='/admin/product/product_list';</script>";
				}else {
					return "<script>alert('상품이 수정실패되었습니다');history.back(-1);</script>";
				}
			
		
			}
}

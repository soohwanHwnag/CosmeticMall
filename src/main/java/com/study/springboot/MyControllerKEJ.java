package com.study.springboot;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MyControllerKEJ {

	//@Autowired : 객체를 자동생성해줌. new+싱글톤
	//@Autowired
	//private MemberService memberService;
	
	//URI : http://localhost:8090
	//@RequestMapping("/")		HSH 제외 닫음(겹치면 오류)
	public String root() {
		System.out.println("sendRedirect : main");
		return "redirect:main";		//sendRedirect
	}

	//URI : http://localhost:8090/main
	//@RequestMapping("/main")	HSH 제외 닫음(겹치면 오류)
	public String main(Model model) {
		System.out.println("Dispatch : index.jsp");
		
		model.addAttribute("mainPage", "main.jsp");
		
		return "index";				//"index.jsp" 디스패치
	}
	
	//URI : http://localhost:8090/admin/main
	//@RequestMapping("/admin/main")	HSH 제외 닫음(겹치면 오류)
	public String adminMain(Model model) {
		System.out.println("Dispatch : admin/index.jsp");
		
		model.addAttribute("mainPage", "main.jsp");
		
		return "admin/index";		//"admin/index.jsp" 디스패치
	}
	
}//MyController
package com.kh.action.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class CustomActionController {

	// JSTL 공부 페이지로 이동하는 요청 메소드
	@GetMapping("custom/jstl")
	public String jstl() {
		
		return "3_CustomAction/jstl";
		// > "/WEB-INF/views/3_CustomAction/jstl.jsp"
	}
	
	// core library 공부 페이지로 이동하는 요청 메소드
	@GetMapping("custom/jstl/core")
	public String coreLibrary() {
		
		return "3_CustomAction/01_core";
		// > "/WEB-INF/views/3_CustomAction/01_core.jsp"
	}
	
	// formatting library 공부 페이지로 이동하는 요청 메소드
	@GetMapping("custom/jstl/formatting")
	public ModelAndView formattingLibrary(ModelAndView mv) {
		
		mv.setViewName("3_CustomAction/02_formatting");
		// > "/WEB-INF/views/3_CustomAction/02_formatting.jsp"
		
		return mv;
	}
	
	// functions library 공부 페이지로 이동하는 요청 메소드
	@GetMapping("custom/jstl/functions")
	public ModelAndView functionsLibrary(ModelAndView mv) {
		
		mv.setViewName("3_CustomAction/03_functions");
		// > "/WEB-INF/views/3_CustomAction/03_functions.jsp"
		
		return mv;
	}
	
}








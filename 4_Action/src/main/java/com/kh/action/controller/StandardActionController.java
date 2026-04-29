package com.kh.action.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class StandardActionController {

	// include 태그를 공부할 수 있는 페이지 요청 메소드
	@GetMapping("standard/include")
	public ModelAndView include(ModelAndView mv) {
		
		mv.setViewName("2_StandardAction/01_include");
		// > "/WEB-INF/views/2_StandardAction/01_include.jsp"
		
		return mv;
	}
	
	// forward 태그를 공부할 수 있는 페이지 요청 메소드
	@GetMapping("standard/forward")
	public ModelAndView forward(ModelAndView mv) {
		
		mv.setViewName("2_StandardAction/02_forward");
		// > "/WEB-INF/views/2_StandardAction/02_forward.jsp"
		
		return mv;
	}
	
}





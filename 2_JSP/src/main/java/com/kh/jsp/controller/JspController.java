package com.kh.jsp.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class JspController {
	
	// scripting 으로 GET 방식으로 요청 시 이 메소드가 호출됨!!
	// > a 태그를 클릭했을 때에도 Controller 의 어떤 메소드가 호출되는 것임!!
	//   (단, a 태그를 이용할 경우에는 무조건 GET 방식임)
	@RequestMapping(value="scripting", method=RequestMethod.GET)
	public String scriptingElement() {
		
		// System.out.println("잘 호출되나?");
		
		return "01_ScriptingElement";
	}
	
	@RequestMapping(value="directive/page", method=RequestMethod.GET)
	public String directivePage() {
		
		// 우리는 page 지시어를 공부할 jsp 화면만 딱 띄워주고 말 것!!
		
		return "02_DirectivePage";
	}
	
	@RequestMapping(value="directive/include", method=RequestMethod.GET)
	public String directiveInclude() {
		
		// 우리는 include 지시어를 공부할 jsp 화면만 딱 띄워주고 말 것!!
		
		return "03_DirectiveInclude";
	}

}





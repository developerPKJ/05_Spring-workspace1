package com.kh.spring.controller;

//import java.util.Arrays;

import org.springframework.stereotype.Controller;
//import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
//import org.springframework.web.bind.annotation.RequestMapping;
//import org.springframework.web.bind.annotation.RequestMethod;
//import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.kh.spring.model.vo.Member;

//import jakarta.servlet.http.HttpServletRequest;

@Controller
public class SpringController {
	/*
	 * 각 요청마다 처리해주는 코드를 메소드 단위로 작성
	 * - Spring이 없을 때는 요청마다 처리해주는 코드를 클래스 단위로 작성했음
	 * (요청 받아주는 자바 클래스 : 서블릿(Servlet))
	 * - 주의 사항 : 한 웹프로젝트 내부에서 요청의 url 주소가 겹치면 안됨
	 * */
	
//	일반 메소드로 요청 처리 구문을 작성하되,
//	해당 요청이 어느 방식으로 들어왔을 경우 해당 메소들르 호출할지
	
//	1. @RequestMapping 어노테이션을 이용해서 매핑해줘야 함
//	: handler mapping (핸들러 매핑) : 요청과 메소드 연결해주는 작업
	
//	member/insert 요청이 POST 방식으로 들어왔을 때 처리해주는 메소드
	/*
	@RequestMapping(value="member/insert", method=RequestMethod.POST)
	public void insertMember() {
		System.out.println("회원가입 요청이 들어왔습니다.");
	}
	*/
	
//	@PostMapping(value="member/insert") // value 속성은 value만 사용할 경우 생략 가능
	/*
	@PostMapping("member/insert")
	public void insertMember() {
		System.out.println("회원가입 요청이 들어왔습니다.");
	}
	*/
//	RequestMapping이나 PostMapping이나 상관 없음
//	PostMapping은이 더 간결해서 자주 쓰임
//	Get의 경우 GetMapping 이 있음
	
	
//	2. 스프링에서 요청 시 전달값을 뽑는 방법
	/*
	 * 1) HttpServletRequest 객체로부터 직접 데이터를 얻는 방법(지금까지 한 방법)
	 * - 요청을 받아주는 Controller 메소드의 매개변수로 HttpServletRequest request 작성
	 * > 요청 때마다 알아서 요청 시 전달값들이 request 객체 parameter 영역에 담겨서 넘어옴
	 * > key + value 형태로 담겨서 넘어옴
	 * > request.getParameter("키값") : String (밸류값)
	 * > request.getParameterValues("키값") : String[] (밸류값들)
	 * */
	/*
	@PostMapping("member/insert")
	public void insertMember(HttpServletRequest request) {
		System.out.println(request.getParameter("userId"));
		System.out.println(request.getParameter("userPwd"));
		System.out.println(request.getParameter("userName"));
		System.out.println(request.getParameter("email"));
		System.out.println(request.getParameter("gender"));
		System.out.println(Arrays.toString(request.getParameterValues("hobby")));
	}
	*/
	
	/*
	 * 2) @RequestParam 어노테이션을 이용해서 전달값을 얻는 방법
	 * 요청을 받아서 처리해주는 Controller 메소드에 요청 시 전달값을 받아줄 매개변수를 정의하고
	 * 각 매개변수마다 @RequestParam 어노테이션을 작성해서 요청 시 전달값이 매개변수에 담겨서 넘어오도록 하는 방법
	 * 
	 * defaultValue 속성 : 요청 시 전달값이 없을 때(null) 대신 사용할 값을 지정하는 속성
	 * required 속성 : 요청 시 전달값이 반드시 있어야 하는지 여부를 지정하는 속성(false면 null 허용)
	 * */
	/*
	@PostMapping("member/insert")
	public void insertMember(@RequestParam("userId") String param1,
							@RequestParam("userPwd") String param2,
							@RequestParam(value="userName") String param3, 
							@RequestParam(value="email") String param4,
							@RequestParam(value="gender", defaultValue="X") String param5,
							@RequestParam(value="hobby", required=false) String[] param6) {
		System.out.println(param1);
		System.out.println(param2);
		System.out.println(param3);
		System.out.println(param4);
		System.out.println(param5);
		System.out.println(Arrays.toString(param6));
	}
	*/
//	@RequestParam 어노테이션이 request.getParameter/request.getParameterValues("키") 메소드를 대신해줌
	
	
	/*
	 * 3) @RequestParam 어노테이션 생략하는 방법
	 * - 요청을 처리해주는 Controller 메소드에 전달값을 받아줄 매개변수를 정의하고
	 * 	매개변수마다 @RequestParam 어노테이션을 생략하되,
	 * 	매개변수의 이름을 jsp의 name 속성값(키값)과 동일하게 맞춰주는 방법
	 * 
	 * - 칸을 비우면 null 넘어오는 것도 동일
	 * 	하지만 defaultValue 속성은 @RequestParam 어노테이션이 생략되면 사용할 수 없음
	 * */
	/*
	@PostMapping("member/insert")
	public void insertMember(String userId,
							String userPwd,
							String userName, 
							String email,
							String gender,
							String[] hobby) {
		System.out.println(userId);
		System.out.println(userPwd);
		System.out.println(userName);
		System.out.println(email);
		System.out.println(gender);
		System.out.println(Arrays.toString(hobby));
		
//		요청 시 전달값들을 하나의 VO로 가공하기
//		userId~hobby까지의 전달값들을 하나의 Member 객체(VO 클래스)로 가공하기
		
		Member m = new Member(userId, userPwd, userName, email, gender, hobby);
		
		System.out.println(m);
	}
	*/
//	점점 짧아짐 개꿀
	
	/*
	 * 4) 커맨드 객체 방식
	 * - 요청 시 전달된 값들의 키값을 VO 클래스의 필드명과 동일하게 작성하고,
	 * 요청시 실행할 COntroller 메소드의 매개변수로 해당 VO 타입을 제시하는 방법
	 * - 내부적으로 request.getParameter~~ 메소드들을 알아서 실행해 전달값을 뽑고,
	 * 기본 생성자로 객체를 생성한 뒤, 대응되는 필드로 setter 메소드를 이용해서 VO 객체에 담아서 넘어오게 됨
	 * (setter 주입)
	 * */
	/*
	@PostMapping("member/insert")
	public void insertMember(Member m) {
		System.out.println(m);
	}
	*/
	/*
	 * 사용자의 요청이 들어올 때 마다 내부적으로 어딘가에서
	 * SpringController springController = new SpringController();
	 * springController.insertMember(??);
	 * */
	
//	3. 스프링에서 응답화면(JSP)을 보여주는 방법
	/*
	 * 1) 응답페이지의 경로를 문자열로 리턴하는 방법
	 * -응답하고자 하는 .jsp 파일을 만들고 request의 attribute 영역에 응답페이지에
	 * 필요로 하는 데이터들을 키 + 벨류 형식으로 모두 담은 뒤
	 * 응답페이지(해당 jsp파일)의 경로를 문자열로 리턴하는 방법
	 * - view resolver로 인해 자동완성되는 부분을 주의할것
	 * 
	 * - 응답 데이터는 HttpServletRequest 객체에 담을 수 있지만
	 * 보통 스프링에서는 Model 객체에 키 + 벨류 세트로 응답데이터를 담아둠
	 * (HttpServletRequest == Model, Model로 명시적으로 쓰는 것을 권장)
	 * - Model 객체를 쓰고싶으면, 해당 Controller 메소드의 매개변수로 Model 매개변수를 추가하면 됨
	 * 
	 * */
	/*
	@PostMapping("member/insert")
	public String insertMember(Member m, Model model) {
		
//		request.setAttribute("resultMsg", "회원가입에 성공했습니다.");
		// HttpServletRequest

		model.addAttribute("resultMsg", "회원가입에 성공했습니다.");
		// Model
		
		return "responsePage";
//		DB로부터 요청 처리를 다 완료했다 라는 가정 하에
//		응답 화면의 틀을 잡아주고, 그 응답화면에서 필요로 하는 데이터를 세팅하고
//		문자열로 응답페이지의 경로를 제시하는게 기존의 방법
	}
	*/
	
	/*
	 * 2) 응답페이지와 응답페이지에서 필요로 하는 데이터를 한번에 ModelAndView 객체로 리턴하는 방법
	 * - Model 객체 : 응답데이터를 담는 객체(request 개체)
	 * - View 객체 : 응답페이지를 담는 객체
	 * 
	 * - ModelAndView 객체 : Model + View 객체를 담는 객체
	 * 
	 * - mv.addObject("키", "벨류") : Model 객체에 응답데이터 담는 메소드(Object 타입임)
	 * - mv.setViewName("응답페이지 경로") : View 객체에 응답페이지 담는 메소드
	 * > 단 자동완성 감안해서 작성 할 것
	 * */
	@PostMapping("member/insert")
	public ModelAndView insertMember(Member m, ModelAndView mv) {
		mv.addObject("resultMsg", "회원가입에 성공했습니다.");
		mv.setViewName("responsePage");
		
		return mv;
	}
	
	/*
	 * 요청을 처리하는 controller 메소드가 종료될 때마다
	 * 문자열이든 ModelAndView 객체든 리턴 구문을 통해 응답페이지 정보를 넘겨주고 있음
	 * return 되는 값은 나를 호출했던 시작지점으로 돌아감
	 * 결과적으로 Controller 호출이 일어났던 곳으로 관련된 정보들이 넘어감
	 * (내부적으로 그 응답과 관련된 정보들을 받아서 알맞은 jsp 화면을 띄워줌)
	 * 
	 * 최종구조
	 * 요청(request) -> DispatcherServlet -> HandlerMapping -> Controller 메소드 
	 * -> 응답페이지 정보 리턴 -> DispatcherServlet -> ViewResolver -> 응답페이지(.jsp)
	 * 
	 * DispatcherServlet
	 * : Spring에서 요청이 들어올 때 마다 HandlerMapping을에 의해
	 * 어떤 Controller의 어떤 메소드를 호출할지 결정해주는 역할을 하는 자바 클래스(객체)
	 * - 반대로 Controller에서 리턴해주는 응답페이지 관련 정보들을 돌려받아서
	 * 앞뒤로 prefix, suffix 붙여서 최종적으로 적합한 응답페이지(.jsp)를 찾아 보여주는 역할까지 수행
	 * */
}

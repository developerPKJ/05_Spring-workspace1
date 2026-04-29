package com.kh.action.controller;

import java.util.ArrayList;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import com.kh.action.model.vo.Person;

import jakarta.servlet.ServletContext;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

@Controller
public class ELController {
	
	// EL 기본 구문 연습용 메소드
	@GetMapping("el")
	public String el(HttpServletRequest request, HttpSession session) {
		
		// EL 은 응답데이터를 화면에 간략히 띄워주는 역할의 문법이기 때문에
		// 연습용 응답데이터를 셋팅해볼 것!!
		
		/*
		 * * 기존에는 응답 데이터들을 HttpServletRequest (Model) 객체에 키 + 밸류 형식으로 담았었음!!
		 * - request 말고 다른 객체에도 응답데이터를 담아줄 수 있다!!
		 * 
		 * * 응답 데이터들을 담을 수 있는 Servlet Scope (영역) 내장객체 4종류
		 * 
		 * 1. ServletContext (applicationScope)
		 * - 한 웹 애플리케이션 당 단 1개 존재하는 객체
		 * - 이 영역에 응답데이터를 담으면 이 웹 애플리케이션 전역에서 다 꺼내서 사용 가능!!
		 * - 응답데이터의 공유 범위가 가장 크다.
		 * 
		 * 2. HttpSession (sessionScope)
		 * - 한 브라우저 당 1개 존재하는 객체
		 * - 이 영역에 응답데이터를 담으면 이 웹 애플리케이션 전역에서 다 꺼내서 사용 가능!!
		 * - 단, 값이 한번 담기면 서버가 멈추거나, 브라우저가 닫힐 경우 값이 사라짐!!
		 * - 공유 범위가 다소 제한적이다.
		 * 
		 * 3. HttpServletRequest (requestScope)
		 * - 요청 시 (GET 또는 POST) 마다 하나씩 생성되는 객체
		 * - 스프링에서 요청 시 DispatcherServlet 이 호출 될 시점에 같이 생성되는 객체임
		 * - 이 영역에 응답데이터를 담으면 해당 Request 객체에 의한 응답 JSP 페이지에서만 꺼내서 사용 가능!!
		 *   (즉, 요청 1회 당 1번만 사용 가능)
		 * - 공유 범위가 해당 요청에 대한 해당 응답 JSP 한 세트 뿐!!
		 *   (그 응답 JSP 페이지에서 다른 JSP 페이지로 넘어가는 순간 못쓰게됨)
		 * 
		 * 4. PageContext (pageScope)
		 * - 하나의 JSP 페이지 내에서만 지역 변수처럼 사용 가능
		 * - 공유 범위가 가장 작다.
		 * 
		 * => 주로 웹 개발에서는 request 객체를 제일 많이 사용한다.
		 *    그 다음으로 많이 이용하는게 session 객체임!!
		 *    
		 * * 위의 객체들에 값을 담을 때에는 xxx.setAttribute("키", 밸류);
		 * 			   값을 꺼내올 때에는 xxx.getAttribute("키") : Object (밸류)
		 * 			   값을 지우고자 할 경우에는 xxx.removeAttribute("키");
		 */
		
		// requestScope 에 담기
		request.setAttribute("classRoom", "H 강의장");
		request.setAttribute("student", new Person("홍길동", 22, "남자"));
		// > 이따 응답페이지에서 request.getAttribute 를 통해 데이터를 뽑아낼 수 있음
		//   model.addAttribute 도 똑같은 역할임!!
		
		// sessionScope 에 담기
		// > session 객체를 이용하려면 우선 request 객체로부터 얻어내야함!!
		// HttpSession session = request.getSession();
		// > Spring 에서는 매개변수로 그냥 session 을 정의하면 알아서 전달해준다!!
		
		session.setAttribute("academy", "KH 정보교육원");
		session.setAttribute("teacher", new Person("김가현", 20, "여자"));
		// > 이따 응답페이지에서 session.getAttribute 를 통해 데이터를 뽑아낼 수 있음
		
		// -----------------------------
		
		// 특이케이스)
		// 각 내장 객체에 동일한 키값으로 데이터 담아보기
		request.setAttribute("scope", "request");
		session.setAttribute("scope", "session");
		
		// applicationScope 에 값 담기
		// > 우선 application 객체를 얻어내야함
		//   (request 또는 session 으로부터 얻어낼 수 있음)
		// ServletContext application = request.getServletContext();
		ServletContext application = session.getServletContext();
		
		application.setAttribute("scope", "application");
		
		// EL 기본 구문 연습용 페이지를 띄워줄 것!!
		return "1_EL/01_el";
		// > "/WEB-INF/views/1_EL/01_el.jsp"
	}
	
	// EL 연산자 연습용 메소드
	@GetMapping("el/operation")
	public String elOperation(HttpServletRequest request) {
		
		// EL 연산자 연습용 응답데이터 넘겨보기!!
		request.setAttribute("big", 10);
		request.setAttribute("small", 3);
		
		request.setAttribute("sOne", "안녕"); // 상수풀 영역에 들어감
		request.setAttribute("sTwo", new String("안녕"));
		
		request.setAttribute("pOne", new Person("홍길동", 20, "남자"));
		request.setAttribute("pTwo", null);
		
		ArrayList<String> list1 = new ArrayList<>(); // 텅 빈 리스트
		request.setAttribute("lOne", list1);
		
		ArrayList<String> list2 = new ArrayList<>();
		list2.add("ㅋㅋㅋ"); // [0]
		list2.add("ㅎ.."); // [1]
		request.setAttribute("lTwo", list2);
		
		// EL 연산자 연습용 페이지를 띄워줄 것!!
		return "1_EL/02_elOperation";
		// > "/WEB-INF/views/1_EL/02_elOperation.jsp"
	}
	
	

}







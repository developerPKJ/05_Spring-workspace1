package com.kh.jsp.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import jakarta.servlet.http.HttpServletRequest;

// 컨트롤러 역할을 하는 클래스는 한 프로젝트 내에 여러개를 만들어서 써도 된다!!
@Controller
public class PizzaController {

	// 피자 주문페이지를 보여주는 요청
	@RequestMapping(value="pizza/orderForm", method=RequestMethod.GET)
	public String pizzaOrderForm() {
		
		// 피자 주문페이지만 보여주고 끝
		
		return "04_PizzaOrderForm";
	}
	
	// 피자 주문 요청
	@RequestMapping(value="pizza/order", method=RequestMethod.GET)
	public String pizzaOrder(HttpServletRequest request) {
		
		// 1) 피자 주문 시 입력한 데이터들을 뽑아 낼 것!! (request 의 parameter 영역으로부터)
		
		// request.getParameter("키값") : String (밸류값)
		// request.getParameterValues("키값") : String[] (밸류값들) -> checkbox 일 경우
		
		// - userName : 주문자이름
		String userName = request.getParameter("userName"); // "홍길동"
		
		// - phone : 주문자전화번호
		String phone = request.getParameter("phone"); // "01011112222"
		
		// - address : 배송지
		String address = request.getParameter("address"); // "서울시 강남구"
		
		// - message : 요청사항
		String message = request.getParameter("message"); // "일회용품은 빼주세요" / ""
		
		// - pizza : 피자종류
		String pizza = request.getParameter("pizza"); // "콤비네이션피자" ~ "불고기피자" 중 1
		
		// - topping : 토핑종류 (여러개)
		String[] toppings = request.getParameterValues("topping"); // ["", "", ...] / null
		
		// - side : 사이드메뉴종류 (여러개)
		String[] sides = request.getParameterValues("side"); // ["", "", ...] / null
		
		// - payment : 결제방식
		String payment = request.getParameter("payment"); // "cash" / "card"
		
		// 보통의 흐름이라면 DB 까지 가서 이 주문내역을 Insert 하고 와야함!!
		// 2) 가격을 책정하는 로직으로 간단히 대체해보기
		int price = 0;
		
		switch(pizza) {
		case "콤비네이션피자" : price += 5000; break;
		case "치즈피자" : price += 6000; break;
		case "포테이토피자" : 
		case "고구마피자" : price += 7000; break;
		case "불고기피자" : price += 8000; break;
		}
		
		if(toppings != null) {
			
			for(int i = 0; i < toppings.length; i++) {
				
				switch(toppings[i]) {
				case "고구마무스" : 
				case "콘크림무스" : price += 1500; break;
				case "파인애플토핑" : 
				case "치즈바이트" : price += 2000; break;
				case "치즈크러스트" : 
				case "치즈토핑" : price += 3000; break;
				}
			}
		}
		
		if(sides != null) {
			
			for(int i = 0; i < sides.length; i++) {
				
				switch(sides[i]) {
				case "콜라" : 
				case "사이다" : price += 2000; break;
				case "갈릭소스" : 
				case "핫소스" : price += 300; break;
				case "피클" : 
				case "파마산치즈가루" : price += 500; break;
				}
			}
		}
		
		System.out.println(userName);
		System.out.println(phone);
		System.out.println(address);
		System.out.println(message);
		System.out.println(pizza);
		System.out.println((toppings == null) ? "없음" : String.join(", ", toppings));
		System.out.println((sides == null) ? "없음" : String.join(", ", sides));
		System.out.println(payment);
		System.out.println("최종 가격 : " + price + "원");
		
		// > 이 정보들을 가지고 최종 결제 전 결제 페이지로 출력시켜버릴 것!!
		//   응답페이지로 결제 페이지를 하나 만들거고, 위의 데이터를 응답데이터로 보내고
		//   최종적으로 알맞은 자리에 값들을 뽑아서 출력해줄 예정!!
		// 3) 결제 페이지로 이동시키기 (응답페이지로 이동시키기)
		request.setAttribute("userName", userName);
		request.setAttribute("phone", phone);
		request.setAttribute("address", address);
		request.setAttribute("message", message);
		request.setAttribute("pizza", pizza);
		request.setAttribute("toppings", toppings);
		request.setAttribute("sides", sides);
		request.setAttribute("payment", payment);
		request.setAttribute("price", price);
		
		return "05_PizzaPayment";
	}
	
}






<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	// 스크립틀릿의 위치는 아무데나 적어도 상관없지만
	// 가독성을 위해 html 상단에 적는 것을 권장
	
    // 4. 요청 파라미터 꺼내기
    // getAttribute()의 경우 Object 타입으로 반환하기 때문에 형변환이 필요함
    String userName = (String)request.getAttribute("userName");
    String phone = (String)request.getAttribute("phone");
    String address = (String)request.getAttribute("address");
    String message = (String)request.getAttribute("message");
    String pizza = (String)request.getAttribute("pizza");
    String[] toppings = (String[])request.getAttribute("toppings");
    String[] sides = (String[])request.getAttribute("sides");
    String payment = (String)request.getAttribute("payment");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>KH 피자</title>
</head>
<body>
	<h1>피자 결제 페이지</h1>
	
	<h2>주문 내역</h2>
	
	<h4>[ 주문자 정보 ]</h4>
	
	<ul>
        <li>성함 : <%=userName %>></li>
        <li>전화번호 : <%=phone %></li>
        <li>주소 : <%=address %></li>
        
        <% if (message == null) { %>
	        <!-- case1 -->
	        <li>요청사항 : 없음</li>
        <% } else { %>
	        <!-- case2 -->
	        <li>요청사항 : <%=message %></li>
	    <% } %>
    </ul>
    
    <br><br>
    
    <h4>[ 주문 정보 ]</h4>
    
    <ul>
    	<li>피자 : <%=pizza %></li>
    	
    	<% if (toppings) %>
    	<!-- case1 -->
        <li>토핑 : 없음</li>
        <!-- case2 -->
        <li>토핑 : xxxxx, xxxxx, xxxxx</li>
        <!-- case1 -->
        <li>사이드 : 없음</li>
        <!-- case2 -->
        <li>사이드 : xxxxx, xxxxx, xxxxx</li>
        <li>결제 방식 : xx</li>
    </ul>
    
    <br><br>
    
    <h3>위와 같이 주문하셨습니다.</h3>
    
    <h2>총 가격 : xxxx 원</h2>
</body>
</html>
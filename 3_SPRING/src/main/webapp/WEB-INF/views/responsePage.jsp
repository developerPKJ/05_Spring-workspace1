<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	// 출력할 데이터를 request의 attribute에서 꺼내오기
	String resultMsg = (String)request.getAttribute("resultMsg");
	// > Spring에서의 Model 객체는 HttpServletRequest 객체와 동일함
	// Model에 응답데이터를 담더라도 뽑을때는 HttpServletRequest 방식으로 꺼내오면 됨
	// ModelAndView 객체 또한 마찬가지로 Model이 포함된 객체이므로 동일하게 request에서 꺼내오면 됨
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<br><br>
	
	<h1 align="center"><%= resultMsg %></h1>
</body>
</html>
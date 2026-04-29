<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<h1>forward</h1>
	
	<p>
		- 브라우저 주소창에 보이는 url 주소는 그대로고
		  사용자의 눈에 보이는 화면만 바꿔치기 해주는 기술 (화면 포워딩)
	</p>
	
	<h2>여기는 02_forward.jsp 페이지야</h2>
	
	<!-- 
		- 이 페이지가 보여질 때의 url 주소
		http://localhost:8888/action/standard/forward
		
		- 실제 눈에 보이는 화면
		footer.jsp
	-->
	
	<%--
		RequestDispatcher dispatcher = request.getRequestDispatcher("footer.jsp");
		dispatcher.forward(request, response);
	--%>
	
	<jsp:forward page="footer.jsp" />

</body>
</html>






<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<h1>include</h1>

	<p>
		- JSP 페이지 내에서 또 다른 JSP 페이지를 포함시키고자 할 때 사용하는 방식 <br>
		- 2가지 방법이 있음
	</p>
	
	<h3>
		1. 기존의 include 지시어를 이용한 방식
		(정적 include 방식 - 컴파일 시점에서 include 가 되는 형태)
	</h3>
	
	<%-- 
	<%@ include file="footer.jsp" %>
	
	<br><br>
	
	특징 : include 하고 있는 페이지 상에 선언되어있는 자바 변수들 및 메소드들을
		  현재 이 페이지 내에서도 가져다 사용 가능함!! <br>
	include 한 페이지의 year 변수값 : <%= year %>  

	<br><br>
	
	단, 현재 이 페이지 내에서 동일한 이름의 변수를 선언할 수 없음!! <br>
	
	<%
		String year = "2026"; // Duplicate local variable year
	%>
	--%>
	
	<br><br>
	
	<hr>
	
	<h3>
		2. JSP 표준 액션 태그를 이용한 방식
		(동적 include 방식 - 런타임 시점에서 include 되는 형식)
	</h3>
	
	<!-- 
		- 반드시 태그명 앞에 jsp: 이라는 접두어가 붙어야함!!
		- 시작태그와 종료태그가 세트로 이루어져 있어야함!! (XML 기반이기 때문)
		- 단, 시작태그와 종료태그 사이에 딱히 적을 내용이 없다면 시작태그 끝에 / 를 붙여서 한번에 종결도 가능하다.
	-->
	
	<jsp:include page="footer.jsp" />
	
	<br><br>
	
	특징1. include 하고 있는 페이지에 선언된 자바 변수 등을 공유하지 않음
	(즉, 동일한 이름의 변수를 선언할 수 있음, 자바 변수와 메소드를 안가져오겠다) <br>
	
	<%-- 
	include 한 페이지의 year 변수값 : <%= year %> <!-- 오류 -->
	--%>
	
	<%
		String year = "2026";
	%>
	
	<br><br>
	
	특징2. include 시, include 하는 jsp 페이지로 추가적인 값을 전달할 수 있음 <br>
	
	<br>
	
	<jsp:include page="footer.jsp">
		<jsp:param name="test" value="Hello..!" />
	</jsp:include>
	
	<br>
	
	<jsp:include page="footer.jsp">
		<jsp:param name="test" value="Goodbye~~" />	
	</jsp:include>
	
	<br><br>
	
	마지막으로 위의 두 방식의 공통점이라고 한다면, style 을 가져온다라는것임!!
	
</body>
</html>







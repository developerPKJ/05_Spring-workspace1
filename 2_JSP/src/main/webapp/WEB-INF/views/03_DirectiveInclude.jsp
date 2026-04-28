<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<h1>include 지시어</h1>
	
	<!-- 
		- .jsp 파일 내부에 .jsp 파일을 삽입할 때 쓰는 명령문 (지시어)
		- 즉, 페이지 안에 페이지를 삽입할 때 주로 쓰임
		- 주로 메뉴바, 푸터를 단 한번만 .jsp 파일로 만들어둔 후,
		  모든 페이지마다 상단, 하단에 각각 include 할 때 많이들 쓰인다!!
	-->
	
	<h2>01_ScriptingElement.jsp 파일 include</h2>

	<%@ include file="01_ScriptingElement.jsp" %>

	포함한 .jsp 파일 상에 존재하는 변수를 가져다 쓸 수 있음!! <br><br>
	
	str 변수값 : <%= str %> <br>
	1부터 100까지의 총 합계 : <%= sum %> <br>
	test 메소드 호출 테스트 : <%= test() %> <br>
	
	<!-- 변수 뿐만 아니라 메소드까지 가져다 쓸 수 있게됨!! -->
	
	<br><br>
	
	<hr>
	
	<h2>오늘 날짜</h2>

	<%@ include file="datePrint.jsp" %>
	
	<!-- 자바 구문 뿐만 아니라 스타일 정보들까지 싹 다 가져온다!! -->

</body>
</html>






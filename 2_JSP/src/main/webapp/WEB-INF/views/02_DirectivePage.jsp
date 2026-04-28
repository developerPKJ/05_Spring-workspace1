<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" errorPage="errorPage.jsp" %>
<%@ page import="java.util.ArrayList, java.util.Date" %>
<%-- 
	page 지시어는 .jsp 파일 당 하나씩만 쓰는 것이 원칙이나,
	import 할 것들이 많아질수록 가독성이 떨어지므로 별도로 page 지시어를 하나 더 써서 
	import 속성만 쭉 적어두는 것을 권장한다!!
--%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<h1>page 지시어</h1>

	<!-- import, errorPage 속성 위주로 공부해보자 -->
	
	<!-- 1. import 속성 -->
	<%
		// import java.util.ArrayList;
		// import java.util.Date;
		// > 스크립틀릿 안쪽에서는 import 선언이 불가함!!
		//   그대신 page 지시어에 import 속성으로 기술함!!
	
		// ArrayList 사용
		ArrayList<String> list = new ArrayList<>();
		// > import 속성을 추가했더니 오류가 사라짐!!
		
		list.add("Java"); // [0]
		list.add("JSP"); // [1]
		
		// Date 사용
		Date today = new Date();
		// > 마찬가지로 import 속성을 추가했더니 오류가 사라짐!!
		//   import 할 클래스들이 여러개일 경우 import 속성 내부에 , 로 나열해서 작성한다.
	%>
	
	<p>
		- 리스트의 길이 : <%= list.size() %> <br>
		- 0번 인덱스의 값 : <%= list.get(0) %> <br>
		- 1번 인덱스의 값 : <%= list.get(1) %> <br>
		- 현재 날짜 및 시간 : <%= today %>
	</p>
	
	<!-- 2. errorPage 속성 -->
	
	<%= list.get(10) %>
	<!-- 리스트의 크기는 2칸짜리인데 10번 인덱스에 접근하려고 해서 오류 발생!! -->
	
	<!-- 
		errorPage 속성은 이 페이지에서 에러가 발생할 때 
		Whitelabel Error Page 대신 보여줄 에러페이지를 지정 
	-->
	
	<!-- 
		* 여태 봤었던 오류들
		
		1. 404 : Not Found (Controller 메소드, .jsp 파일, 이미지 파일 등이 없을 경우)
		2. 405 : 요청 방식 (method) 가 어긋날 때 발생하는 오류
		3. 500 : 자바 오류 발생 시 나타나는 에러 (즉, Exception 발생 시 나타남)
		
		* 오류는 아닌데
		4. 200 : 성공 (아무런 문제가 없을 경우) - 성공이니 숫자가 표시되지는 않음
	-->

</body>
</html>





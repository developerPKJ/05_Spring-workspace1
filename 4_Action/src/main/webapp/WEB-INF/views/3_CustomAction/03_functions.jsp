<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fn" uri="jakarta.tags.functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<h1>JSTL Functions Library</h1>

	<p>
		- 유용한 함수 (메소드) 들의 모음집 <br>
		- 주로 관례상 접두어는 fn 으로 붙여준다. <br>
		- 태그형식이 아니라 EL 구문 형식으로 되어있음!! (표현법 주의) <br>
		
		<br>
		
		- 사실 EL 구문 안쪽에서는 순수 자바 형식의 메소드들을 충분히 호출해서 쓸 수 있음!! <br>
		- 그래서 functions library 는 사용 빈도가 굉장히 낮다!! 
		  (굳이 라이브러리 연동을 안해도 동일한 효과를 줄 수 있으니깐)
	</p>
	
	<!-- functions library 에서 제공하는 함수들은 주로 "문자열" 처리 관련 유용한 함수들 위주임 -->
	
	<c:set var="str" value="How are you?" />
	
	<br>
	
	str : ${ str } <br>
	
	문자열의 길이 : ${ fn:length(str) } 글자 <br> <!-- functions library 방식 -->
	문자열의 길이 : ${ str.length() } 글자 <br> <!-- 순수 자바 방식 -->

	<!-- fn:length 는 인자값으로 ArrayList 를 제시하면 리스트의 크기도 알아낼 수 있음 -->
	
	<%
		java.util.ArrayList<String> list = new java.util.ArrayList<>();
	
		list.add("안녕");
		list.add("하세요");
		
		request.setAttribute("list", list);
	%>
	
	리스트의 크기 : ${ fn:length(list) } <br> <!-- functions library 방식 -->
	리스트의 크기 : ${ list.size() } <br> <!-- 순수 자바 방식 -->
	
	모두 대문자로 출력 : ${ fn:toUpperCase(str) } 또는 ${ str.toUpperCase() } <br>
	모두 소문자로 출력 : ${ fn:toLowerCase(str) } 또는 ${ str.toLowerCase() } <br>
	
	are 의 시작인덱스 : ${ fn:indexOf(str, "are") } 또는 ${ str.indexOf("are") } <br>
	
	are 를 were 로 변환 : ${ fn:replace(str, "are", "were") } 또는 ${ str.replace("are", "were") } <br>

	str : ${ str } <br> <!-- 원본값이 바뀌는 것은 아님!! -->

	str 에 "are" 이라는 문자열이 포함되어있니? : ${ fn:contains(str, "are") } 또는 ${ str.contains("are") }
	
	<br>
	
	<!-- 마지막 응용 -->
	<c:choose>
		<c:when test="${ fn:contains(str, 'are') }">
			문자열 str 에는 "are" 이 포함되어있습니다.
		</c:when>
		<c:otherwise>
			문자열 str 에는 "are" 이 포함되어있지 않습니다.
		</c:otherwise>
	</c:choose>

</body>
</html>





<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="com.kh.action.model.vo.Person"%>
<%@page import="java.util.ArrayList"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>JSTL Core Library</h1>
	
	<p>
		- 변수와 조건문, 반복문 등의 자바 로직과 관련된 문법을 제공 <br>
		- Core Library는 관례상 보통 "c" 라는 접두어를 사용해서 선언한다.
	</p>
	
	<br><br>
	
	<hr>
	
	<h3>1. 변수 관련 태그들 (Servlet Scope 내장 객체들과 관련된 태그들)</h3>
	
	<pre>
		변수 선언
		- 변수를 선언하고 초기값을 대입해주는 기능을 제공
		즉, Servlet Scope 내장 객체에 키 + 벨류 세트로 값을 담는 기능 제공
		
		- 가능한 어떤 Scope 내장 객체에 어떤 키값으로 담아줄건지 scope를 명시하는 것을 권장
		
		- c:set 을 통해 선언된 데이터들은 EL로만 접근해서 사용 가능함

		[ 표현법 ]		
		&lt;c:set var="변수명" value="값" scope="범위"&gt;
		> 해당 scope 영역에 xxx.setAttribute("변수명", "값") 과 같은 기능을 제공
		반드시 키, 벨류 세트로 다 지정해줘야함(var, value 속성은 생략 불가)
		scope 속성은 생략 가능 (생략 시 기본값은 pageScope)
		벨류의 타입은 아무거나 가능(Object 타입)
	</pre>
	
	<!-- 
		반드시 Core Library 선언을 먼저 해야함(taglib 지시어)
		안하면 Unknown tag 'c:set' 이라는 에러 발생
	-->
	
	<c:set var="num1" value="10"/> <!-- pageScope에 담김 -->
	<!-- 
		내부적으로
		pageContext.$setAttribute("num1", "10");
		구문이 실행됨
	-->
	 
	<c:set var="num2" value="20" scope="request"/> <!-- requestScope에 담김 -->
	<!-- 
		내부적으로
		request.setAttribute("num2", "20");
		구문이 실행됨
	-->
	
	num1 변수값 : ${ num1 } <br>
	num2 변수값 : ${ num2 } <br>
	
	<c:set var="result" value="${ num1 + num2 }" scope="session"/> <!-- sessionScope에 담김 -->
	<!-- 
	 	내부적으로
	 	session.setAttribute("result", (int)pageContext.getAttribute("num1") 
	 									+ (int)request.getAttribute("num2"));
	구문이 실행됨
	 -->
	result 변수값 : ${ result } <br><br>
	
	<!-- 
		- EL 구문 사용 시. 키값만 단순히 제시하면 공유범위가 가장 작은곳부터 차례대로 탐색됨
		- 티가 날 정도는 아니지만 속도가 좀 느려질 수 있음
		> 스코프명.키값을 권장
	-->
	
	num1 변수값 : ${ pageScope.num1 } <br>
	num2 변수값 : ${ requestScope.num2 } <br>
	result 변수값 : ${ requestScope.result } <br>
	<!-- result는 requestScope에 없으므로 아무것도 출력되지 않음 -->
	result 변수값 : ${ sessionScope.result } <br><br>
	
	<!-- 다른 표현법 -->
	<c:set var="result" scope="request">9999</c:set>
	<!-- 시작태그와 종료태그 사이에 value 속성을 기술 가능하기도 함 -->
	result 변수값 : ${ requestScope.result } <br><br>
	
	<br>
	
	<hr>
	
	<pre>
		변수 삭제 (Servlet Scope 내장 객체에서 키값으로 담긴 데이터를 삭제하는 기능 제공)
		
		- 해당 변수를 Scope 객체에서 찾아서 제거하는 태그
		  해당 Scope 내장 객체로부터 키값을 제시해서 키+벨류 세트로 제거해주는 태그
		  
		- 삭제 시에도 어떤 Scope 내장 객체에서 삭제할건지 scope를 명시하는 것을 권장
	   	
	   	[ 표현법 ]
	   	&lt;c:remove var="변수명" scope="범위"&gt;
	   	
	   	해당 Scope 내장 객체에 xxx.removeAttribute("변수명") 과 같은 기능을 제공
	   	scope 속성은 생략 가능하나
	   	생략 시 모든 scope 영역에서 해당 키+벨류 세트를 모두 다 찾아서 지움
	</pre>
	
	삭제 전 result : ${ result } <br> <!-- requestScope.result로 나옴(작은 scope부터 탐색) -->
	
	<br>
	
	1) 특정 scope를 지정해서 삭제 <br>
	<c:remove var="result" scope="request"/> <!-- requestScope에서 result 삭제 -->
	삭제 후 result : ${ result } <br> <!-- requestScope에 없어서 sessionScope까지 확장됨 -->
	
	<br>
	
	2) scope 생략해서 삭제 (작은 scope부터 탐색해서 전체 삭제) <br>
	<c:remove var="result"/>
	<!-- 
		내부적으로
		pageContext.removeAttribute("result");
		request.removeAttribute("result");
		session.removeAttribute("result");
		application.removeAttribute("result");
		구문이 실행됨
	-->
	삭제 후 result : ${ result } <br> <!-- 아무것도 출력되지 않음 -->
	
	<br><br>
	 
	<hr>
	
	<pre>
		변수 출력
		- 데이터를 출력해주는 기존 EL 구분에 기타 옵션을 줘서 출력할 수 있도록 해주는 태그
		
		[ 표현법 ]
		&lt;c:out value="출력할 값" default="기본값"(생략가능) escapeXml="true/false"(생략가능) /&gt;
		
		default : value에 출력하고자 하는 값이 없을 경우 기본값으로 대체해서 출력할 내용물을 기술하는 속성
		
		escapeXml : value에 html 태그가 텍스트로 포함된 경우 태그로써 해석해서 출력할지에 대한 여부를 기술하는 속성
			true : html 태그를 텍스트로 인식해서 그대로 출력 (기본값)
			false : html 태그를 태그로 인식해서 해석해서 출력
	</pre>
	
	result 변수값 : ${ result } <br> <!-- 아무것도 출력되지 않음 -->
	result 변수값 : <c:out value="${ result }"/> <br> <!-- 아무것도 출력되지 않음 -->
	result 변수값 : <c:out value="${ result }" default="result is null"/> <br>
	
	<br>
	
	<c:set var="outTest" value="<b>출력테스트</b>"/>
	outTest 변수값 : ${ outTest } <br> <!-- 출력테스트 -->
	outTest 변수값 : <c:out value="${ outTest }"/> <br> <!-- <b>출력테스트</b> -->
	outTest 변수값 : <c:out value="${ outTest }" escapeXml="false"/> <br> <!-- 출력테스트 -->
	outTest 변수값 : <c:out value="${ outTest }" escapeXml="true"/> <br> <!-- <b>출력테스트</b> -->

	<br><br>
	
	<hr>
	
	<h3>2. 조건문 - if</h3>
	
	<pre>
		- JAVA 언어의 단독 if 문과 비슷한 역할을 하는 태그
		- 조건식은 test 속성에 작성하되, EL 구문 형식으로 적어줘야 함
	</pre>
	
	<%--
		[ 표현법 ]
		<c:if test="${조건식}">
		    조건식이 true 일 때 실행할 코드
		</c:if>
	--%>
	
	<!-- 기존의 구문 -->
	<%--
	<% if(조건식) { %>
	    조건식이 true 일 때 실행할 코드
	<% } %>
	--%>
	
	<c:if test="${ num1 gt num2 }"> <!-- num1 > num2 -->
        <b>num1이 num2보다 크다.</b>
    </c:if>
    
    <c:if test="${ num1 le num2 }"> <!-- num1 <= num2 -->
        <b>num1이 num2보다 작거나 같다.</b>
    </c:if>
    
    <br><br>
    
    <c:set var="str" value="abc"/> <!-- pageScope -->
    
    <!-- 기존 방식 -->
    <%--
    <% if(str.equals("abc")) { %>
        <b>str은 abc이다.</b>
    <% } %>
    --%>
    
    <c:if test="${ str eq 'abc' }"> <!-- 문자열 비교 시에는 eq, ne 연산자 사용 -->
        <b>str은 abc이다.</b>
    </c:if>
    
    <c:if test="${ str ne 'abc' }">
        <b>str은 abc가 아니다.</b>
    </c:if>
    
    <br><br>
    
    <hr>
    
    <h3>3. 조건문 - choose, when, otherwise</h3>
    
    <pre>
    	- JAVA 언어의 단독 if ~ else if ~ else 문 or switch 문과 비슷한 역할을 하는 태그
    	- 여러 조건을 달고 싶을 때 사용
    </pre>
    
    <%--
    	[ 표현법 ]
    	<c:choose>
    	    <c:when test="${조건식1}">
    	        조건식1이 true 일 때 실행할 코드
    	    </c:when>
    	    <c:when test="${조건식2}">
    	        조건식2가 true 일 때 실행할 코드
    	    </c:when>
    	    <c:otherwise>
    	        모든 조건식이 false 일 때 실행할 코드
    	    </c:otherwise>
   	    </c:choose>
    --%>
    
    <!-- 기존의 방식 -->
    <%--
    <% if(조건식1) { %>
        조건식1이 true 일 때 실행할 코드
    <% } else if(조건식2) { %>
        조건식2가 true 일 때 실행할 코드
    <% } else { %>
        모든 조건식이 false 일 때 실행할 코드
    <% } %>
    --%>
    
    <c:choose>
        <c:when test="${ num1 eq 20 }">
            <b>num1이 num2보다 크다.</b>
        </c:when>
        <c:when test="${ num1 eq 10 }">
            <b>num1과 num2는 같다.</b>
        </c:when>
    	<c:otherwise>
            <b>num1이 num2보다 작다.</b>
    	</c:otherwise>
  	</c:choose>
  	
	<%--
  		자주 사용되는 예시
  		
  		- sesstionScope에 로그인한 회원의 정보가 담긴 객체가 주로 있음
  		(loginUser 라는 이름으로 담긴 객체가 있다고 가정)
  		
  		<c:choose>
  		    <c:when test="${ empty sessionScope.loginUser }">
  		        로그인 폼 출력
  		    </c:when>
  		    <c:otherwise>
  		        <b>${ sessionScope.loginUser.name }님 환영합니다.</b>
  		        로그인 후 화면 출력
  		    </c:otherwise>
	    </c:choose>
  	--%>
  	 
  	<br><br>
  	 
  	<hr>
  	 
  	<h3>4. 반복문 - forEach</h3>
  	 
  	<pre>
  	 	- JAVA 언어의 for 문과 비슷한 역할을 하는 태그
  	 	- 속성들을 어떻게 작성하냐에 따라 일반 for, 향상된 for, forEach 구문으로 다양하게 활용 가능
  	</pre>
  	 
  	<%--
  	 	[ 표현법 ]
  	 	
  	 	1. 일반 for 문
  	 	<c:forEach var="변수명" begin="시작값" end="끝값" step="증감값">
  	 	    반복할 코드
  	 	</c:forEach>
  	 	
  	 	- var, begin 속성이 일반 for 문의 초기식 역할,
  	 	  end 속성이 일반 for 문의 조건식 역할,
  	 	  step 속성이 일반 for 문의 증감식 역할을 함
  	 	  
  	 	  
  	 	2. 향상된 for 문(for-each 문)
  	 	<c:forEach var="변수명" items="순차적으로 접근할 배열/리트스 명">
  	 	    반복할 코드
 	    </c:forEach>
 	    
 	    - var는 변수 선언문 역할
 	      items는 배열명/ 리스트명 작성
 	      
 	    3. forEach 구문
  	--%>
  	 
  	<!-- 일반 for문 예시 -->
  	<c:forEach var="i" begin="1" end="10" step="2">
  	 	${ i } <!-- 1, 3, 5, 7, 9 -->
  	</c:forEach>
  	 
  	<br>
  	 
  	<!-- for-each문 예시 -->
  	<c:set var="test" value="노트북,태블릿,스마트폰"/>
  	<c:forEach var="str" items="${ test.split(',') }">
  	    ${ str } <!-- strList 라는 이름으로 pageScope에 담긴 리스트의 요소들이 하나씩 출력됨 -->
  	</c:forEach>
  	 
  	 <!-- 향상된 for문 활용 -->
  	<%
  	 	ArrayList<Person> list = new ArrayList<>();
  	 
 	    list.add(new Person("홍길동", 20, "남자"));
 	    list.add(new Person("김길동", 30, "여자"));
 	    list.add(new Person("박길동", 40, "남자"));
 	    
 	    request.setAttribute("list", list);
  	%>
  	 
  	<h5>회원 목록 조회</h5>
  	 
	<table border="1">
  	 	<thead>
  	 	    <tr>
  	 	    	<th>번호</th>
  	 			<th>이름</th>
  	 			<th>나이</th>
  	 			<th>성별</th>
  	 		</tr>
  	 	</thead>
  	 	<tbody>
  	 		<!-- 기존 방식 -->
  	 		<% if (list.isEmpty()) { %>
  	 		    <tr>
  	 				<td colspan="4">회원이 존재하지 않습니다.</td>
  	 			</tr>
  	 		<% } else { %>
  	 		    <% for (Person p : list) { %>
  	 		        <tr>
  	 					<td></td>
  	 					<td><%= p.getName() %></td>
  	 					<td><%= p.getAge() %></td>
  	 					<td><%= p.getGender() %></td>
  	 				</tr>
  	 		    <% } %>
  	 		<% } %>
  	 		
  	 		<!-- EL/JSTL 이용 방식 -->
  	 		<c:choose>
  	 		    <c:when test="${ empty requestScope.list }">
  	 		        <tr>
  	 					<td colspan="4">회원이 존재하지 않습니다.</td>
  	 				</tr>
  	 		    </c:when>
  	 		    <c:otherwise>
  	 		        <c:forEach var="p" items="${ requestScope.list }" varStatus="status">
  		 	            <tr>
  	 						<td>${ status.count }</td> <!-- .index는 0부터 시작 / .count는 1부터 시작 -->
  	 						<td>${ p.name }</td>
  	 						<td>${ p.age }</td>
  	 						<td>${ p.gender }</td>
  	 					</tr>
  	 		        </c:forEach>
  	 		    </c:otherwise>
 	 		</c:choose>
  	 	</tbody>
  	</table>
  	 
  	<br><br>
  	 
  	<hr>
  	 
  	<h3>5. 반복문 - forTokens </h3>
  	 
  	<pre>
  	 	- 구분자를 통해서 분리된 각각의 문자열에 순차적으로 접근하면서 반복을 수행
  	 	- JAVA의 split 또는 STringTokenizer 클래스와 비슷한 역할을 하는 태그
  	</pre>
  	 
  	<%--
  	 	[ 표현법 ]
  	 	<c:forTokens var="변수명" items="구분자로 분리된 문자열" delims="구분자">
  	 	    반복할 코드
  	 	</c:forTokens>
  	 
  	 	var는 변수 선언문 역할
  	 	items는 구분자로 분리된 문자열 작성
  	 	delims는 구분자 작성 (생략 시 기본값은 공백)
  	--%>
  	 
  	<c:set var="device" value="노트북,태블릿,스마트폰"/> <!-- pageScope -->
  	 
  	<ul>
  		<c:forTokens var="d" items="${ device }" delims=",">
  	 		<li>${ d }</li> <!-- 노트북, 태블릿, 스마트폰이 각각 li 태그로 출력됨 -->
  		</c:forTokens>
  	</ul>
  	 
  	<br><br>
  	 
  	<hr>
  	 
  	<h3>6. 쿼리스트링 관련 - url, param</h3>
  	 
  	<pre>
  		- 쿼리스트링 : GET 방식의 요청일 경우 rul 주소 상에 "?키=벨류&키=벨류&..." 형태로 데이터들이 노출된 부분
  	 	- url 경로를 생성하고, 쿼리스트링을 정의할 수 있는 태그
  	 	> 넘겨야 할 쿼리스트링이 긴 경우 쓰면 편함
  	</pre>
  	 
  	<%--
  	 	[ 표현법 ]
  	 	1. url 태그
  	 	<c:url value="url 주소" var="변수명">
  	 	    <c:param name="키" value="값"/>
  	 	    <c:param name="키" value="값"/>
  	 	    ...
  	 	</c:url>
		
		- 변수명 = "요청할url주소?키값=벨류&...";  	 
  	--%>
  	 
	<!-- 기존의 방식 -->
	<a href="/action/list?currentPage=1&num=2&keyword=hi">기존의 방식</a>
	<!-- a태그는 get 방식 - 필요하면 쿼리스트링 직접 기술 가능 -->
  	 
  	<br><br>
  	 
  	 <!-- url 태그 활용 -->
  	<c:url var="link" value="/list">
	  	<c:param name="currentPage" value="1"/>
	  	<c:param name="num" value="2"/>
	  	<c:param name="keyword" value="hi"/>
	</c:url>
	<a href="${ link }">url 태그 활용</a>
</body>
</html>
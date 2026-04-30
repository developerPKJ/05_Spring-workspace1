<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<h1>JSTL 이란?</h1>

	<p>
		- JSP Standard Tag Library 의 약자로
		  JSP 페이지 내에서 사용되는 커스텀 액션 태그를 사용할 수 있도록 고안된 라이브러리 <br>
		- JSP 페이지 내에서 공통적으로 자주 사용되는 자바 코드들의 집합을
		  보다 쉽게 사용할 수 있도록 자바 구문을 "태그화" 해서 표준으로 제공하는 라이브러리
	</p>
	
	<!-- 
		자바 코드 => 태그화 
		
		- JSTL 태그를 이용하면 JSP 페이지 내에서 자바 구문을 없앨 수 있음!!
	-->
	
	<br><br>
	
	<hr>
	
	<h3>* JSTL 라이브러리 다운로드 후 추가</h3>

	<ol>
		<li>
			http://mvnrepository.com 접속
		</li>
		<li>
			jakarta.servlet.jsp.jstl-api, jakarta.servlet.jsp.jstl
			라이브러리 가져오기 (pom.xml 파일에 등록)
		</li>
		<li>
			프로젝트 restart
		</li>
	</ol>
	
	<br><br>
	
	<hr>
	
	<h3>* JSTL 라이브러리 선언 (연동)</h3>
	
	<p>
		- JSTL 을 사용할 해당 JSP 페이지에서 상단에 "taglib" 지시어를 이용해서 선언!!
	</p>
	
	<pre>
		[ 표현법 ]
		
		&lt;%@ taglib prefix="접두어" uri="라이브러리파일상의uri주소고유값" %&gt;
	</pre>
	
	<br><br>
	
	<hr>
	
	<h3>* JSTL 분류</h3>
	
	<!-- JSTL 은 세가지 분류로 나눌 수 있음 -->
	
	<h4>1. JSTL Core Library</h4>
	
	<p>
		- 변수와 조건문, 반복문 등 자바 핵심 로직과 관련된 문법을 제공
	</p>
	
	<a href="/action/custom/jstl/core">core library &raquo;</a>

	<br><br>
	
	<hr>

	<h4>2. JSTL Formatting Library</h4>
	
	<p>
		- 숫자, 날짜 및 시간 데이터 등의 출력 형식을 지정할 때 사용하는 문법을 제공
	</p>
	
	<a href="/action/custom/jstl/formatting">formatting library &raquo;</a>
	
	<br><br>
	
	<hr>

	<h4>3. JSTL Functions Library</h4>
	
	<p>
		- EL 구문 안에서 사용할 수 있는 유용한 함수들을 제공
		  (얘만 태그 형식의 문법이 아님..)
	</p>
	
	<a href="/action/custom/jstl/functions">functions library &raquo;</a>

</body>
</html>




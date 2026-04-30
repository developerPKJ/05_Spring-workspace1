<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	
	<h1>* EL (Expression Language) - 표현 언어</h1>
	
	<p>
		- 기존에 사용했던 표현식 (출력식) &lt;%= name %&gt; 과 같이
		  JSP 상에서 표현하고자 하는 값을 ${ name } 의 형식으로 표현해서 작성하는 것
	</p>
	
	<br><br>
	
	<hr>
	
	<h3>1. EL 기본 구문에 대해서 먼저 배워보자!!</h3>
	
	<a href="/action/el">01_EL</a>
	
	<br><br>
	
	<h3>2. EL 의 연산자에 대해서 배워보자!!</h3>
	
	<a href="/action/el/operation">02_EL의 연산자</a>
	
	<br><br>
	
	<hr>
	
	<h1>* JSP Action Tag</h1>
	
	<!-- 
		* JSP 를 이루는 구성 인자
		
		1. JSP 스크립팅 원소 : JSP 페이지에서 자바코드를 직접 기술할 수 있게 하는 기술
						   예) 선언문, 스크립틀릿, 표현식(출력식)
		2. 지시어 : JSP 페이지 정보에 대한 내용을 표현한다거나, 또 다른 JSP 페이지를 포함하고자 할 때 사용
				  예) page 지시어, include 지시어, taglib 지시어
		
		+ 
		
		3. JSP 액션 태그 : 기존의 JSP 문법을 확장하는 기술을 제공하는 태그
		- 표준 액션 태그 (Standard Action Tag)
		: JSP 페이지 내에서 곧바로 사용 가능한 액션 태그들 (즉, 별도의 라이브러리 등의 연동이 필요 없음)
		  모든 태그명 앞에 jsp: 이라는 접두어가 붙음
		
		- 커스텀 액션 태그 (Custom Action Tag)
		: JSP 페이지 내에서 곧바로 사요이 불가능한 액션 태그들 (즉, 별도의 라이브러리 등의 연동이 필요함)
		  모든 태그명 앞에 jsp: 이외의 접두어가 붙음 (이 접두어는 내가 원하는 대로 정할 수 있다, 종류 또한 다양)
		  제공되는 대표적인 유용한 라이브러리가 있음 (JSTL)
		  
		* 액션 태그 사용 시 명심할 사항
		- 태그명 앞에 접두어가 꼭 붙어야 한다. (접두어:태그명)
		- 액션 태그는 html 이 아닌 xml 기술 기반의 태그들이다.
		  (xml 태그들은 반드시 시작태그와 종료태그가 세트여야만 함!!)
		
		- 즉, 항상 <접두어:태그명></접두어:태그명> 형식으로 기술해야한다.
		- 만약 시작태그와 종료태그 사이에 굳이 쓸 내용이 없다면, <접두어:태그명 /> 형식으로 종료태그를 종결시킬 수 있음!!
	-->
	
	<p>
		- XML 기술을 이용해서 기존의 JSP 문법을 확장시켜주는 기술을 제공하는 태그들
	</p>
	
	<br><br>
	
	<h3>1. 표준 액션 태그 (Standard Action Tag)</h3>
	
	<p>
		- JSP 페이지에서 별도의 외부 라이브러리 연동 없이 곧바로 사용 가능한 액션 태그들 <br>
		- JSP 페이지 자체에 내장되어있다. <br>
		- 태그명 앞에 jsp: 이라는 접두어가 붙는다. <br>
		
		<br>
		
		종류) 다양하긴 하나,
		jsp:include, jsp:forward 태그만 수업시간에 다뤄 볼 것!!
	</p>
	
	<a href="/action/standard/include">01_jsp:include</a> <br><br>
	
	<a href="/action/standard/forward">02_jsp:forward</a>
	
	<br><br>
	
	<h3>2. 커스텀 액션 태그 (Custom Action Tag)</h3>
	
	<p>
		- JSP 페이지에서 곧바로 사용이 불가능 (별도의 라이브러리 연동이 필요함) <br>
		- 태그명 앞에 접두어로 jsp: 이외의 접두어가 붙는다. (접두어는 내가 지정) <br>
		
		<br>
		
		- 제공되고 있는 유용한 라이브러리가 있음!! JSTL!!
	</p>
	
	<a href="/action/custom/jstl">JSTL</a>
	
</body>
</html>












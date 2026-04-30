<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<h1>formatting library</h1>

	<p>
		- 숫자나 날짜 등의 형식을 지정해서 출력하도록 도와주는 라이브러리 <br>
		- 접두어는 보통 관례상 fmt 로 지정해서 쓴다.
	</p>
	
	<br><br>
	
	<hr>
	
	<h3>1. formatNumber</h3>

	<p>
		- 숫자데이터의 포맷 (형식) 을 지정 <br>
		- 표현하고자 하는 숫자데이터의 형식으로 통화기호, % 등 내가 원하는 쓰임에 따라 지정 가능함
	</p>
	
	<%-- 
		[ 표현법 ]
		
		<fmt:formatNumber value="숫자데이터" groupingUsed="true/false" 
										  type="percent/currency" currencySymbol="$" />
		
		- groupingUsed, type, currencySymbol 속성은 생략 가능
		- groupingUsed : 숫자 단위의 구분자 (3자리마다 ,) 표시 여부를 지정
						 생략 시 기본값은 true (, 를 찍겠다)
						 false 는 , 를 찍지 않겠다 라는 뜻
		- type="percent" : 소숫점을 백분율 단위로 환산해서 출력
		- type="currency" : 통화 (돈) 의 단위로 출력
							현재 내가 쓰고있는 컴퓨터의 로컬 정보에 따라 통화 단위가 정해진다.
							또한, groupingUsed 가 기본적으로 true 이기 때문에
							3 자리마다 , 도 찍혀서 보인다.
		- currencySymbol : 통화기호 문자의 종류를 설정 가능
	--%>
	
	<c:set var="num1" value="123456789" />
	<c:set var="num2" value="0.75" />
	<c:set var="num3" value="50000" />

	<br>
	
	그냥 출력 : ${ num1 } <br>
	formatNumber 태그를 이용해서 출력 : <fmt:formatNumber value="${ num1 }" /> <br>
	<!-- 3자리 마다 , 가 찍혀있음 -->
	groupingUsed 설정해서 출력 : <fmt:formatNumber value="${ num1 }" groupingUsed="false" /> <br>
	type="percent" : <fmt:formatNumber value="${ num2 }" type="percent" /> <br>
	type="currency" : <fmt:formatNumber value="${ num3 }" type="currency" /> <br>
	currencySymbol 설정 : <fmt:formatNumber value="${ num3 }" type="currency" currencySymbol="$" />
	
	<br><br>
	
	<hr>
	
	<h3>2. formatDate</h3>
	
	<p>
		- 날짜 및 시간 데이터의 포맷 (형식) 지정 <br>
		- 단, 날짜 데이터를 지정할 경우 java.util.Date 객체를 제시해야만 한다!!
	</p>
	
	<%-- 
		[ 표현법 ]
		
		<fmt:formatDate value="날짜데이터" type="출력형식" 
										dateStyle="" timeStyle="" pattern="" />
	
		- type 속성은 생략 가능 (기본값은 date)
		- type="date/time/both"
		- dateStyle, timeStyle 속성 또한 생략 가능 (기본값은 medium)
		  날짜와 시간의 포맷을 나타내는 속성
		- dateStyle/timeStyle="medium/long/full/short"
		  꼭 dateStyle 과 timeStyle 을 동일하게 쓸 필요는 X
		- pattern : 날짜 형식을 커스터마이징 할 때 사용
		  yyyy : 년도
		  MM : 월
		  dd : 일
		  E : 요일
		  a : 오전 / 오후
		  HH : 시
		  mm : 분
		  ss : 초
	--%>
	
	<c:set var="current" value="<%= new java.util.Date() %>" />
	
	<br>
	
	그냥 출력 : ${ current } <br>
	
	formatDate 태그로 출력 : <fmt:formatDate value="${ current }" />
	
	<br>
	
	<!-- type 을 바꿔가면서 출력해보기 -->
	<ul>
		<li>
			type="date" : <fmt:formatDate value="${ current }" type="date" />
			<!-- date : 날짜를 출력하겠다. (기본값) -->
		</li>
		<li>
			type="time" : <fmt:formatDate value="${ current }" type="time" />
			<!-- time : 시간을 출력하겠다. -->
		</li>
		<li>
			type="both" : <fmt:formatDate value="${ current }" type="both" />
			<!-- both : 날짜와 시간 모두 다 출력하겠다. -->
		</li>
		<li>
			medium : <fmt:formatDate value="${ current }" type="both"
									 dateStyle="medium" timeStyle="medium" />
		</li>
		<li>
			long : <fmt:formatDate value="${ current }" type="both"
								   dateStyle="long" timeStyle="long" />
		</li>
		<li>
			full : <fmt:formatDate value="${ current }" type="both"
								   dateStyle="full" timeStyle="full" />
		</li>
		<li>
			short : <fmt:formatDate value="${ current }" type="both"
								    dateStyle="short" timeStyle="short" />
		</li>
		<li>
			mix : <fmt:formatDate value="${ current }" type="both"
								  dateStyle="full" timeStyle="short" />
		</li>
		<li>
			customizing : <fmt:formatDate value="${ current }" type="both"
										  pattern="yyyy-MM-dd(E) a HH:mm:ss" />
		</li>
	</ul>

</body>
</html>




<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<h1>EL 연산</h1>

	<h3>1. 산술 연산</h3>

	<p>
		* 기존 방식 <br>
		
		10 + 3 = <%= (int)request.getAttribute("big") + (int)request.getAttribute("small") %>
	</p>
	
	<p>
		* EL 연산 방식 <br>
		
		10 + 3 = ${ requestScope.big + requestScope.small } <br>
		10 - 3 = ${ big - small } <br>
		10 * 3 = ${ big * small } <br>
		10 / 3 = ${ big / small } 또는 ${ big div small } <br>
		<!-- 3.3333333333333335 (소숫점이 나옴) -->
		10 % 3 = ${ big % small } 또는 ${ big mod small }
	</p>
	
	<pre>
		- EL 연산 시 주의할 점
		
		10 + 3 = ${ big } + ${ small }
		
		위와 같이 쪼개서 쓰면 절대 연산이 이루어지지 않음!!
	</pre>
	
	<br><br>
	
	<hr>
	
	<h3>2. 숫자간의 대소 비교 연산</h3>
	
	<p>
		* 기존 방식 <br>
		
		10 > 3 : <%= (int)request.getAttribute("big") > (int)request.getAttribute("small") %>
	</p>
	
	<p>
		* EL 연산 방식 <br>
		
		10 > 3 : ${ big > small } 또는 ${ big gt small } <br>
		10 < 3 : ${ big < small } 또는 ${ big lt small } <br>
		10 >= 3 : ${ big >= small } 또는 ${ big ge small } <br>
		10 <= 3 : ${ big <= small } 또는 ${ big le small }
	</p>
	
	<br><br>
	
	<hr>
	
	<h3>3. 동등 비교 연산</h3>
	
	<p>
		* 기존 방식 <br>
		
		10 과 3 이 일치합니까? :
		<%= (int)request.getAttribute("big") == (int)request.getAttribute("small") %>
		
		<br>
		
		sOne 과 sTwo 가 일치합니까? :
		<%= ((String)request.getAttribute("sOne")).equals((String)request.getAttribute("sTwo")) %>
	</p>
	
	<p>
		* EL 연산 방식 <br>
		
		10 과 3 이 일치합니까? : ${ big == small } 또는 ${ big eq small } <br>
		big 에 담긴 값이 10 과 일치합니까? : ${ big == 10 } 또는 ${ big eq 10 } <br>
		<!-- EL 연산 시 리터럴값도 제시 가능!! -->
		sOne 과 sTwo 가 일치합니까? : ${ sOne == sTwo } 또는 ${ sOne eq sTwo } <br>
		<!-- EL 의 문자열 동등비교 시 내용물 기준으로 돌아감!! (equals 메소드 역할) -->
		
		<br>
		10 과 3 이 일치하지 않습니까? : ${ big != small } 또는 ${ big ne small } 또는
								  ${ !(big == small) } 또는 ${ not (big == small) } 또는
								  ${ not (big eq small) } <br>
		<!-- ne : not equals -->
		sOne 과 sTwo 가 일치하지 않습니까? : ${ sOne != sTwo } 또는 ${ sOne ne sTwo } <br>
		
		<br>
		sOne 에 담긴 값이 "안녕" 과 일치합니까? : ${ sOne == "안녕" } 또는 ${ sOne eq '안녕' }
		<!-- EL 에서의 문자열 리터럴은 쌍따옴표던 홑따옴표던 상관 없이 표기 가능!! -->
	</p>
	
	<br><br>
	
	<hr>
	
	<h3>4. 객체가 null 인지 또는 리스트가 비어있는지 체크하는 연산</h3>

	<!-- 
		* 기존 방식
		
		request.getAttribute("pTwo") == null
									 != null
									 
		((ArrayList<String>)request.getAttribute("lOne")).isEmpty()
	-->
	
	<p>
		* EL 연산 방식 <br>
		
		pTwo 가 null 입니까? : ${ pTwo == null } 또는 ${ pTwo eq null } 또는 ${ empty pTwo } <br>
		pOne 이 null 입니까? : ${ empty pOne } <br>
		pOne 이 null 이 아닙니까? : ${ pOne != null } 또는 ${ pOne ne null } 또는
								${ !(pOne == null) } 또는 ${ not (pOne eq null) } 또는
								${ !empty pOne } 또는 ${ not empty pOne } <br>
		<br>
		lOne 이 텅 비어있습니까? : ${ empty lOne } <br>
		lTwo 가 텅 비어있습니까? : ${ empty lTwo }
	</p>

	<br><br>
	
	<hr>
	
	<h3>5. 논리연산자</h3>

	<p>
		* EL 연산 방식 <br>
		
		AND 연산 : ${ true && true } 또는 ${ true and true } <br>
		OR 연산 : ${ true || false } 또는 ${ true or false }
	<p>
	
	<br><br>
	
	<hr>
	
	<h3>연습문제</h3>

	<b>* EL 연산에서 배운 키워드만 가지고 써볼 것</b>

	<p>
		1. big 이 small 보다 크고 lOne 이 텅 비어있습니까? : ${ (big gt small) and (empty lOne) }
		<br>
		
		2. big 과 small 의 곱은 4의 배수입니까? : ${ ((big * small) mod 4) eq 0 }
		<br>
		
		3. lTwo 가 텅 비어있지 않거나 또는 sOne 에 담긴 값이 "안녕하세요" 와 일치합니까? 
		: ${ (not empty lTwo) or (sOne eq "안녕하세요") }
	</p>

</body>
</html>






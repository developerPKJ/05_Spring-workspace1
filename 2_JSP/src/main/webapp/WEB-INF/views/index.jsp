<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<h1>* JSP (Java Server Page)</h1>
	
	<p>
		- JSP 란, HTML 코드 형식 내에서 자바코드를 쓸 수 있는 "자바 언어" 로
		  기존의 자바 코드 내에서 HTML 코드를 작성하여 응답화면을 구현했던 복잡함을 보다 간단하게 해결 가능한 기술이다.
	</p>
	
	<br><br>
	
	<hr>
	
	<h2>JSP Element 표현법</h2>
	
	<h3>1. JSP 스크립팅 원소 (Scripting Element)</h3>

	<p>
		- JSP 페이지에서 자바 코드를 기술할 수 있게 해주는 기능
	</p>
	
	<ol>
		<li>
			선언문 : &lt;%! %&gt; <br>
			- 멤버변수와 메소드를 "선언" 하기 위해 사용
		</li>
		<li>
			스크립틀릿 : &lt;% %&gt; <br>
			- JSP 에서 자바 코드를 기술하기 위한 "제일 기본적"인 표현법 (일반적인 자바 구문 쓰는 용도)
		</li>
		<li>
			표현식 (출력식) : &lt;%= %&gt; <br>
			- 자바에서 작성한 값 또는 메소드 호출 결과값 또는 변수값 등을
			  브라우저 화면 상에 "출력" 하기 위해 사용
		</li>
	</ol>

	<!-- JSP Scripting Element 를 공부하기 위한 페이지로 이동 -->
	<!-- 
		우리의 context path : /jsp
		- context path 는 webapp 폴더에 대응되는 개념임!!
		- 즉, 폴더 구조로는 webapp 이 url 주소로 변환해서 보면 context path 가 되는 것임!!
		
		단, WEB-INF 폴더 안쪽은 서버가 직접 관리하는 폴더이기 때문에 
		url 주소 상에 폴더 경로를 직접 적어서 직접 접근이 불가하다!!
		
		주로 이런 경우에는 href 속성에 임의의 url 주소를 적어서 요청을 보내고,
		그에 대응되는 Controller 메소드를 하나 만든 후 거기서 해당 화면을 띄워주게끔 처리한다!!
		(일부러 파일 폴더 경로가 안보여지게끔 Controller 를 우회해서 보여준다)
	-->
	<!-- 
	<a href="WEB-INF/views/01_ScriptingElement.jsp">View Detail &raquo;</a>
	-->

	<a href="/jsp/scripting">View Detail &raquo;</a>
	
	<br><br>
	
	<hr>
	
	<h3>
		2. 지시어 (Directive, 지시자) <br>
		
		&lt;%@ page/include/taglib 속성명="속성값" 속성명="속성값" ... %&gt;
	</h3>
	
	<p>
		- JSP 페이지 전체에 영향을 미치는 정보들을 속성명 + 속성값 형태로 기술할 때 쓰임
	</p>
	
	<ol>
		<li>
			page 지시어 : 현재 이 JSP 페이지를 처리하는데 필요한 각종 속성 (환경설정 관련) 을 기술하는 부분
			<br>
			
			<ul>
				<li>language : 사용할 스크립트 언어 유형을 지정 (스크립틀릿 안에 쓰여질 언어 종류)</li>
				<li>contentType : 웹 브라우저가 받아 볼 해당 페이지의 형식, 페이지에 출력할 텍스트의 인코딩 방식 지정</li>
				<li>pageEncoding : .jsp 파일에 기록된 자바 코드의 인코딩 방식을 지정</li>
				<!-- 여기까지는 이클립스로 .jsp 파일 생성 시 자동완성 해줌!! -->
				
				<li>import : 자바의 import 와 같은 의미 및 역할</li>
				<li>errorPage : 해당 .jsp 페이지 상에서 오류가 발생했을 경우 보여질 에러페이지의 경로를 지정</li>
			</ul>
			
			<br>
			
			<a href="/jsp/directive/page">View Detail &raquo;</a>
		</li>
		<li>
			include 지시어 : jsp 페이지 내에 또 다른 jsp 를 포함시키고자 할 때 사용하는 지시어
			<br>
			<a href="/jsp/directive/include">View Detail &raquo;</a>
		</li>
		<li>
			taglib 지시어 : jsp 기능을 좀 더 확장할 수 있는 인자로
						  추가적인 jsp 용 라이브러리를 등록 (연동) 하는 구문
			<!-- 내일 모레 정도에 배울 것!! -->
		</li>
	</ol>
	
	<br><br>
	
	<hr>
	
	<!-- 피자 주문페이지 예시 -->
	
	<h2>
		피자 주문페이지 (jsp) --> 주문 요청 --> 주문 요청을 받는 Controller 
		--> 요청 처리 --> 결제 페이지 (응답 페이지) 
	</h2>

	<h3>
		<a href="/jsp/pizza/orderForm">피자 주문 페이지로 &raquo;</a>
	</h3>
	
	<br><br>
	
	<hr>
	
	<!-- 로그인 예시 -->
	
	<h2>
		로그인 페이지 (jsp) --> 로그인 요청 --> 로그인 요청을 받는 Controller
		--> 요청 처리 --> 성공/실패 페이지 (응답 페이지)
	</h2>
	
	<h3>
		<a href="/jsp/member/loginForm">로그인 페이지로 &raquo;</a>
	</h3>

</body>
</html>








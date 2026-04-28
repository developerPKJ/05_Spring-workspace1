<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<!-- HTML 주석 : 개발자 도구 탭에 노출됨 -->
	<%-- JSP 주석 : 개발자 도구 탭에 노출되지 않음 --%>

	<h1>스크립팅 원소</h1>
	
	<%!
		// 선언문 : 멤버변수와 메소드를 선언하기 위해 사용
		
		String str = "안녕하세요"; 
		// > 멤버변수 == 전역변수 : 이 jsp 페이지 내에서 다 가져다 쓸 수 있음
	
		public String test() {
			
			return str;	
		}
	%>
	
	<%
		// 스크립틀릿 : 이 안에 일반적인 자바 코드들을 작성 (변수 선언 및 초기화, 제어문 등)
		
		int sum = 0;
		
		for(int i = 1; i <= 100; i++) {
			
			sum += i;
		}
		
		System.out.println("덧셈끝!! 결과는 " + sum);
		System.out.println(test());
	%>
	
	<p>
		- 선언문과 스크립틀릿 대체로 자바 구문을 작성하고, 
		  작성한 자바 구문들은 화면에 절대로 출력되지 않음!! <br>
		- jsp 페이지 내에서 메소드를 선언해서 딱히 쓸일이 없다면, 선언문은 그리 많이 쓰이진 않음!! <br>
		- 스크립틀릿 안에서는 메소드 선언이 불가!! 변수 선언은 가능!!
	</p>
	
	<p>
		- 데이터를 화면으로 출력하고자 한다면 <br>
		  스크립틀릿을 이용해서 출력 가능 : <% out.println(sum); %> <br>
		  표현식 (출력식) 으로 출력 가능 : <%= sum %> <br>
		  메소드 호출 결과도 출력 가능 : <%= test() %> <br>
		  일반 리터럴 값 또는 연산식의 결과 등도 출력 가능 : <%= 10 + 2 %> <br><br>
		  
		- out.println() 구문이 내부적으로 실행되는 원리가 표현식 (출력식) 인 것!!
		  (여기서의 out 객체는 PrintWriter 객체임)
	</p>
	
	<br><br>
	
	<hr>
	
	<%
		// 배열 사용
		String[] name = {"김말똥", "홍길동", "이순신", "김갑생", "박말순"};
	%>
	
	<h5>배열의 길이 : <%= name.length %></h5> <!-- 5 -->
	
	<h5>배열명 : <%= name %></h5> <!-- name 이라는 변수에 담긴 주소값이 그대로 출력됨 -->
	
	<h5>배열의 내용물 : <%= String.join(", ", name) %></h5>
	
	<h4>반복문을 통해 html 요소를 반복적으로 화면에 출력 가능</h4>

	<ul>
		
		<% for(int i = 0; i < name.length; i++) { %>
		
			<li><%= name[i] %></li>
		
		<% } %>
		
	</ul>

</body>
</html>






<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.kh.action.model.vo.Person" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<h1>EL 기본 구문</h1>
	
	<!-- 이미 응답데이터를 request, session 에 담아둠 -->

	<h3>
		1. 기존 방식대로 스크립틀릿과 표현식을 이용해서
		   각 영역에 담겨있는 응답데이터를 뽑아서 화면에 출력
	</h3>
	
	<%-- 
	<%
		// requestScope 에 담긴 값 뽑기
		String classRoom = (String)request.getAttribute("classRoom");
		Person student = (Person)request.getAttribute("student");
		
		// sessionScope 에 담긴 값 뽑기
		String academy = (String)session.getAttribute("academy");
		Person teacher = (Person)session.getAttribute("teacher");
	%>
	
	<p>
		학원명 : <%= academy %> <br>
		강의장 : <%= classRoom %> <br>
		선생님 정보 : <%= teacher %> <br>
		<!-- 내부적으로 .toString() 이 호출된 결과가 출력됨 -->
		
		학생 정보
		<ul>
			<li>이름 : <%= student.getName() %></li>
			<li>나이 : <%= student.getAge() %></li>
			<li>성별 : <%= student.getGender() %></li>
			<!-- private 일 경우 직접 접근이 불가 (is not visible) -->
		</ul>
	</p>
	--%>
	
	<br><br>
	
	<hr>
	
	<h3>
		2. EL 을 이용해서 보다 쉽게 해당 Scope 에 저장된 응답데이터들을 뽑아서 출력할 수 있다.
	</h3>
	
	<p>
		- EL 은 xxx.getAttribute() 를 통해 직접 키값을 제시해서 밸류값을 빼올 필요 없이
		  ${ 여기 } 안에 "키값만" 제시해서 바로 응답데이터에 접근이 가능해진다. <br>
		- 내부적으로 해당 Scope 영역에 해당 키값에 대한 밸류값을 바로 가져와서 출력까지 해줄 수 있다. <br>
		- 이 때, Servlet Scope 내장 객체의 종류를 구분하지 않고
		  자동적으로 모든 내장객체의 키값을 검색해서 존재하는 밸류값을 꺼내서 출력해주는 원리!! <br>
		  
		<br>
		
		- 특히, 응답 데이터 밸류값이 객체 형식일 경우
		  내부적으로 "getter" 메소드를 호출해서 각 필드값에 접근 가능하도록 해준다.  
	</p>
	
	<p>
		학원명 : ${ academy } <br> <!-- session 에 담았음 -->
		강의장 : ${ classRoom } <br> <!-- request 에 담았음 -->
		선생님 정보 : ${ teacher } <br>
		
		학생 정보
		<ul>
			<li>이름 : ${ student.name } </li>
			<li>나이 : ${ student.age } </li>
			<li>성별 : ${ student.gender }</li> <!-- 내부적으로 getter 메소드가 호출된 꼴 -->
		</ul>
	</p>
	
	<br><br>
	
	<hr>
	
	<h3>
		3. 단, EL 사용 시 내장 객체들에 저장된 키값이 동일할 경우 (특이케이스)
	</h3>
	
	scope 값 : ${ scope } <br> <!-- request -->
	
	<%--
		- EL 은 공유범위가 가장 작은 내장객체에서부터 해당 키갑을 검색함
		- 즉, ${ scope } 에 의해 내부적으로
		  page => request => session => application 순으로
		  해당 키값에 대한 응답 밸류값을 찾아줌!!
		- 각 내장 객체 종류마다 동일한 키값으로 밸류값을 담아두면,
		  그 중에서 제일 공유 범위가 작은 객체의 밸류값이 튀어나올 것!!
		- 만약 모든 영역에서 못찾은 경우?
		  아무것도 출력이 되지 않음!! (오류 등도 나지 않음)
	--%>
	
	<br><br>
	
	<hr>
	
	<h3>
		4. 직접 Scope 영역을 지정해서 값에 접근하기
	</h3>

	<%
		// pageScope 에 값 담기
		// > jsp 페이지 내에서만 사용 가능
		pageContext.setAttribute("scope", "page");
	%>
	
	pageScope 에 담긴 값 : ${ scope } 또는 ${ pageScope.scope } <br>
	<!-- pageContext.getAttribute("scope"); 구문이 실행되는 꼴 -->
	
	requestScope 에 담긴 값 : ${ requestScope.scope } <br>
	<!-- request.getAttribute("scope"); 구문이 실행되는 꼴 -->
	
	sessionScope 에 담긴 값 : ${ sessionScope.scope } <br>
	<!-- session.getAttriibute("scope"); 구문이 실행되는 꼴 -->

	applicationScope 에 담긴 값 : ${ applicationScope.scope } <br>
	<!-- application.getAttribute("scope"); 구문이 실행되는 꼴 -->
	
	<br><br>
	
	잘못된 접근 예시 : ${ sessionScope.classRoom } <br>
	<!-- session.getAttribute("classRoom"); 구문이 실행되는 꼴 -->
	
	- 아무것도 출력되지 않음, 오류조차 뜨지 않음!!
	
	<br><br>
	
	<hr>
	
	<b>
		- ${ teacher } 보다 ${ sessionScope.teacher } 처럼
		  스코프명.키값 형태로 명시적으로 적는 걸 더 권장한다!! <br>
		- 명시적으로 적으면 가독성이 높아지고 (해당 데이터가 정확히 어디에 담겨있었는지 한눈에 보이므로),
		  더 정확한 동작을 유도할 수 있게 되기 때문 (잘못하다간 내가 원하지 않는 값이 뽑혀올 수도 있으므로) <br>
		- 그냥 키값만 제시했을 경우에는 page ~ application 까지 전부 탐색하는 과정이 들어가기 때문에
		  은근히 성능에 영향을 줄 수 밖에 없음!! (불필요한 탐색 과정을 줄이기 위해)
	</b>

</body>
</html>






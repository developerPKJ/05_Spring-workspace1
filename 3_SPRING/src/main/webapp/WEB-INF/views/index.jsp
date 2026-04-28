<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<!-- 
		프레임워크
		- 개발자가 편리하게 개발할 수 있도록 제공되는 뼈대, 도구, 가이드라인
		- 소프트웨어 개발의 입장으로는 공통으로 사용하는 라이브러리, 개발도구, 인터페이스 등을 의미	
		
		프레임워크 필요성
		- 현재 웹 프로그래밍 규모가 매우 커짐
		- 거대하고 복잡한 프로젝트를 완성시키기 위해 많은 개발자가 필요
		- 많은 개발자들이 통일서 있고 빠르고 안정적으로 개발하기 위한 걸로 프레임워크가 좋은 성과를 보여줌
		- > 생산성 향상에 도움
		
		프레임워크 특징
		1. 프레임워크가 제공하는 가이드라인대로 설계하고 코딩
		- 환경설정 또한 마찬가지로 가이드라인이 제시한대로
		2. 개발할 수 있는 범위가 가이드라인에서 명시한 대로 정해져 있음
		3. 개발자를 위한 다양한 도구, 프러그인 들이 지원됨
		
		프레임워크 장단점
		- 장점 : 생산성 향상, 유지보수 용이, 코드 품질 향상, 개발자 간 협업 용이
		- 단점 : 프레임워크에 종속적, 프레임워크 없이 개발하는 것이 어려워짐, 학습 곡선 존재, 초기 세팅 어려움
		
		프레임워크 종류
		- 영속성 프레임워크 : 데이터 관련한 기능들을 제공하는 프레임워크 (ex. MyBatis, Hibernate)
		- 자바 프레임워크 : 웹 애플리케이션에 필요한 기능들을 제공하는 프레임워크 (ex. Spring, Spring Boot)
		- 화면구현 프레임워크 : 프론트엔드를 구현하기 위한 프레임워크 (ex. React, Bootstrap, Angular)
		- 기능 및 지원 프레임워크 : 특정 기능이나 업무 수행을 지원하는 프레임워크 (ex. JUnit, Log4j, Lombok)
		
		Spring 프레임워크
		- spring framework 없을 시 Controller 코드가 길고 많음
		- spring framework 사용 시 Controller 코드가 간결해짐
		
		1. Spring Legacy (구버전)
		2. Spring Boot (신버전)
            - Spring Boot는 Spring Legacy보다 더 간편하게 개발할 수 있도록 바뀜
            - 환경설정이 application.properties 파일 하나로 통합됨
            - Bean 등록 구문이 간단해짐(필요한 객체 자동으로 생성하기 쉬움)
            - 개발 시 필요한 기타 라이브러리들이 기본적으로 많이 내장됨 > 성능상 불리하긴 함
            - 프로젝트 내에 서버가 내장되어 있음(임베디드 서버)
            
        > 일부 특징만 다를 뿐 코드 작성 방식은 동일함
	 -->

	<h1>Spring 방식으로 요청 및 코드 작성해보기</h1>
	<!-- 스프링 문법 살펴보기 -->
	
	<h3>회원 가입</h3>
	<!-- 
		회원가입 버튼을 누르는 순간
		http://localhost:8888/spring/member/insert로 POST 방식으로 요청을 보내고 싶음
		
		절대 경로 방식 : action="/spring/member/insert"
		상대 경로 방식 : action="member/insert"
		(이 페이지가 보여질 때 url 주소 : http://localhost:8888/spring/)
	 -->
	 <form action="/spring/member/insert" method="post">
		<table>
			<tr>
				<th>아이디</th>
				<td>
					<input type="text" name="userId" required>
				</td>
			</tr>
			<tr>
				<th>비밀번호</th>
				<td>
					<input type="password" name="userPwd" required>
				</td>
			</tr>
			<tr>
				<th>이름</th>
				<td>
					<input type="text" name="userName" required>
				</td>
			</tr>
			<tr>
				<th>이메일</th>
				<td>
					<input type="email" name="email">
				</td>
			</tr>
			<tr>
				<th>성별</th>
				<td>
					<input type="radio" name="gender" value="M">남자
					<input type="radio" name="gender" value="F">여자
				</td>
			</tr>
			<tr>
				<th>취미</th>
				<td>
					<input type="checkbox" name="hobby" value="sports">스포츠
					<input type="checkbox" name="hobby" value="game">게임
					<input type="checkbox" name="hobby" value="hiking">등산
					<input type="checkbox" name="hobby" value="movie">영화
				</td>
			</tr>
			<tr>
				<th colspan="2">
					<button type="submit">회원가입</button>
					<button type="reset">초기화</button>
				</th>
			</tr>
		</table>
	 </form>
	
</body>
</html>
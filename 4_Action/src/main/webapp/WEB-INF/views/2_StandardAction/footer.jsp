<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.Date, java.text.SimpleDateFormat" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<%
		// 매년 해가 바뀔 때 마다 직접 년도를 바꾸는게 귀찮음!!
		
		String year = new SimpleDateFormat("yyyy").format(new Date());
	%>

	Copyright © 1998-<%= year %> KH Information Educational Institute All Right Reserved

	<br><br>
	
	전달받은 test 밸류값 : ${ param.test }
	
</body>
</html>
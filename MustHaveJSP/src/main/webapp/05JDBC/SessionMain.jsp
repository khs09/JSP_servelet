
<%@page import="java.sql.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<% 
SimpleDateFormat dateFormet = new SimpleDateFormat("HH:mm:ss");

long creationTime = session.getCreationTime();
String CrationTimeStr = dateFormat.format(new Date(creationTime));

long lastTime = session.getCreationTime();
String lastTimeStr = dateFormat.format(new Date(lastTime));
%>
	<head>
	<meta charset="UTF-8">
	<title>Session</title>
	</head>
	<body>
		<h2>Session 설정 확인</h2>
		<ul>
			<li>세션 유지 시간 : <%=session.getMaxInactiveInterval() %></li>
			<li>세션 아이디 : <%= session.getId() %></li>
			<li>최초 요청 시각 : <%=creationTimeStr %></li>
			<li>미지막 요청 시각 : <%= lastTimeStr %></li>
		</ul>
	</body>
</html>
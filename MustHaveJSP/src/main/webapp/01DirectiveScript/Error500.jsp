<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
	<meta charset="UTF-8">
	<title>Error500</title>
	</head>
	<body>
	<%
	int myage = Integer.parseInt(request.getParameter("age")) + 10;
	out.println("10년 후 당신의 나이는" + myage + "입니다.");
	%>
	</body>
</html>
<%@ page import= "common.Person"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head><title>request 영역</title>	</head>
	<body>
		<h2>포워드로 전달된 페이지</h2>
		<h4>Request Main 파일의 리퀘스트 영역 속성 읽기</h4>
		<%
		Person pPerson = (Person)(request.getAttribute("requestPerson"));
		%>
		<ul>
			<li>String 객체 : <%= request.getAttribute("requestPerson")%></li>
			<li>Person 객체 : <%= pPerson.getName() %>, <%= pPerson.getAge() %></li>
		</ul>
	</body>
</html>
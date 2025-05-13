<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>      
<!DOCTYPE html>
<html>
	<head>
	<meta charset="UTF-8">
	<title>JSTL - url</title>
	</head>
	<body>
		<h4>url 태그로 링크 걸기</h4>
		<c:url value="/11STL/inc/OtherPage.jsp"var="url">
			<c:param name="user_param1" value="Must"></c:param>
			<c:param name="user_param2">Have</c:param>
		</c:url>
		<a href="${ url }">OtherPage.jsp</a>
	</body>
</html>
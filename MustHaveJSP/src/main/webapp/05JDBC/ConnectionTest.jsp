<%@page import="common.DBConnPool"%>
<%@page import="common.JDBConnect"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
   <head>
   <meta charset="UTF-8">
   <title>JDBC</title>
   </head>
   <body>
      <h2>JDBC 테스트1</h2>
      <%
      JDBConnect jdbc1 = new JDBConnect();
      jdbc1.close();
      %>
      
      
      <h2>JDBC 테스트2</h2>
      <%
      String driver = application.getInitParameter("OracleDriver");
      String url = application.getInitParameter("OracleURL");
      String id = application.getInitParameter("OracleId");
      String pwd = application.getInitParameter("OraclePwd");
      
      JDBConnect jdbc2 = new JDBConnect(driver, url, id, pwd);
      jdbc2.close();
      %>
      
      <h2>JDBC 테스트 3</h2>
      <%
      JDBConnect jdbc3 = new JDBConnect(application);
      jdbc3.close();
      %>
      
      <h3>커넥션 풀 테스트</h3>
      <%
      DBConnPool pool = new DBConnPool();
      pool.close();
      %>
   </body>
</html>
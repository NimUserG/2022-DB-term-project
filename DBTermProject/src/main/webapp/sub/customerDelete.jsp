<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
Class.forName("oracle.jdbc.OracleDriver");
Connection conn = DriverManager.getConnection("jdbc:oracle:thin:@203.247.166.94:1521:xe", "DB201911990", "201911990");

String cusDel = request.getParameter("delete");
			
PreparedStatement pst = conn.prepareStatement("delete from contacts where customer_id=?");
pst.setInt(1, Integer.parseInt(cusDel));
int rowCount = pst.executeUpdate();

pst.close();
conn.close();
%>
</body>
</html>
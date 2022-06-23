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

String firstName = request.getParameter("firstName");
String lastName = request.getParameter("lastName");
String email = request.getParameter("email");
String phone = request.getParameter("phone");
			
PreparedStatement pst = conn.prepareStatement("update contacts set first_name=?, last_name=?, email=?, phone=?");
pst.setString(1, firstName);
pst.setString(2, lastName);
pst.setString(3, email);
pst.setString(4, phone);
int rowCount = pst.executeUpdate();

pst.close();
conn.close();
%>
업데이트 되었습니다.

<a onclick="" href="../index.jsp"> 확인 </a>

</body>
</html>
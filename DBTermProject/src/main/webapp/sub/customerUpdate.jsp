<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>고객 수정</title>
</head>
<body>
<%
Class.forName("oracle.jdbc.OracleDriver");
Connection conn = DriverManager.getConnection("jdbc:oracle:thin:@203.247.166.94:1521:xe", "DB201911990", "201911990");

String cusUp = request.getParameter("customerUpdate");
String firstName = request.getParameter("firstName");
String lastName = request.getParameter("lastName");
String email = request.getParameter("email");
String phone = request.getParameter("phone");
String name = request.getParameter("name");
String address = request.getParameter("address");
String website = request.getParameter("website");
String creditLimit = request.getParameter("creditLimit");
			
PreparedStatement pst = conn.prepareStatement("update contacts set first_name=?, last_name=?, email=?, phone=? where customer_id=?");
pst.setString(1, firstName);
pst.setString(2, lastName);
pst.setString(3, email);
pst.setString(4, phone);
pst.setInt(5, Integer.parseInt(cusUp));
pst.executeUpdate();
pst = conn.prepareStatement("update customers set name=?, address=?, website=?, credit_limit=? where customer_id=?");
pst.setString(1, name);
pst.setString(2, address);
pst.setString(3, website);
pst.setInt(4, Integer.parseInt(creditLimit));
pst.setInt(5, Integer.parseInt(cusUp));
int rowCount = pst.executeUpdate();

pst.close();
conn.close();
response.sendRedirect("../index.jsp");
%>
업데이트 되었습니다.

</body>
</html>
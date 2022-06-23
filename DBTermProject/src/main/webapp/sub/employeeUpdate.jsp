<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리 직원 수정</title>
</head>
<body>
<%
Class.forName("oracle.jdbc.OracleDriver");
Connection conn = DriverManager.getConnection("jdbc:oracle:thin:@203.247.166.94:1521:xe", "DB201911990", "201911990");

String empUp = request.getParameter("employeeUpdate");
String firstName = request.getParameter("firstName");
String lastName = request.getParameter("lastName");
String email = request.getParameter("email");
String phone = request.getParameter("phone");
String managerId = request.getParameter("managerId");
String jopTitle = request.getParameter("jopTitle");
			
PreparedStatement pst = conn.prepareStatement("update employees set first_name=?, last_name=?, email=?, phone=?, manager_id=?, job_title=? where employee_id=?");
pst.setString(1, firstName);
pst.setString(2, lastName);
pst.setString(3, email);
pst.setString(4, phone);
pst.setInt(5, Integer.parseInt(managerId));
pst.setString(6, jopTitle);
pst.setInt(7, Integer.parseInt(empUp));
int rowCount = pst.executeUpdate();

pst.close();
conn.close();
response.sendRedirect("../index.jsp");
%>
업데이트 되었습니다.

</body>
</html>
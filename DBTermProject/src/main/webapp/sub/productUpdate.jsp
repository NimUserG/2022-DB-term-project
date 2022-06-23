<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>제품 수정</title>
</head>
<body>
<%
Class.forName("oracle.jdbc.OracleDriver");
Connection conn = DriverManager.getConnection("jdbc:oracle:thin:@203.247.166.94:1521:xe", "DB201911990", "201911990");

String prdUp = request.getParameter("productUpdate");
String prdName = request.getParameter("productName");
String description = request.getParameter("description");
String standardCost = request.getParameter("standardCost");
String listPrice = request.getParameter("listPrice");
String catId = request.getParameter("categoryId");
			
PreparedStatement pst = conn.prepareStatement("update products set product_name=?, description=?, standard_cost=?, list_price=?, category_id=? where product_id=?");
pst.setString(1, prdName);
pst.setString(2, description);
pst.setInt(3, Integer.parseInt(standardCost));
pst.setInt(4, Integer.parseInt(listPrice));
pst.setInt(5, Integer.parseInt(catId));
pst.setInt(6, Integer.parseInt(prdUp));
int rowCount = pst.executeUpdate();

pst.close();
conn.close();
response.sendRedirect("../index.jsp");
%>
업데이트 되었습니다.

</body>
</html>
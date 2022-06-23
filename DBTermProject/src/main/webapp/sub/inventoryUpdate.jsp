<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>재고 수정</title>
</head>
<body>
<%
Class.forName("oracle.jdbc.OracleDriver");
Connection conn = DriverManager.getConnection("jdbc:oracle:thin:@203.247.166.94:1521:xe", "DB201911990", "201911990");

String invUp = request.getParameter("inventoryUpdate");
String prdId = request.getParameter("productId");
String wahId = request.getParameter("warehouseId");

			
PreparedStatement pst = conn.prepareStatement("update inventories set quantity=? where product_id=? and warehouse_id=?");
pst.setInt(1, Integer.parseInt(prdId));
pst.setInt(2, Integer.parseInt(wahId));
pst.setInt(3, Integer.parseInt(invUp));
int rowCount = pst.executeUpdate();

pst.close();
conn.close();
%>
업데이트 되었습니다.

</body>
</html>
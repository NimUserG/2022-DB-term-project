<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>재고상세정보</title>

<meta name="viewport"
	content="width=device-width, initial-scale=1, user-scalable=no" />
<link rel="stylesheet" href="assets/css/main.css" />
<link rel="stylesheet" href="assets/css/modal.css" />
</head>
<body class="is-preload">

		<!-- Main -->
		<div id="main">
			<%
			Class.forName("oracle.jdbc.OracleDriver");
            Connection conn = DriverManager.getConnection("jdbc:oracle:thin:@203.247.166.94:1521:xe", "DB201911990", "201911990");

            String prdIdInt = request.getParameter("product_id");
            String wahIdInt = request.getParameter("warehouse_id");
            PreparedStatement pst = conn.prepareStatement("select * from inventories where product_id=? and warehouse_id=? order by product_id");
            pst.setInt(1, Integer.parseInt(prdIdInt));
            pst.setInt(2, Integer.parseInt(wahIdInt));
            ResultSet rs = pst.executeQuery();

            rs.next();
			
            int prdId = rs.getInt("product_id");
			int wahId = rs.getInt("warehouse_id");
			int quantity = rs.getInt("quantity");
			%>
			<h1>재고 수량 수정</h1>
			<form action="sub/inventoryUpdate.jsp" method="post">
				제품 아이디<input type="text" name="productId" value="<%=prdId%>" readonly/><br>
				창고 아이디<input type="text" name="warehouseId" value="<%=wahId%>" readonly/><br>
				수량<input type="text" name="quantity" value="<%=quantity%>"><br>
				<button type="submit" name="productUpdate">수정</button>
			</form>	
			
		</div>
	</div>
</body>
</html>
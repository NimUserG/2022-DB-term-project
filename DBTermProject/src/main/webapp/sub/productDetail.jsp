<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>제품상세정보</title>

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

			String idInt = request.getParameter("product_id");
			PreparedStatement pst = conn.prepareStatement("select * from products natural join product_categories where product_id=? order by product_id");
            pst.setInt(1, Integer.parseInt(idInt));
            ResultSet rs = pst.executeQuery();

            rs.next();
            
            int prdId = rs.getInt("product_id");
			String prdName = rs.getString("product_name");
			String description = rs.getString("description");
			int standardCost = rs.getInt("standard_cost");
			int listPrice = rs.getInt("list_price");
			int catId = rs.getInt("category_id");
			String catName = rs.getString("category_name");
			%>
			<h1>제품 정보 수정</h1>
			<form action="sub/productUpdate.jsp" method="post">
				제품아이디<input type="text" value="<%=prdId%>" disabled/><br>
				제품이름<input type="text" name="productName" value="<%=prdName%>"><br>
				설명<input type="text" name="description" value="<%=description%>"><br>
				표준원가<input type="text" name="standardCost" value="<%=standardCost%>"><br>
				정가<input type="text" name="listPrice" value="<%=listPrice%>"><br>
				품목아이디<input type="text" name="categoryId" value="<%=catId%>"><br>
				<button type="submit" name="productUpdate" value=<%=idInt %>>수정</button>
			</form>	
			
			<form action="sub/productDelete.jsp" method="post">
				<button type="submit" name="productDelete" value=<%=idInt %>>삭제</button>
			</form>
			
		</div>
	</div>
</body>
</html>
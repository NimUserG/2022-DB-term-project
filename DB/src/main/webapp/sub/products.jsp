<%@ page language="java" contentType="text/html;charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>제품관리</title>

<meta name="viewport"
	content="width=device-width, initial-scale=1, user-scalable=no" />
<link rel="stylesheet" href="assets/css/main.css" />
</head>
<body class="is-preload">

	<!-- Wrapper -->
	<div id="wrapper">

		<!-- Main -->
		<div id="main">
			<!-- 검색 상자 -->
			<section id="search" class="alt">
				<form method="post" action="sub/products.jsp">
					<table>
						<tr>
						<td><select id="searchCondition" name="searchCondition">
								<option ${(param.searchCondition == "product_name")? "selected" : ""} value="product_name">제품 이름</option>
								<option ${(param.searchCondition == "category_name")? "selected" : ""} value="category_name">품목 이름</option>
							</select>
						<td><input type="text" id="searchKeyword" name="searchKeyword" value="${param.searchKeyword}"/></td>
						<td><input type="submit" id="searchButton" value="검색 "> <!-- main.css:1893 수정 --></td>
					</table>
				</form>
			</section>

			<!-- 테이블로 출력 -->
			<table id="productTable">
				<tr>
					<th>제품 아이디
					<th>제품 이름
					<th>설명
					<th>표준 원가
					<th>정가
					<th>품목 아이디
					<th>품목 이름
				</tr>

				<%
				Class.forName("oracle.jdbc.OracleDriver");
				Connection conn = DriverManager.getConnection("jdbc:oracle:thin:@203.247.166.94:1521:xe", "DB201911990", "201911990");

				String sc = request.getParameter("searchCondition");
				String sk = request.getParameter("searchKeyword");
				PreparedStatement pst = null;
				ResultSet rs = null;
				try {
					if (sc == null & sk == null) {
						pst = conn.prepareStatement("select * from products natural join product_categories order by product_id");
					} else {
						pst = conn.prepareStatement("select * from products natural join product_categories where " + sc + " like ? order by product_id");
						pst.setString(1, "%"+sk+"%");
					}
					rs = pst.executeQuery();
	
					while (rs.next()) {
						int prdId = rs.getInt("product_id");
						String prdName = rs.getString("product_name");
						String description = rs.getString("description");
						int standardCost = rs.getInt("standard_cost");
						int listPrice = rs.getInt("list_price");
						int catId = rs.getInt("category_id");
						String catName = rs.getString("category_name");
				%>
				<tr>
					<td><%=prdId%>
					<td><%=prdName%>
					<td><%=description%>
					<td><%=standardCost%>
					<td><%=listPrice%>
					<td><%=catId%>
					<td><%=catName%>
				</tr>
				<%
					}
				} catch(SQLException ex) {
					out.println(ex.getMessage());
					ex.printStackTrace();
				} finally {
					if (rs != null) try {rs.close();} catch(SQLException ex) {}
					if (pst != null) try {pst.close();} catch(SQLException ex) {}
					if (conn != null) try {conn.close();} catch(SQLException ex) {}
				}

				/*rs.close();
				pst.close();
				conn.close();*/
				%>

			</table>
		</div>
	</div>
	<!-- Scripts -->
	<script src="assets/js/library/browser-1.0.1.min.js"></script>
	<script src="assets/js/library/jquery-3.6.0.min.js"></script>
	<script src="assets/js/library/breakpoints-1.0.min.js"></script>
	<script src="assets/js/util.js"></script>
	<script src="assets/js/main.js"></script>

</body>
</html>
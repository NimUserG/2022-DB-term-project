<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>재고관리</title>

<meta name="viewport"
	content="width=device-width, initial-scale=1, user-scalable=no" />
<link rel="stylesheet" href="assets/css/main.css" />
</head>
<body class="is-preload">

	<!-- Wrapper -->
	<div id="wrapper">

		<!-- Main -->
		<div id="main">
			<div class="inner">

				<!-- Header -->
				<header id="header">
					<a href="products.jsp" class="logo"><strong>재고관리</strong> by 6조</a>
					<ul class="icons">
						<li><a href="#" class="icon brands fa-instagram"><span class="label">Instagram</span></a></li>
						<li><a href="#" class="icon brands fa-medium-m"><span class="label">Medium</span></a></li>
					</ul>
				</header>
			</div>
			<!-- 검색 상자 -->
			<section id="search" class="alt">
				<form method="post" action="inventories.jsp">
					<table>
						<td><select id="searchCondition" name="searchCondition">
								<option ${(param.searchCondition == "region_name")? "selected" : ""} value="region_name">지역 이름</option>
								<option ${(param.searchCondition == "product_name")? "selected" : ""} value="product_name">제품 이름</option>
								<option ${(param.searchCondition == "warehouse_name")? "selected" : ""} value="warehouse_name">창고 이름</option>
								<option ${(param.searchCondition == "country_name")? "selected" : ""} value="country_name">국가 이름</option>
							</select>
						<td><input type="text" id="searchKeyword" name="searchKeyword" value="${param.searchKeyword}"/>
						<td><input type="submit" id="searchButton" value="검색 "> <!-- main.css:1893 수정 -->
					</table>
				</form>
			</section>

			<!-- 테이블로 출력 -->
			<table "printTable">
				<tr>
					<th>제품 아이디
					<th>제품 이름
					<th>창고 이름
					<th>수량
					<th>지역 이름
					<th>국가 이름
					<th>주소
					<th>우편 번호
					<th>시
					<th>주
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
						pst = conn.prepareStatement("select * from products natural join inventories natural join warehouses natural join locations natural join countries natural join regions order by product_id");
					} else {
						pst = conn.prepareStatement("select * from products natural join inventories natural join warehouses natural join locations natural join countries natural join regions where " + sc + " like ? order by product_id");
						pst.setString(1, "%"+sk+"%");
					}
					rs = pst.executeQuery();
	
					while (rs.next()) {
						int prdId = rs.getInt("product_id");
						String prdName = rs.getString("product_name");
						String wahName = rs.getString("warehouse_name");
						int quantity = rs.getInt("quantity");
						String rgnName = rs.getString("region_name");
						String cntName = rs.getString("country_name");
						String address = rs.getString("address");
						String postal = rs.getString("postal_code");
						String city = rs.getString("city");
						String state = rs.getString("state");
				%>
				<tr>
					<td><%=prdId%>
					<td><%=prdName%>
					<td><%=wahName%>
					<td><%=quantity%>
					<td><%=rgnName%>
					<td><%=cntName%>
					<td><%=address%>
					<td><%=postal%>
					<td><%=city%>
					<td><%=state%>
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

		<!-- Sidebar -->
		<div id="sidebar">
			<div class="inner">
				<!-- Menu -->
				<nav id="menu">
					<header class="major">
						<h2>OT 전자제품 [관리자 페이지]</h2>
					</header>
					<ul>
						<li><a href="index.jsp">메인으로</a></li>
						<li><a href="customers.jsp">고객관리</a></li>
						<li><a href="orders.jsp">구매내역</a></li>
						<li><a href="inventories.jsp">재고관리</a></li>
						<li><a href="products.jsp">제품관리</a></li>
						<% if (request.isUserInRole("Manager")) {%>
						<li><a href="employees.jsp">직원관리</a></li>
						<%} %>
					</ul>
				</nav>
			</div>
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
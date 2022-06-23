<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.util.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>구매내역</title>

<meta name="viewport"
	content="width=device-width, initial-scale=1, user-scalable=no" />
<link rel="stylesheet" href="assets/css/main.css" />
<link rel="stylesheet" href="assets/css/modal.css" />
</head>
<body class="is-preload">

	<!-- Wrapper -->
	<div id="wrapper">

		<!-- Main -->
		<div id="sub_main" class="sub main">
		<h3>구매 내역</h3>
			<!-- 검색 상자 -->
			<section id="search" class="alt">
				<!--<form method="post" action="sub/orders.jsp">-->
					<table>
						<tr>
						<td><select id="searchCondition" name="searchCondition">
								<option ${(param.searchCondition == "customer_id")? "selected" : ""} value="customer_id">고객 아이디</option>
								<option ${(param.searchCondition == "name")? "selected" : ""} value="name">고객 이름</option>
							</select>
						<td><input type="text" id="searchKeyword" name="searchKeyword" value="${param.searchKeyword}"/></td>
						<td><input type="button" id="searchButton" value="검색" onclick="such('sub/orders.jsp')"></td>
						</tr>
					</table>
				<!-- </form> -->
			</section>

			<!-- 테이블로 출력 -->
			<table id="printTable">
				<tr>
					<th>고객 아이디</th>
					<th>고객 이름</th>
					<th>상태</th>
					<th>판매원 아이디</th>
					<th>주문 날짜</th>
					<th>제품 이름</th>
					<th>설명</th>
					<th>수량</th>
					<th>단가</th>
				</tr>

				<%
				Class.forName("oracle.jdbc.OracleDriver");
				Connection conn = DriverManager.getConnection("jdbc:oracle:thin:@203.247.166.94:1521:xe", "DB201911990", "201911990");

				String sc = request.getParameter("searchCondition");
				String sk = request.getParameter("searchKeyword");
				PreparedStatement pst = null;
				ResultSet rs = null;
				try {
					if (sc == null || sk == null || sc == "" || sk == "") {
						pst = conn.prepareStatement("select * from customers natural join orders natural join order_items natural join products order by customer_id");
					} else if (sc.equals("customer_id")) {
						pst = conn.prepareStatement("select * from customers natural join orders natural join order_items natural join products where " + sc + "=? order by customer_id");
						pst.setString(1, sk);
					} else {
						pst = conn.prepareStatement("select * from customers natural join orders natural join order_items natural join products where " + sc + " like ? order by customer_id");
						pst.setString(1, "%"+sk+"%");
					}
					rs = pst.executeQuery();
	
					while (rs.next()) {
						int cusId = rs.getInt("customer_id");
						String cusName = rs.getString("name");
						String status = rs.getString("status");
						int salId = rs.getInt("salesman_id");
						java.util.Date orderDate = rs.getDate("order_date");
						String prdName = rs.getString("product_name");
						String description = rs.getString("description");
						int quantity = rs.getInt("quantity");
						double unitPrice = rs.getDouble("unit_price");
				%>
				<tr>
					<td><%=cusId%>
					<td><%=cusName%>
					<td><%=status%>
					<td><%=salId%>
					<td><%=orderDate%>
					<td><%=prdName%>
					<td><%=description%>
					<td><%=quantity%>
					<td><%=unitPrice%>
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

</body>
</html>
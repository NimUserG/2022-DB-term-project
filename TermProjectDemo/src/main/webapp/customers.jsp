<%@ page language="java" contentType="text/html;charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>고객관리</title>

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
					<a href="customers.jsp" class="logo"><strong>고객관리</strong> by 6조</a>
					<ul class="icons">
						<li><a href="#" class="icon brands fa-instagram"><span class="label">Instagram</span></a></li>
						<li><a href="#" class="icon brands fa-medium-m"><span class="label">Medium</span></a></li>
					</ul>
				</header>
			</div>
			<!-- 검색 상자 -->
			<section id="search" class="alt">
				<form method="post" action="customers.jsp">
					<table>
						<td><select id="searchCondition" name="searchCondition">
								<option ${(param.searchCondition == "customer_id")? "selected" : ""} value="customer_id">아이디</option>
								<option ${(param.searchCondition == "name")? "selected" : ""} value="name">이름</option>
								<option ${(param.searchCondition == "address")? "selected" : ""} value="address">주소</option>
								<option ${(param.searchCondition == "website")? "selected" : ""} value="website">웹사이트</option>
								<option ${(param.searchCondition == "credit_limit")? "selected" : ""} value="credit_limit">신용 한도</option>
							</select>
						<td><input type="text" id="searchKeyword" name="searchKeyword" value="${param.searchKeyword}"/>
						<td><input type="submit" id="searchButton" value="검색 "> <!-- main.css:1893 수정 -->
					</table>
				</form>
			</section>

			<!-- 테이블로 출력 -->
			<table id="printTable">
				<tr>
					<th>고객 아이디
					<th>이름
					<th>주소
					<th>웹사이트
					<th>신용 한도
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
						pst = conn.prepareStatement("select * from customers order by customer_id");
					}
					else if (sc.equals("customer_id") || sc.equals("credit_limit")) {
						pst = conn.prepareStatement("select * from customers where " + sc + "=? order by customer_id");
						pst.setString(1, sk);
					} else {
						pst = conn.prepareStatement("select * from customers where " + sc + " like ? order by customer_id");
						pst.setString(1, "%"+sk+"%");
					}
					rs = pst.executeQuery();
	
					while (rs.next()) {
						int id = rs.getInt("customer_id");
						String name = rs.getString("name");
						String addr = rs.getString("address");
						String web = rs.getString("website");
						int credit = rs.getInt("credit_limit");
				%>
				<tr>
					<td><a href="customerDetail.jsp?customer_id=<%=id %>"><%=id%></a>
					<td><a href="customerDetail.jsp?customer_id=<%=id %>"><%=name%></a>
					<td><a href="customerDetail.jsp?customer_id=<%=id %>"><%=addr%></a>
					<td><a href="customerDetail.jsp?customer_id=<%=id %>"><%=web%></a>
					<td><a href="customerDetail.jsp?customer_id=<%=id %>"><%=credit%></a>
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
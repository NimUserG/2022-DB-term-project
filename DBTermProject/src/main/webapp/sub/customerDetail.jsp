<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>고객상세정보</title>

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
					<a href="index.jsp" class="logo"><strong>회원상세정보</strong> by 6조</a>
					<ul class="icons">
						<li><a href="#" class="icon brands fa-instagram"><span
								class="label">Instagram</span></a></li>
						<li><a href="#" class="icon brands fa-medium-m"><span
								class="label">Medium</span></a></li>
					</ul>
				</header>
			</div>

			<!-- 테이블로 출력 -->
			<table id="printTable">
				<tr>
					<th>연락 아이디
					<th>이름
					<th>성
					<th>이메일
					<th>전화번호
					<th>고객 아이디
				</tr>

				<%
				Class.forName("oracle.jdbc.OracleDriver");
				Connection conn = DriverManager.getConnection("jdbc:oracle:thin:@203.247.166.94:1521:xe", "DB201911990", "201911990");

				String idInt = request.getParameter("customer_id");
				PreparedStatement pst = conn.prepareStatement("select * from contacts natural join customers where customer_id=? order by contact_id");
				pst.setInt(1, Integer.parseInt(idInt));
				ResultSet rs = pst.executeQuery();

				while (rs.next()) {
					int conId = rs.getInt("contact_id");
					String firstName = rs.getString("first_name");
					String lastName = rs.getString("last_name");
					String email = rs.getString("email");
					String phone = rs.getString("phone");
					int cusId = rs.getInt("customer_id");
				%>
				<tr>
					<td><%=conId%>
					<td><%=firstName%>
					<td><%=lastName%>
					<td><%=email%>
					<td><%=phone%>
					<td><%=cusId%>
				</tr>
				<%
				}
				rs.close();
				//pst.close();
				//conn.close();
				%>
			</table> <br>
			
			<h1>고객 정보 수정</h1>
			<form action="customerUpdate.jsp" method="post">
				이름<input type="text" name="firstName"><br>
				성<input type="text" name="lastName"><br>
				이메일<input type="text" name="email"><br>
				전화번호<input type="text" name="phone"><br>
				<button type="submit">수정</button>
			</form>	
			
			<form action="customerDelete.jsp" method="post">
				<button type="submit" name="delete" value=<%=idInt %>>삭제</button>
			</form>
			
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
						<%
						if (request.isUserInRole("Manager")) {
						%>
						<li><a href="employees.jsp">직원관리</a></li>
						<%
						}
						%>
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

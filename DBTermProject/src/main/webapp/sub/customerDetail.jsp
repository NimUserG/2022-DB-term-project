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
<link rel="stylesheet" href="assets/css/modal.css" />
</head>
<body class="is-preload">

	<!-- Wrapper -->
	<div id="wrapper">

		<!-- Main -->
		<div id="main">
<!-- 			<div class="inner">

				
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
-->			

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
				전화 번호<input type="text" name="phone"><br>
				이름(name)<input type="text" name="name"><br>
				주소<input type="text" name="address"><br>
				웹사이트<input type="text" name="website"><br>
				신용 한도<input type="text" name="creditLimit"><br>
				<button type="submit" name="customerUpdate" value=<%=idInt %>>수정</button>
			</form>	
			
			<form action="customerDelete.jsp" method="post">
				<button type="submit" name="customerDelete" value=<%=idInt %>>삭제</button>
			</form>
			
		</div>
	</div>

	<!-- Scripts -->
	<script src="assets/js/library/browser-1.0.1.min.js"></script>
	<script src="assets/js/library/jquery-3.6.0.min.js"></script>
	<script src="assets/js/library/breakpoints-1.0.min.js"></script>
	<script src="assets/js/util.js"></script>
	<script src="assets/js/main.js"></script>
	<script src="assets/js/modal.js"></script>
	
</body>
</html>

<%@ page language="java" contentType="text/html;charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.util.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>직원관리</title>

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
					<a href="employees.jsp" class="logo"><strong>직원관리</strong> by 6조</a>
					<ul class="icons">
						<li><a href="#" class="icon brands fa-instagram"><span class="label">Instagram</span></a></li>
						<li><a href="#" class="icon brands fa-medium-m"><span class="label">Medium</span></a></li>
					</ul>
				</header>
			</div>
			<!-- 검색 상자 -->
			<section id="search" class="alt">
				<form method="post" action="employees.jsp">
					<table>
						<td><select id="searchCondition" name="searchCondition">
								<option ${(param.searchCondition == "employee_id")? "selected" : ""} value="employee_id">직원 아이디</option>
								<option ${(param.searchCondition == "manager_id")? "selected" : ""} value="manager_id">관리자 아이디</option>
								<option ${(param.searchCondition == "job_title")? "selected" : ""} value="job_title">직위</option>
							</select>
						<td><input type="text" id="searchKeyword" name="searchKeyword" value="${param.searchKeyword}"/>
						<td><input type="submit" id="searchButton" value="검색 "> <!-- main.css:1893 수정 -->
					</table>
				</form>
			</section>

			<!-- 테이블로 출력 -->
			<table id="employeeTable">
				<tr>
					<th>직원 아이디
					<th>이름
					<th>성
					<th>이메일
					<th>전화 번호
					<th>고용 날짜
					<th>관리자 아이디
					<th>직위
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
						pst = conn.prepareStatement("select * from employees order by employee_id");
					}
					else if (sc.equals("employee_id") || sc.equals("manager_id")) {
						pst = conn.prepareStatement("select * from employees where " + sc + "=? order by employee_id");
						pst.setString(1, sk);
					} else {
						pst = conn.prepareStatement("select * from employees where " + sc + " like ? order by employee_id");
						pst.setString(1, "%"+sk+"%");
					}
					rs = pst.executeQuery();
	
					while (rs.next()) {
						int empId = rs.getInt("employee_id");
						String firstName = rs.getString("first_name");
						String lastName = rs.getString("last_name");
						String email = rs.getString("email");
						String phone = rs.getString("phone");
						java.util.Date hireDate = rs.getDate("hire_date");
						int manId = rs.getInt("manager_id");
						String jobTitle = rs.getString("job_title");
				%>
				<tr>
					<td><%=empId%>
					<td><%=firstName%>
					<td><%=lastName%>
					<td><%=email%>
					<td><%=phone%>
					<td><%=hireDate%>
					<td><%=manId%>
					<td><%=jobTitle%>
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
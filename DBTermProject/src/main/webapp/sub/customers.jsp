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
<link rel="stylesheet" href="assets/css/modal.css" />
</head>
<body class="is-preload">

	<!-- Wrapper -->
	<div id="wrapper">

		<!-- Main -->
		<div id="sub_main" class="sub main">
		<h3>고객 정보</h3>
			<!-- 검색 상자 -->
			<section id="search" class="alt">
				<!--<form method="post" action="sub/customers.jsp">-->
					<table>
						<tr>
						<td><select id="searchCondition" name="searchCondition">
								<option ${(param.searchCondition == "customer_id")? "selected" : ""} value="customer_id">아이디</option>
								<option ${(param.searchCondition == "name")? "selected" : ""} value="name">이름</option>
								<option ${(param.searchCondition == "address")? "selected" : ""} value="address">주소</option>
								<option ${(param.searchCondition == "website")? "selected" : ""} value="website">웹사이트</option>
								<option ${(param.searchCondition == "credit_limit")? "selected" : ""} value="credit_limit">신용 한도</option>
							</select>
						<td><input type="text" id="searchKeyword" name="searchKeyword" value="${param.searchKeyword}"/></td>
						<td><input type="button" id="searchButton" value="검색" onclick="such('sub/customers.jsp')"></td>
						</tr>
					</table>
				<!-- </form> -->
			</section>

			<!-- 테이블로 출력 -->
			<table id="printTable">
				<tr>
					<th>고객 아이디</th>
					<th>이름</th>
					<th>주소</th>
					<th>웹사이트</th>
					<th>신용 한도</th>
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
				<tr id="sub/customerDetail.jsp?customer_id=<%=id%>" class="btn-modal" >
					<td><%=id%></td>
					<td><%=name%></td>
					<td><%=addr%></td>
					<td><%=web%></td>
					<td><%=credit%></td>
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
	<div id="modal" class="modal-overlay">
        <div class="modal-window">
            <div class="title">
                <h2></h2>
            </div>
            <div class="close-area">X</div>
            <div class="content">   
            </div>
        </div>
    </div>
			<!-- Scripts -->            
			<script src="http://code.jquery.com/jquery-latest.min.js"></script>
			<script src="assets/js/modal.js"></script>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>��������</title>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, user-scalable=no" />
<link rel="stylesheet" href="assets/css/main.css" />
</head>
<body class="is-preload">

	<!-- Wrapper -->
	<div id="wrapper">
		<!-- Main -->
		<div id="main">
			<!-- ���̺�� ��� -->
			<table id="customerDetailTable">
				<tr>
					<th>���� ���̵�
					<th>�̸�
					<th>��
					<th>�̸���
					<th>��ȭ��ȣ
					<th>�� ���̵�
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
				pst.close();
				conn.close();
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

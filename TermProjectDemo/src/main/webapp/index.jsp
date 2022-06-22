<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE HTML>
<html>
	<head>
		<title>������ǰ��OT</title>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
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
									<a href="index.jsp" class="logo"><strong>�����ڸ���</strong> by 6��</a>
									<ul class="icons">
										<li><a href="#" class="icon brands fa-instagram"><span class="label">Instagram</span></a></li>
										<li><a href="#" class="icon brands fa-medium-m"><span class="label">Medium</span></a></li>
									</ul>
								</header>
						</div>
					</div>

				<!-- Sidebar -->
					<div id="sidebar">
						<div class="inner">
							<!-- Menu -->
								<nav id="menu">
									<header class="major">
										<h2>OT ������ǰ [������ ������]</h2>
									</header>
									<ul>
										<li><a href="index.jsp">��������</a></li>
										<li><a href="customers.jsp">������</a></li>
										<li><a href="orders.jsp">���ų���</a></li>
										<li><a href="inventories.jsp">������</a></li>
										<li><a href="products.jsp">��ǰ����</a></li>
										<% if (request.isUserInRole("Manager")) {%>
										<li><a href="employees.jsp">��������</a></li> <!-- �޴��� ���Ѹ� �޴��� ���� -->
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

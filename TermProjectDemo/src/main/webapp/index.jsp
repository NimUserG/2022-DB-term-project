<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE HTML>
<html>
	<head>
		<title>전자제품은OT</title>
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
									<a href="index.jsp" class="logo"><strong>관리자메인</strong> by 6조</a>
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
										<h2>OT 전자제품 [관리자 페이지]</h2>
									</header>
									<ul>
										<li><a href="index.jsp">메인으로</a></li>
										<li><a href="customers.jsp">고객관리</a></li>
										<li><a href="orders.jsp">구매내역</a></li>
										<li><a href="inventories.jsp">재고관리</a></li>
										<li><a href="products.jsp">제품관리</a></li>
										<% if (request.isUserInRole("Manager")) {%>
										<li><a href="employees.jsp">직원관리</a></li> <!-- 메니저 권한만 메뉴가 보임 -->
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

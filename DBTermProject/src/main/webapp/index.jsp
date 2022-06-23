<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.util.*" %>
<%
	String uName = "";
	String uRole = "";
	if (request.isUserInRole("Manager")) {
		uRole = "매니저";
	} else {
		uRole = "일반사원";
	}
%>
<!DOCTYPE HTML>
<html>
	<head>
		<title>전자제품은OT</title><meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Bootstrap demo</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-0evHe/X+R7YkIZDRvuzKMRqM+OrBnVFBL6DOitfPri4tjfHxaWutUpFmBp4vmVor" crossorigin="anonymous">
		<link rel="stylesheet" href="assets/css/fontawesome-all.min.css">
        <link rel="stylesheet" href="assets/css/main.css" />
	</head>
	<body class="is-preload">
		
		<!-- Logo -->
			<div id="logo">
				<strong>[관리자용]</strong>
				<h1>OT 전자 제품</h1>
			</div>

		<!-- Wrapper -->
			<div id="wrapper">

				<!-- Main -->
					<div id="main" class="main">
                        
					</div>

				<!-- Sidebar -->
					<div id="sidebar">
						<div class="inner">
							<!-- Menu -->
								<nav id="menu">
									<header class="major">
										<a onclick="acyncMovePage('s.jsp')">
										<h1><%= uName %></h1>
										<i class="fas fa-user-alt fa-1x"></i><strong><%= uRole %></strong>
										</a>
									</header>
									<ul id="stanaerd_nav"> <!-- data 분리 --> </ul>
									<% if(uRole=="Manager"){ %>
                           			<ul id="manager_nav" class="ul_topline"> <!-- data 분리 --> </ul>
                        			<% } %>
									<ul id="sub">	
										<li><a href='logout.jsp'>
											<i class="fas fa-sign-out-alt fa-2x"></i>
											logout
										</a></li>
									</ul>
								</nav>
						</div>
					</div> 
			</div>

		<!-- Scripts -->
            <script src="http://code.jquery.com/jquery-latest.min.js"></script>
			<script src="assets/js/browser.min.js"></script>
			<script src="assets/js/breakpoints.min.js"></script>
			<script src="assets/js/util.js"></script>
            <script src="assets/js/main.js"></script>
            <script src="assets/js/menu.js"></script>
            <script src="assets/js/ajax.js"></script>
	</body>
</html>

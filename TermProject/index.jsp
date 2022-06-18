<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.util.*" %>
<% session.setAttribute("uRole", "매니저");
	session.setAttribute("uName", "최나경");
   //session.removeAttribute("uName");
	String s_uRole = (String)session.getAttribute("uRole");
	String s_uName = (String)session.getAttribute("uName"); %>
<!DOCTYPE HTML>
<html>
	<head>
		<title>전자제품은OT</title><meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Bootstrap demo</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-0evHe/X+R7YkIZDRvuzKMRqM+OrBnVFBL6DOitfPri4tjfHxaWutUpFmBp4vmVor" crossorigin="anonymous">
		<link rel="stylesheet" href="css/fontawesome-all.min.css">
        <link rel="stylesheet" href="css/main.css" />
	</head>
	<body class="is-preload">
		<!-- Logo -->
			<div id="user">
				<strong><%= s_uRole %></strong>
				<h1><%= s_uName %></h1>
			</div>

		<!-- Wrapper -->
			<div id="wrapper">

				<!-- Main -->
					<div id="main">
                        
					</div>

				<!-- Sidebar -->
					<div id="sidebar">
						<div class="inner">
							<!-- Menu -->
								<nav id="menu">
									<header class="major">
										<h1>OT 전자 제품</h1>
										<strong>[관리자용]</strong>
									</header>
									<ul id="nav"> <!-- data 분리 --> </ul>
									<ul id="login">
										<%
											if(s_uName == null){
										%>		
												<li><a onclick="acyncMovePage(login.jsp)">
													<i class="fas fa-sign-in-alt fa-2x"></i>
													login
												</a></li>
										<%
											} else {
										%>	
												<li><a onclick="acyncMovePage(logout.jsp)">
													<i class="fas fa-sign-out-alt fa-2x"></i>
													logout
												</a></li>
										<%		
											}
										%>
									</ul>
								</nav>
						</div>
					</div> 
			</div>

		<!-- Scripts -->
            <script src="http://code.jquery.com/jquery-latest.min.js"></script>
			<script src="js/browser.min.js"></script>
			<script src="js/breakpoints.min.js"></script>
			<script src="js/util.js"></script>
            <script src="js/main.js"></script>
            <script src="js/menu.js"></script>
	</body>
</html>

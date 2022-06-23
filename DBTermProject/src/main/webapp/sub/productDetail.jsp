<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>제품상세정보</title>

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
			<%
			String idInt = request.getParameter("product_id");
			%>
			<h1>제품 정보 수정</h1>
			<form action="productUpdate.jsp" method="post">
				제품 이름<input type="text" name="firstName"><br>
				설명<input type="text" name="lastName"><br>
				표준 원가<input type="text" name="email"><br>
				정가<input type="text" name="phone"><br>
				<button type="submit" name="productUpdate" value=<%=idInt %>>수정</button>
			</form>	
			
			<form action="productDelete.jsp" method="post">
				<button type="submit" name="productDelete" value=<%=idInt %>>삭제</button>
			</form>
			
		</div>
	</div>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>직원상세정보</title>

<meta name="viewport"
	content="width=device-width, initial-scale=1, user-scalable=no" />
<link rel="stylesheet" href="assets/css/main.css" />
<link rel="stylesheet" href="assets/css/modal.css" />
</head>
<body class="is-preload">

		<!-- Main -->
		<div id="main">
			<%
			Class.forName("oracle.jdbc.OracleDriver");
            Connection conn = DriverManager.getConnection("jdbc:oracle:thin:@203.247.166.94:1521:xe", "DB201911990", "201911990");
            
			String idInt = request.getParameter("employee_id");
			PreparedStatement pst = conn.prepareStatement("select * from employees where employee_id=? order by employee_id");
            pst.setInt(1, Integer.parseInt(idInt));
            ResultSet rs = pst.executeQuery();

            rs.next();
            
            int empId = rs.getInt("employee_id");
			String firstName = rs.getString("first_name");
			String lastName = rs.getString("last_name");
			String email = rs.getString("email");
			String phone = rs.getString("phone");
			int manId = rs.getInt("manager_id");
			String jobTitle = rs.getString("job_title");
			%>
			<h1>직원 정보 수정</h1>
			<form action="sub/employeeUpdate.jsp" method="post">
				직원아이디<input type="text" value="<%=empId%>" disabled/><br>
				이름<input type="text" name="firstName" value="<%=firstName%>"><br>
				성<input type="text" name="lastName" value="<%=lastName%>"><br>
				이메일<input type="text" name="email" value="<%=email%>"><br>
				전화번호<input type="text" name="phone" value="<%=phone%>"><br>
				관리자 아이디<input type="text" name="managerId" value="<%=manId%>"><br>
				직위<input type="text" name="jopTitle" value="<%=jobTitle%>"><br>
				<button type="submit" name="employeeUpdate" value=<%=idInt %>>수정</button>
			</form>	
			
		</div>
	</div>
</body>
</html>
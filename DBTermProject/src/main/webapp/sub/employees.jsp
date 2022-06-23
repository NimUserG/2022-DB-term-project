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
<link rel="stylesheet" href="assets/css/modal.css" />
</head>
<body class="is-preload">

	<!-- Wrapper -->
	<div id="wrapper">

		<!-- Main -->
		<div id="sub_main" class="sub main">
		<h3>직원 정보</h3>
			<!-- 검색 상자 -->
			<section id="search" class="alt">
				<!-- <form method="post" action="employees.jsp"> -->
					<table>
						<tr>
						<td><select id="searchCondition" name="searchCondition">
								<option ${(param.searchCondition == "employee_id")? "selected" : ""} value="employee_id">직원 아이디</option>
								<option ${(param.searchCondition == "manager_id")? "selected" : ""} value="manager_id">관리자 아이디</option>
								<option ${(param.searchCondition == "job_title")? "selected" : ""} value="job_title">직위</option>
							</select>
						</td>
						<td><input type="text" id="searchKeyword" name="searchKeyword" value="${param.searchKeyword}"/></td>
						<td><input type="button" id="searchButton" value="검색" onclick="such('sub/employees.jsp')"></td>					</table>
						</tr>
					</table>
				<!-- </form> -->
			</section>

			<!-- 테이블로 출력 -->
			<table id="printTable">
				<tr>
					<th>직원 아이디</th>
					<th>이름</th>
					<th>성</th>
					<th>이메일</th>
					<th>전화 번호</th>
					<th>고용 날짜</th>
					<th>관리자 아이디</th>
					<th>직위</th>
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
				<tr id="sub/employeeDetail.jsp?employee_id=<%=empId%>" class="btn-modal" >
					<td><%=empId%></td>
					<td><%=firstName%></td>
					<td><%=lastName%></td>
					<td><%=email%></td>
					<td><%=phone%></td>
					<td><%=hireDate%></td>
					<td><%=manId%></td>
					<td><%=jobTitle%></td>
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
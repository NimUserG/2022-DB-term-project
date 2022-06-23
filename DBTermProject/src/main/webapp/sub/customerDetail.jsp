<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>고객상세정보</title>

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

            String idInt = request.getParameter("customer_id");
            PreparedStatement pst = conn.prepareStatement("select * from contacts natural join customers where customer_id=? order by contact_id");
            pst.setInt(1, Integer.parseInt(idInt));
            ResultSet rs = pst.executeQuery();

            rs.next();
            
            int conId = rs.getInt("contact_id");
            String firstName = rs.getString("first_name");
            String lastName = rs.getString("last_name");
            String email = rs.getString("email");
            String phone = rs.getString("phone");
         	String name = rs.getString("name");
         	String addr = rs.getString("address");
         	String web = rs.getString("website");
         	int credit = rs.getInt("credit_limit");
            int cusId = rs.getInt("customer_id");
            %>
         
         <h1>고객 정보 수정</h1>
         <form action="sub/customerUpdate.jsp" method="post">
            고객아이디<input type="text" value="<%=cusId%>" disabled/><br>
            연락아이디<input type="text" value="<%=conId%>"disabled/><br>
            이름<input type="text" name="firstName" value="<%=firstName%>"><br>
            성<input type="text" name="lastName" value="<%=lastName%>"><br>
            이메일<input type="text" name="email" value="<%=email%>"><br>
            전화 번호<input type="text" name="phone" value="<%=phone%>"><br>
            이름(name)<input type="text" name="name" value="<%=name%>"><br>
            주소<input type="text" name="address" value="<%=addr%>"><br>
            웹사이트<input type="text" name="website" value="<%=web%>"><br>
            신용 한도<input type="text" name="creditLimit" value="<%=credit%>"><br>
            <button type="submit" name="customerUpdate" value="<%=idInt%>">수정</button>
         </form>   
         
         <form action="sub/customerDelete.jsp" method="post">
            <button type="submit" name="customerDelete" value=<%=idInt %>>삭제</button>
         </form>
         
      </div>
   </div>

   <!-- Scripts -->
   <script src="assets/js/library/browser-1.0.1.min.js"></script>
   <script src="assets/js/library/jquery-3.6.0.min.js"></script>
   <script src="assets/js/library/breakpoints-1.0.min.js"></script>
   <script src="assets/js/util.js"></script>
   <script src="assets/js/main.js"></script>
   <script src="assets/js/modal.js"></script>
   
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE HTML>
<html>
	<head>
		<link rel="stylesheet" href="assets/css/sub.css" />
	</head>
    <body>
	    <!-- Wrapper -->
		<div id="wrapper">
			<!-- Main -->
			<div id="sub_main" class="sub main">
				<table>
					<tr>
						<td>
				<button class="btn btn_big" onclick="acyncMovePage('sub/customers.jsp')">
					<i class="fas fa-user-alt fa-8x"></i><br><br>
					고객관리
				</button>
						</td>
						<td>
				<button class="btn btn_big" onclick="acyncMovePage('sub/orders.jsp')">
					<i class="fas fa-th-list fa-8x"></i><br><br>
					구매내역
				</button>
						</td>
						<td>
				<button class="btn btn_big" onclick="acyncMovePage('sub/products.jsp')">
					<i class="fas fa-box fa-8x"></i><br><br>
					제품관리
				</button>
						</td>
						<td>
				<button class="btn btn_big" onclick="acyncMovePage('sub/inventories.jsp')">
					<i class="fas fa-warehouse fa-8x"></i><br><br>
					재고관리
				</button>
						</td>
					</tr>
				</table>
			</div>
		</div>
    </body>
</html>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!doctype html>
<html lang="en">

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<head>
<c:import url="/sharedViews/headMeta.jsp" />
<title>Orders</title>
</head>

<body>
	<c:import url="/sharedViews/header.jsp" />
	
	<div class="container home">
		<div class="row">
			<div class="col-md-12">
				
				<a href="resupply"><button class="headerButton btn">New Order</button></a>
				<a href="adminCart"><button class="headerButton btn">Cart</button></a>
				<a href="adminOrders"><button class="headerButton btn">View History</button></a>
				<a href="logout"><button class="headerButton btn">Log Out</button></a>
				<h1>Order History</h1>
			</div>
		</div>
	</div>

	<div class="container home">

		<table class="table">
			<thead>
				<tr>
					<th scope="col">Order #</th>
					<th scope="col">Product ID</th>
					<th scope="col">Quantity</th>
					<th scope="col">Status</th>

				</tr>
			</thead>
			<tbody>

				<c:forEach items="${adminOrder }" var="adminOrder">
					<tr>
						<td>${adminOrder.orderId }</td>
						<td>${adminOrder.productId }</td>
						<td>${adminOrder.quantity }</td>
						<td>${adminOrder.status }</td>	
					</tr>
				</c:forEach>
 
<%-- 				<c:forEach var="entry" items="${ordersHash}"> --%>
<%-- 					<c:forEach var="orderDetails" items="${entry.value}" --%>
<%-- 						varStatus="loop"> --%>
<!-- 						<tr> -->
<%-- 							<c:if test="${loop.index == 0}"> --%>
<%-- 								<td rowspan="${entry.value.size()}" style="border-right:1px solid #dee2e6; vertical-align: middle; font-weight: bold;">${orderDetails.orderId}</td> --%>
<%-- 							</c:if> --%>
<%-- 							<td>${orderDetails.productName}</td> --%>
<%-- 							<td>${orderDetails.price}</td> --%>
<%-- 							<td>${orderDetails.quantity}</td> --%>
<%-- 							<td>${orderDetails.productCurrencyFormat}</td> --%>
<!-- 							<td>Processing</td> -->
<%-- 							<c:if test="${loop.index == 0}"> --%>
<%-- 								<td rowspan="${entry.value.size()}" style="border-left:1px solid #dee2e6; vertical-align: middle; font-weight: bold;">${orderDetails.orderCurrencyFormat}</td> --%>
<%-- 							</c:if> --%>

<!-- 						</tr> -->
<%-- 					</c:forEach> --%>
<%-- 				</c:forEach> --%>
			</tbody>
		</table>
	</div>

	<c:import url="/sharedViews/footer.jsp" />
	<c:import url="/sharedViews/scripts.jsp" />

</body>

</html>
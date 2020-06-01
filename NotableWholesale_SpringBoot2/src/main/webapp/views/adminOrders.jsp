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
	<c:import url="/sharedViews/adminHeader.jsp" />
	
	<div class="container home">
		<div class="row">
			<div class="col-md-12">
				
				<a href="resupply"><button class="headerButton btn">New Order</button></a>
				<a href="adminCart"><button class="headerButton btn">Cart</button></a>
				<a href="adminOrders"><button class="headerButton btn">View History</button></a>
				<a href="logout"><button class="headerButton btn">Log Out</button></a>
				
			</div>
		</div>
	</div>

<c:if test="${adminOrder.isEmpty() }">
<p class="center">There are no orders</p>
</c:if>

<c:if test="${!adminOrder.isEmpty() }">
	<div class="container home">

		<table class="table">
			<thead>
				<tr>
					<th scope="col">Order #</th>
					<th scope="col">Product ID</th>
					<th scope="col">Name</th>
					<th scope="col">Quantity</th>
					<th scope="col">Status</th>
					<th scope="col">Expected Fulfillment Date</th>

				</tr>
			</thead>
			<tbody>

				<c:forEach items="${adminOrder }" var="adminOrder">
					<tr>
						<td>${adminOrder.orderId }</td>
						<td>${adminOrder.productId }</td>
						<td>${adminOrder.name }</td>
						<td>${adminOrder.quantity }</td>
						
						<c:choose>
							<c:when test="${adminOrder.status == 'Processing'}">
								<td>${adminOrder.status }</td>
								<td>6/02/20</td>
							</c:when>
							<c:when test="${adminOrder.status == 'Complete'}">
								<td>${adminOrder.status } - 6/01/20</td>
								<td>-</td>
							</c:when>
						</c:choose>
							
					</tr>
				</c:forEach>
 
			</tbody>
		</table>
	</div>
</c:if>

	<c:import url="/sharedViews/adminFooter.jsp" />
	<c:import url="/sharedViews/scripts.jsp" />

</body>

</html>
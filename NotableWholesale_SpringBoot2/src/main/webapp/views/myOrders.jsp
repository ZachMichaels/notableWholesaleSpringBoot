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
		<h1>My Orders</h1>

		<table class="table">
			<thead>
				<tr>
					<th scope="col">Order#</th>
					<th scope="col">Product</th>
					<th scope="col">Price</th>
					<th scope="col">Quantity</th>
					<th scope="col">Product Total</th>
					<th scope="col">Order Total</th>
					<th scope="col">Order Status</th>
				</tr>
			</thead>
			<tbody>

				<%-- <c:forEach items="${orderDetails }" var="orderDetails">
					<tr>
						<td>${orderDetails.orderId }</td>
						<td>${orderDetails.productName }</td>
						<td>${orderDetails.price }</td>
						<td>${orderDetails.quantity }</td>
						<td>${orderDetails.productCurrencyFormat }</td>
						<td>${orderDetails.orderCurrencyFormat }</td>
						<td>Processing</td>
					</tr>
				</c:forEach>
 --%>
				<c:forEach var="entry" items="${ordersHash}">
					<c:forEach var="orderDetails" items="${entry.value}"
						varStatus="loop">
						<tr>
							<c:if test="${loop.index == 0}">
								<td rowspan="${entry.value.size()}">${orderDetails.orderId}</td>
							</c:if>
							<td>${orderDetails.productName}</td>
							<td>${orderDetails.price}</td>
							<td>${orderDetails.quantity}</td>
							<td>${orderDetails.productCurrencyFormat}</td>
							<td>Processing</td>
							<c:if test="${loop.index == 0}">
								<td rowspan="${entry.value.size()}">${orderDetails.orderCurrencyFormat}</td>
							</c:if>

						</tr>
					</c:forEach>
				</c:forEach>
			</tbody>
		</table>
	</div>

	<c:import url="/sharedViews/footer.jsp" />
	<c:import url="/sharedViews/scripts.jsp" />

</body>

</html>
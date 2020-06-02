<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="java.util.Date"%>
<!doctype html>
<html lang="en">

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>




<head>
<c:import url="/sharedViews/headMeta.jsp" />
<title>Orders</title>
</head>

<body>
	<c:import url="/sharedViews/adminHeader.jsp" />

	<div class="container home">
		<div class="row">
			<div class="col-md-12">

				<a href="resupply"><button class="headerButton btn">New
						Order</button></a> <a href="adminCart"><button class="headerButton btn">Cart</button></a>
				<a href="adminOrders"><button class="headerButton btn">View
						History</button></a> <a href="logout"><button class="headerButton btn">Log
						Out</button></a>

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
						<c:set var="tomorrow" value="<%=new Date(new Date().getTime() + 60*60*24*1000)%>"/>
						<c:set var="today" value="<%=new Date()%>"/>
					</tr>
				</thead>
				<tbody>

					<%-- 				<c:forEach items="${adminOrder }" var="adminOrder">
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
				</c:forEach> --%>

					<c:forEach var="entry" items="${adminOrdersHash}">
						<c:forEach var="adminOrder" items="${entry.value}"
							varStatus="loop">
							<tr>
								<c:if test="${loop.index == 0}">
									<td rowspan="${entry.value.size()}"
										style="border-right: 1px solid #dee2e6; vertical-align: middle; font-weight: bold;">${adminOrder.orderId}</td>
								</c:if>

								<td>${adminOrder.productId}</td>
								<td>${adminOrder.name}</td>
								<td>${adminOrder.quantity}</td>

								<c:choose>
									<c:when test="${adminOrder.status == 'Processing'}">
										<c:if test="${loop.index == 0}">
											<td rowspan="${entry.value.size()}"
												style="border-left: 1px solid #dee2e6; vertical-align: middle; font-weight: bold;">${adminOrder.status}</td>
										</c:if>
										<c:if test="${loop.index == 0}">
											<td rowspan="${entry.value.size()}"
												style="border-left: 1px solid #dee2e6; vertical-align: middle; font-weight: bold;">
												<fmt:formatDate type="date" value="${tomorrow}" pattern="MM/dd/yyyy"/>
											</td>
										</c:if>
									</c:when>
									<c:when test="${adminOrder.status == 'Complete'}">
										<c:if test="${loop.index == 0}">
											<td rowspan="${entry.value.size()}"
<%-- 												colspan="${entry.value.size()}" --%>
												style="border-left: 1px solid #dee2e6; vertical-align: middle; font-weight: bold;">
												${adminOrder.status} - <fmt:formatDate type="date" value="${today}" pattern="MM/dd/yyyy"/>
												</td>
										</c:if>
											<c:if test="${loop.index == 0}">
											<td rowspan="${entry.value.size()}"
												style="border-left: 1px solid #dee2e6; vertical-align: middle; font-weight: bold;"> - </td>
										</c:if>
							
									</c:when>
								</c:choose>


							</tr>
						</c:forEach>
					</c:forEach>

				</tbody>
			</table>
		</div>
	</c:if>

	<c:import url="/sharedViews/adminFooter.jsp" />
	<c:import url="/sharedViews/scripts.jsp" />

</body>

</html>
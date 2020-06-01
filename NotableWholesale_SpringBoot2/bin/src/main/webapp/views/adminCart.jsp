<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!doctype html>
<html lang="en">

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<head>
	<c:import url="/sharedViews/headMeta.jsp" />
	<title>Cart</title>
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
	
  <c:if test="${cookie.loggedInCookie.value == 'yes'}">
	<div class="container home">
		<div class="card">
			<h1 align="center">Admin Cart</h1>
			  <c:if test="${failedOrder != null }">
  				Your Previous Transaction was unsuccessful due to inventory constraints. We apologize for the inconvenience.
  			  </c:if>
			<c:choose>
				<c:when test="${adminCart == null}">
					<p>Your cart is empty.</p>
				</c:when>
				<c:otherwise>
					<table align="center">
						<tr>
							<th class="cartTD">Qty</th>
							<th class="cartTD">Name</th>
							<th>&nbsp;</th>
						</tr>
															
				       <c:forEach var="item" items="${adminCart.items}">
			            <tr class="cart_row">
			              <td>
			                <form action="<c:url value='updateItem'/>" method="post">
							  <input type="hidden" name="id" value="<c:out value='${item.product.productId }'/>">
							  <input type="hidden" name="name" value="<c:out value='${item.product.name}'/>">
							  <input type="hidden" name="price" value="<c:out value='${item.product.price}'/>">
			                  <input type="number" name='${item.product.name}' class="cartQuantity" min="1" max="100" value="<c:out value='${item.quantity}'/>" id="quantity">                         
			                  <input type="submit" class="headerButton btn" name = "action" value="Update">
			                </form>                  
			              </td>
						
						
						
						<td class="cartTD">${item.product.name}</td>
						<td class = "cartTD">
			                <form action="<c:url value='removeItem'/>" method="post">
							  <input type="hidden" name="id" value="<c:out value='${item.product.productId }'/>">
			                  <input type="hidden" name="name" value="<c:out value='${item.product.name}'/>">
			                  <input type="hidden" name="quantity" value ='${item.quantity }'/>
			                  <input type="submit" class="headerButton btn" name= "action" value="Remove">

							</form>
						</td>
					</tr>
				</c:forEach>


					</table>
					<p align="center">
						<a href="adminSubmitOrder"><input type="submit"
							class="headerButton btn" name="checkout" value="Place Order"></a>
					</p>
				</c:otherwise>
			</c:choose>
		</div>
	</div>



	</c:if>


	<c:if test="${cookie.loggedInCookie.value != 'yes'}">
		<p style="text-align:center;">Please sign in to view your cart</p>
	</c:if>
	<c:import url="/sharedViews/adminFooter.jsp" />
	<c:import url="/sharedViews/scripts.jsp" />

</body>

</html>
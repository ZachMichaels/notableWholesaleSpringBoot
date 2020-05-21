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
  <c:import url="/sharedViews/header.jsp" />
  <c:if test="${cookie.loggedInCookie.value == 'yes'}">
	<div class="container home">
		<div class="card">
			<h1 align="center">Cart</h1>
			  <c:if test="${failedOrder != null }">
  				Your Previous Transaction was unsuccessful due to inventory constraints. We apologize for the inconvenience.
  			  </c:if>
			<c:choose>
				<c:when test="${cart == null}">
					<p>Your cart is empty.</p>
				</c:when>
				<c:otherwise>
					<table align="center">
						<tr>
							<th class="cartTD">Qty</th>
							<th class="cartTD">Name</th>
							<th class="cartTD">Price</th>
							<th class="cartTD">Amount</th>
							<th>&nbsp;</th>
						</tr>
						
						
											
				       <c:forEach var="item" items="${cart.items}">
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
						<td class="cartTD">${item.product.priceCurrencyFormat}</td>
						<td class="cartTD">${item.totalCurrencyFormat}</td>
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
					<p align="center"><strong>Total Price: ${cart.priceCurrencyFormat }</strong></p>
					<p align="center">
						<a href="checkout"><input type="submit"
							class="headerButton btn" name="checkout" value="Checkout"></a>
					</p>
				</c:otherwise>
			</c:choose>
		</div>
	</div>


	</c:if>


	<c:if test="${cookie.loggedInCookie.value != 'yes'}">
		<p style="text-align:center;">Please sign in to view your cart</p>
	</c:if>
	<c:import url="/sharedViews/footer.jsp" />
	<c:import url="/sharedViews/scripts.jsp" />

</body>

</html>
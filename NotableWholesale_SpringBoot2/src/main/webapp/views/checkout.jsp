<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!doctype html>
<html lang="en">

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<head>
<c:import url="/sharedViews/headMeta.jsp" />
<title>Checkout</title>
</head>

<body>
  	<c:import url="/sharedViews/header.jsp" />

	<c:if test="${cookie.loggedInCookie.value == 'yes'}" />
	<div class="container home">
		<div class="row">
			<div
				class="col-xs-12 col-md-8 col-md-offset-2 col-lg-6 col-lg-offset-3 col-xl-4 col-xl-offset-4">
				<div class="container" id="nwContainer">
					<div class="card" id="nwCard">
						<h1>Cart</h1>
						<div class="container-fluid" id="nwContainer">
							<c:choose>
								<c:when test="${emptyCart != null}">
									<p>Your cart is empty.</p>
								</c:when>
								<c:when test="${cart == null}">
									<p>Your cart is empty.</p>
								</c:when>
								<c:otherwise>
									<table>
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
													<form action="<c:url value='cart'/>" method="post">
														<input type="hidden" name="name"
															value="<c:out value='${item.product.name}'/>"> <input
															type="number" name='${item.product.name}'
															class="cartQuantity" min="1" max="100"
															value="<c:out value='${item.quantity}'/>" id="quantity">
														<input type="submit" class="headerButton btn" name="action" value="Update">
													</form>
												</td>
												<td class="cartTD">${item.product.name}</td>
												<td class="cartTD">${item.product.priceCurrencyFormat}</td>
												<td class="cartTD">${item.totalCurrencyFormat}</td>
												<td>
													<form action="<c:url value='cart'/>" method="post">
														<input type="hidden" name="name"
															value="<c:out value='${item.product.name}'/>"> <input
															type="submit" class="headerButton btn" name="action"
															value="Remove">
													</form>
												</td>
											</tr>
										</c:forEach>
									</table>
								</c:otherwise>
							</c:choose>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

	<div id="pricing">
      <p id="shipping">
        <strong>Shipping</strong>: <span id="sshipping"></span>
      </p>

      <p id="sub-total">
        <strong>Total</strong>: <span id="stotal"></span>
      </p>
    </div>

    <form action="order.jsp" method="post" id="checkout-order-form">
      <h2>Your Details</h2>
      <fieldset id="fieldset-billing">
        <legend>Billing</legend>
        <!-- Name, Email, City, Address, ZIP Code, Country (select box) -->

        <div>
          <label for="name">Name</label>
          <input type="text" name="name" id="name" data-type="string" data-message="This field may not be empty" />
        </div>

        <div>
          <label for="email">Email</label>
          <input type="text" name="email" id="email" data-type="expression" data-message="Not a valid email address" />
        </div>

        <div>
          <label for="city">City</label>
          <input type="text" name="city" id="city" data-type="string" data-message="This field may not be empty" />
        </div>

        <div>
          <label for="address">Address</label>
          <input type="text" name="address" id="address" data-type="string" data-message="This field may not be empty" />
        </div>

        <div>
          <label for="zip">ZIP Code</label>
          <input type="text" name="zip" id="zip" data-type="string" data-message="This field may not be empty" />
        </div>

        <div>
          <label for="country">Country</label>
          <select name="country" id="country" data-type="string" data-message="This field may not be empty">
            <option value="">Select</option>
            <option value="US">USA</option>
            <option value="IT">Italy</option>
          </select>
        </div>
      </fieldset>

      <div id="shipping-same">Same as Billing <input type="checkbox" id="same-as-billing" value="" /></div>

      <fieldset id="fieldset-shipping">
        <legend>Shipping</legend>
        <!-- Same fields as billing -->
      </fieldset>

      <p><input type="submit" id="submit-order" value="Submit" class="btn" /></p>

    </form>

    <c:import url="/sharedViews/footer.jsp" />
	<c:import url="/sharedViews/scripts.jsp" />

</body>

</html>
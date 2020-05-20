<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!doctype html>
<html lang="en">

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<head>
<c:import url="/sharedViews/headMeta.jsp" />
<title>Checkout</title>
</head>

<body>
	<c:import url="/sharedViews/header.jsp" />

	<div class="container">
		<div class="text-center">
			<h2>Checkout form</h2>
		</div>

		<div class="row">
			<div class="col-md-4 order-md-2 mb-4">
				<h4 class="d-flex justify-content-between align-items-center mb-3">
					<span class="text-muted">Your cart</span> 
<!-- 					<span class="badge badge-secondary badge-pill">3</span> -->
				</h4>
				<ul class="list-group mb-3 card">

					<c:forEach var="item" items="${cart.items}">
						<li
							class="list-group-item d-flex justify-content-between lh-condensed">
							<div>
								<h6 class="my-0">${item.product.name} <span class="text-muted"></span></h6>
							</div> <span>${item.product.priceCurrencyFormat} x ${item.quantity } = <strong>$${item.product.price * item.quantity}</strong></span>
						</li>
					</c:forEach>

					<li class="list-group-item d-flex justify-content-between bg-light">
						<div class="text-success">
							<h6 class="my-0">Promo code</h6>
							<small>For Calvin only</small>
						</div> <span class="text-success">-$0</span>
					</li>
					<li class="list-group-item d-flex justify-content-between"><span>Total
							(USD)</span> <strong>${cart.priceCurrencyFormat }</strong></li>
				</ul>

				<form class="card p-2">
					<div class="input-group">
						<input type="text" class="form-control" placeholder="Promo code">
						<div class="input-group-append">
							<button type="submit" class="btn headerButton">Redeem</button>
						</div>
					</div>
				</form>
			</div>
			<div class="col-md-8 order-md-1">
				<h4 class="mb-3">Billing address</h4>
				<form class="needs-validation" novalidate action="purchase" method="Post">
					<div class="row">
						<div class="col-md-6 mb-3">
							<label for="firstName">First name</label> <input type="text"
								class="form-control" id="firstName" placeholder=""
								value="${users.get(0).firstName }" required>
							<div class="invalid-feedback">Valid first name is required.
							</div>
						</div>
						<div class="col-md-6 mb-3">
							<label for="lastName">Last name</label> <input type="text"
								class="form-control" id="lastName" placeholder=""
								value="${users.get(0).lastName }" required>
							<div class="invalid-feedback">Valid last name is required.
							</div>
						</div>
					</div>



					<div class="mb-3">
						<label for="email">Email</label> <input type="email"
							class="form-control" id="email" value="${users.get(0).email }">
						<div class="invalid-feedback">Please enter a valid email
							address for shipping updates.</div>
					</div>

					<div class="mb-3">
						<label for="address">Address</label> <input type="text"
							class="form-control" id="address" value="${users.get(0).street }"
							required>
						<div class="invalid-feedback">Please enter your shipping
							address.</div>
					</div>

					<div class="row">
<!-- 						<div class="col-md-5 mb-3"> -->
<!-- 							<label for="country">Country</label> <select -->
<!-- 								class="custom-select d-block w-100" id="country" required> -->
<!-- 								<option value="">Choose...</option> -->
<!-- 								<option>United States</option> -->
<!-- 							</select> -->
<!-- 							<div class="invalid-feedback">Please select a valid -->
<!-- 								country.</div> -->
<!-- 						</div> -->
						
						
<!-- 						<div class="col-md-4 mb-3"> -->
<!-- 							<label for="state">State</label> <select -->
<!-- 								class="custom-select d-block w-100" id="state" required> -->
<!-- 								<option value="">Choose...</option> -->
<!-- 								<option value="AL">Alabama</option> -->
<!-- 								<option value="AK">Alaska</option> -->
<!-- 								<option value="AZ">Arizona</option> -->
<!-- 								<option value="AR">Arkansas</option> -->
<!-- 								<option value="CA">California</option> -->
<!-- 								<option value="CO">Colorado</option> -->
<!-- 								<option value="CT">Connecticut</option> -->
<!-- 								<option value="DE">Delaware</option> -->
<!-- 								<option value="DC">District Of Columbia</option> -->
<!-- 								<option value="FL">Florida</option> -->
<!-- 								<option value="GA">Georgia</option> -->
<!-- 								<option value="HI">Hawaii</option> -->
<!-- 								<option value="ID">Idaho</option> -->
<!-- 								<option value="IL">Illinois</option> -->
<!-- 								<option value="IN">Indiana</option> -->
<!-- 								<option value="IA">Iowa</option> -->
<!-- 								<option value="KS">Kansas</option> -->
<!-- 								<option value="KY">Kentucky</option> -->
<!-- 								<option value="LA">Louisiana</option> -->
<!-- 								<option value="ME">Maine</option> -->
<!-- 								<option value="MD">Maryland</option> -->
<!-- 								<option value="MA">Massachusetts</option> -->
<!-- 								<option value="MI">Michigan</option> -->
<!-- 								<option value="MN">Minnesota</option> -->
<!-- 								<option value="MS">Mississippi</option> -->
<!-- 								<option value="MO">Missouri</option> -->
<!-- 								<option value="MT">Montana</option> -->
<!-- 								<option value="NE">Nebraska</option> -->
<!-- 								<option value="NV">Nevada</option> -->
<!-- 								<option value="NH">New Hampshire</option> -->
<!-- 								<option value="NJ">New Jersey</option> -->
<!-- 								<option value="NM">New Mexico</option> -->
<!-- 								<option value="NY">New York</option> -->
<!-- 								<option value="NC">North Carolina</option> -->
<!-- 								<option value="ND">North Dakota</option> -->
<!-- 								<option value="OH">Ohio</option> -->
<!-- 								<option value="OK">Oklahoma</option> -->
<!-- 								<option value="OR">Oregon</option> -->
<!-- 								<option value="PA">Pennsylvania</option> -->
<!-- 								<option value="RI">Rhode Island</option> -->
<!-- 								<option value="SC">South Carolina</option> -->
<!-- 								<option value="SD">South Dakota</option> -->
<!-- 								<option value="TN">Tennessee</option> -->
<!-- 								<option value="TX">Texas</option> -->
<!-- 								<option value="UT">Utah</option> -->
<!-- 								<option value="VT">Vermont</option> -->
<!-- 								<option value="VA">Virginia</option> -->
<!-- 								<option value="WA">Washington</option> -->
<!-- 								<option value="WV">West Virginia</option> -->
<!-- 								<option value="WI">Wisconsin</option> -->
<!-- 								<option value="WY">Wyoming</option> -->
<!-- 							</select> -->
<!-- 							<div class="invalid-feedback">Please provide a valid state. -->
<!-- 							</div> -->
<!-- 						</div> -->



						<div class="col-md-3 mb-3">
							<label for="zip">City</label> <input type="text"
								class="form-control" id="zip" value="${users.get(0).city }"
								required>
							<div class="invalid-feedback">City required.</div>
						</div>
						<div class="col-md-3 mb-3">
							<label for="zip">State</label> <input type="text"
								class="form-control" id="zip" value="${users.get(0).state }"
								required>
							<div class="invalid-feedback">State required.</div>
						</div>
						<div class="col-md-3 mb-3">
							<label for="zip">Zip</label> <input type="text"
								class="form-control" id="zip" value="${users.get(0).zip }"
								required>
							<div class="invalid-feedback">Zip code required.</div>
						</div>
					</div>
					<hr class="mb-4">
					<div class="custom-control custom-checkbox">
						<input type="checkbox" class="custom-control-input"
							id="same-address"> <label class="custom-control-label"
							for="same-address">Shipping address is the same as my
							billing address</label>
					</div>
					<div class="custom-control custom-checkbox">
						<input type="checkbox" class="custom-control-input" id="save-info">
						<label class="custom-control-label" for="save-info">Save
							this information for next time</label>
					</div>
					<hr class="mb-4">

					<h4 class="mb-3">Payment</h4>

					<div class="d-block my-3">
						<div class="custom-control custom-radio">
							<input id="credit" name="paymentMethod" type="radio"
								class="custom-control-input" checked required> <label
								class="custom-control-label" for="credit">Credit card</label>
						</div>
						<div class="custom-control custom-radio">
							<input id="debit" name="paymentMethod" type="radio"
								class="custom-control-input" required> <label
								class="custom-control-label" for="debit">Debit card</label>
						</div>
						<div class="custom-control custom-radio">
							<input id="paypal" name="paymentMethod" type="radio"
								class="custom-control-input" required> <label
								class="custom-control-label" for="paypal">PayPal</label>
						</div>
					</div>
					<div class="row">
						<div class="col-md-6 mb-3">
							<label for="cc-name">Name on card</label> <input type="text"
								class="form-control" id="cc-name" placeholder="" required>
							<small class="text-muted">Full name as displayed on card</small>
							<div class="invalid-feedback">Name on card is required</div>
						</div>
						<div class="col-md-6 mb-3">
							<label for="cc-number">Credit card number</label> <input
								type="text" class="form-control" id="cc-number" placeholder=""
								required>
							<div class="invalid-feedback">Credit card number is
								required</div>
						</div>
					</div>
					<div class="row">
						<div class="col-md-3 mb-3">
							<label for="cc-expiration">Expiration</label> <input type="text"
								class="form-control" id="cc-expiration" placeholder="" required>
							<div class="invalid-feedback">Expiration date required</div>
						</div>
						<div class="col-md-3 mb-3">
							<label for="cc-cvv">CVV</label> <input type="text"
								class="form-control" id="cc-cvv" placeholder="" required>
							<div class="invalid-feedback">Security code required</div>
						</div>
					</div>
					<hr class="mb-4">
					<button class="headerButton btn" type="submit">Complete Purchase</button>
				</form>
			</div>
		</div>
	</div>


	<c:import url="/sharedViews/footer.jsp" />
	<c:import url="/sharedViews/scripts.jsp" />

</body>
</html>

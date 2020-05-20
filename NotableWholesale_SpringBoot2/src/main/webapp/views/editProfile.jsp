<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!doctype html>
<html lang="en">

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<head>
<c:import url="/sharedViews/headMeta.jsp" />
<title>Edit Profile</title>
</head>

<body>
	<c:import url="/sharedViews/header.jsp" />

	<div class="container home">
		<div class="row">
			<div
				class="col-xs-12 col-md-8 col-md-offset-2 col-lg-6 col-lg-offset-3 col-xl-4 col-xl-offset-4">
				<div class="container" id="nwContainer">
					<div class="card" id="nwCard">
						<h1>Edit Profile</h1>
						<div class="container-fluid" id="nwContainer">
							<div class="details col-sm-12 product-details">
								<form class="nwFormEdit" action="update" method="post">
									<h3 class="product-title">Account Details</h3>
									<div class="container">
										<h4 class="">Log In Details</h4>
										<div class="row">
											<div class="col-sm-4">
												<p class="">Email Address:</p>
											</div>
											<div class="col-sm-4">
												<input type="hidden" name="id" value="${users.get(0).userId}">${users.get(0).email}<br>
											</div>
										</div>
										<div class="row">
											<div class="col-sm-4">
												<p class="product-description">Password:</p>
											</div>
											<div class="col-sm-4">
												<p class="product-description" id="pwEdit">${users.get(0).password}</p>
											</div>
										</div>
										<h4>Personal Information</h4>
										<div class="row">
											<div class="col-sm-4">
												<p class="product-description">First Name:</p>
											</div>
											<div class="col-sm-4">
												<input class="regInput" type="text" name="firstName" value="${users.get(0).firstName}"><br>
											</div>
										</div>
										<div class="row">
											<div class="col-sm-4">
												<p class="product-description">Last Name:</p>
											</div>
											<div class="col-sm-4">
												<input class="regInput" type="text" name="lastName" value="${users.get(0).lastName}"><br>
											</div>
										</div>
										<div class="row">
											<div class="col-sm-4">
												<p class="product-description">Street:</p>
											</div>
											<div class="col-sm-4">
												<input class="regInput" type="text" name="street" value="${users.get(0).street}"><br>
											</div>
										</div>
										<div class="row">
											<div class="col-sm-4">
												<p class="product-description">City:</p>
											</div>
											<div class="col-sm-4">
												<input class="regInput" type="text" name="city" value="${users.get(0).city}"><br>
											</div>
										</div>
										<div class="row">
											<div class="col-sm-4">
												<p class="product-description">State:</p>
											</div>
											<div class="col-sm-4">
												<input class="regInput" type="text" name="state" value="${users.get(0).state}"><br>
											</div>
										</div>
										<div class="row">
											<div class="col-sm-4">
												<p class="product-description">Zip:</p>
											</div>
											<div class="col-sm-4">
												<input class="regInput" type="text" name="zip" value="${users.get(0).zip}"><br>
											</div>
										</div>
									</div>
									<label>&nbsp;</label> <input id="btnWide" type="submit"
										value="Save" class="headerButton btn">
								</form>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

	<c:import url="/sharedViews/footer.jsp" />
	<c:import url="/sharedViews/scripts.jsp" />

</body>

</html>
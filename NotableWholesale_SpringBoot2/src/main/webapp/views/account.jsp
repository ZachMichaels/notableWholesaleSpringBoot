<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!doctype html>
<html lang="en">

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<head>
<c:import url="/sharedViews/headMeta.jsp" />
<title>User Profile</title>
</head>

<body>
	<c:import url="/sharedViews/header.jsp" />

	<div class="container home">
		<div class="row">
			<div
				class="col-xs-12 col-md-8 col-md-offset-2 col-lg-6 col-lg-offset-3 col-xl-4 col-xl-offset-4">
				<div class="container" id="nwContainer">
					<div class="card" id="nwCard">
						<h1>User Profile</h1>
						<div class="container-fluid" id="nwContainer">
								<a class="headerButton btn" href="myOrders" role="button"><i
									class="fa fa-list-ul"></i> Order History</a><a
									class="headerButton btn" href="home?name=wishlist" role="button"><i
									class="fa fa-gift"></i> Wishlist</a> <a class="headerButton btn"
									href="home?name=editProfile" role="button"><i
									class="fa fa-user"></i> Edit Profile</a>
							<div class="details col-sm-12 product-details">

								<h3 class="product-title">Account Details</h3>
								<div class="container">
									<h4 class="">Log In Details</h4>
									<div class="row">
										<div class="col-sm-4">
											<p class="">Email Address:</p>
										</div>
										<div class="col-sm-4">
											<p class="product-description" id="emailEdit">${users.get(0).email}</p>
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
									<h4 class="price">Personal Information</h4>
									<div class="row">
										<div class="col-sm-4">
											<p class="product-description">First Name:</p>
										</div>
										<div class="col-sm-4">
											<p class="product-description" id="streetEdit">${users.get(0).firstName}</p>
										</div>
									</div>
									<div class="row">
										<div class="col-sm-4">
											<p class="product-description">Last Name:</p>
										</div>
										<div class="col-sm-4">
											<p class="product-description" id="streetEdit">${users.get(0).lastName}</p>
										</div>
									</div>
									<div class="row">
										<div class="col-sm-4">
											<p class="product-description">Street:</p>
										</div>
										<div class="col-sm-4">
											<p class="product-description" id="streetEdit">${users.get(0).street}</p>
										</div>
									</div>
									<div class="row">
										<div class="col-sm-4">
											<p class="product-description">City:</p>
										</div>
										<div class="col-sm-4" id="editProf">
											<p class="product-description" id="cityEdit">${users.get(0).city}</p>
										</div>
									</div>
									<div class="row">
										<div class="col-sm-4">
											<p class="product-description">State:</p>
										</div>
										<div class="col-sm-4">
											<p class="product-description" id="streetEdit">${users.get(0).state}</p>
										</div>
									</div>
									<div class="row">
										<div class="col-sm-4">
											<p class="product-description">Zip:</p>
										</div>
										<div class="col-sm-4">
											<p class="product-description" id="streetEdit">${users.get(0).zip}</p>
										</div>
									</div>
								</div>
								<a class="headerButton btn" href="#" id="saveBtn" role="button"><i
									class="fa fa-check-circle"></i> Save</a>
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
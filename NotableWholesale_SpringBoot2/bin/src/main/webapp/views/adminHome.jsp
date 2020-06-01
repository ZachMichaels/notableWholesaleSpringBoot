<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!doctype html>
<html lang="en">

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<head>
<c:import url="/sharedViews/headMeta.jsp" />
<title>Admin</title>
</head>

<body>
	<c:import url="/sharedViews/adminLoginHeader.jsp" />

	<div class="container home">
		<div class="row">
			<div class="col-md-12">
				<h3>Admin Menu</h3>
				<a href="resupply"><button class="headerButton btn">New Order</button></a>
				<a href="adminCart"><button class="headerButton btn">Cart</button></a>
				<a href="adminOrders"><button class="headerButton btn">View History</button></a>
				<a href="logout"><button class="headerButton btn">Log Out</button></a>
				
				
				
			</div>
		</div>
	</div>

	<c:import url="/sharedViews/adminFooter.jsp" />
	<c:import url="/sharedViews/scripts.jsp" />
<body>

</body>
</html>
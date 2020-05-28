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
	<c:import url="/sharedViews/header.jsp" />

	<div class="container home">
		<div class="row">
			<div class="col-md-12">
				<h1>Administrator Page</h1>
				<a href="resupply"><button class="headerButton btn">Order Products</button></a>
	<button class="headerButton btn">View Analytics</button>
	<button class="headerButton btn">Submit IT Ticket</button>
			</div>
		</div>
	</div>
	
<div class="row justify-content-center">	
	
		<table class="table w-50 center">
			 	<thead>
			    <tr>
			      <th scope="col">Prod ID</th>
			      <th scope="col">Name</th>
			      <th scope="col">Category</th>
			      <th scope="col">Stock</th>
			    </tr>
			  </thead>
			<c:forEach var="product" items="${products }">
			  <tbody>
			    <tr>
			      <td>${product.productId }</td>
			      <td>${product.name }</td>
			      <td>${product.category }</td>
			      <td>${product.stock }</td>
			    </tr>
			  </tbody>	
			</c:forEach>
		</table>
	
	</div>
	<c:import url="/sharedViews/footer.jsp" />
	<c:import url="/sharedViews/scripts.jsp" />
<body>

</body>
</html>
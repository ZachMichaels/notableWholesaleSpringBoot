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
	<c:import url="/sharedViews/adminHeader.jsp" />

	<div class="container home">
		<div class="row">
			<div class="col-md-12">
				<a href="resupply"><button class="headerButton btn">New Order</button></a>
				<a href="adminCart"><button class="headerButton btn">Cart</button></a>
				<a href="adminOrders"><button class="headerButton btn">View History</button></a>
				<a href="logout"><button class="headerButton btn">Log Out</button></a>
				<h1>New Order</h1>
				
			</div>
		</div>
	</div>

	<div class="row justify-content-center">

			<table class="table w-75 center">

				<thead>
					<tr>
						<th scope="col">
							<div class="dropdown">
					          <button class="btn dropdown-toggle" type="button" id="dropdownMenuButton" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
					            Sort
					          </button>
					          <div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
					            <a class="dropdown-item" id="" href="adminSortAsc?name=productId">Low to High</a>
					            <a class="dropdown-item" id="" href="adminSortDesc?name=productId">High to Low</a>					      
					          </div>
					        </div>							
						Prod ID</th>
						
						<th scope="col">
							<div class="dropdown">
					          <button class="btn dropdown-toggle" type="button" id="dropdownMenuButton" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
					            Sort
					          </button>
					          <div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
					            <a class="dropdown-item" id="" href="adminSortAsc?name=name">A to Z</a>
					            <a class="dropdown-item" id="" href="adminSortDesc?name=name">Z to A</a>					      
					          </div>
					        </div>	
						Name</th>
						<th scope="col">
							<div class="dropdown">
					          <button class="btn dropdown-toggle" type="button" id="dropdownMenuButton" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
					            Sort
					          </button>
					          <div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
					            <a class="dropdown-item" id="" href="adminSortAsc?name=category">A to Z</a>
					            <a class="dropdown-item" id="" href="adminSortDesc?name=category">Z to A</a>					      
					          </div>
					        </div>	
						Category</th>
						<th scope="col">
							<div class="dropdown">
					          <button class="btn dropdown-toggle" type="button" id="dropdownMenuButton" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
					            Sort
					          </button>
					          <div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
					            <a class="dropdown-item" id="" href="adminSortAsc?name=stock">Low to High</a>
					            <a class="dropdown-item" id="" href="adminSortDesc?name=stock">High to Low</a>					      
					          </div>
					        </div>						
						Current Stock</th>
						<th scope="col">Stock to Order</th>

					</tr>
				</thead>


				<c:forEach var="product" items="${products }">
					<tbody>
						<tr>
							<td>${product.productId }</td>
							<td>${product.name }</td>
							<td>${product.category }</td>
							<td>${product.stock }</td>
							<td>
								<form class="add-to-cart" action="addSupplies" method="POST">
								<input type="hidden" name="id" value="${product.productId }">
								<input type="number" name="quantity" value="0">
	              				<input class="headerButton btn" type="submit" value="Add">
	             				</form>
							</td>

						</tr>
					</tbody>
				</c:forEach>
			</table>
	</div>
	
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
	<c:import url="/sharedViews/adminFooter.jsp" />
	<c:import url="/sharedViews/scripts.jsp" />
<body>

</body>
</html>
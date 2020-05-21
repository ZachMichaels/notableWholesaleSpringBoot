<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!doctype html>
<html lang="en">

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<head>
<c:import url="/sharedViews/headMeta.jsp" />
<title>Orders</title>
</head>

<body>
  <c:import url="/sharedViews/header.jsp" />

	<div class="ly">
		<table class="ck" data-sort="table">
			<thead>
				<tr>
					<th><input type="checkbox" class="bsn" id="selectAll"></th>
					<th>Order ID</th>
					<th>Amount</th>
					<th>Status</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<c:forEach>
					
					</c:forEach>
					<td><input type="checkbox" class="bso"></td>
					<td><a href="#">#10001</a></td>
					<td>Order ID</td>
					<td>01/01/2015</td>
				</tr>
		</table>
	</div>

	<div class="avv">
		<nav>
			<ul class="qn">
				<li class="qp"><a class="qo" href="#" aria-label="Previous">
						<span aria-hidden="true">&laquo;</span> <span class="adp">Previous</span>
				</a></li>
				<li class="qp active"><a class="qo" href="#">1</a></li>
				<li class="qp"><a class="qo" href="#">2</a></li>
				<li class="qp"><a class="qo" href="#">3</a></li>
				<li class="qp"><a class="qo" href="#">4</a></li>
				<li class="qp"><a class="qo" href="#">5</a></li>
				<li class="qp"><a class="qo" href="#" aria-label="Next"> <span
						aria-hidden="true">&raquo;</span> <span class="adp">Next</span>
				</a></li>
			</ul>
		</nav>
	</div>

	<c:import url="/sharedViews/footer.jsp" />
	<c:import url="/sharedViews/scripts.jsp" />

</body>

</html>
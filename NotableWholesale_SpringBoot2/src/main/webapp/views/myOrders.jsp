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


<table class="table">
  <thead>
    <tr>
      <th scope="col">Order#</th>
      <th scope="col">Product</th>
      <th scope="col">Price</th>
      <th scope="col">Quantity</th>
      <th scope="col">Product Total</th>
      <th scope="col">Order Total</th>
    </tr>
  </thead>
  <tbody>
  													
   <c:forEach items="${orderDetails }" var="orderDetails">
    <tr>
      <td>${orderDetails.orderId }</td>
      <td>${orderDetails.productName }</td>
      <td>${orderDetails.price }</td>
      <td>${orderDetails.quantity }</td>
      <td>${orderDetails.productTotal }</td>
      <td>${orderDetails.orderTotal }</td>
    </tr>
    </c:forEach>
  </tbody>
</table>

	<c:import url="/sharedViews/footer.jsp" />
	<c:import url="/sharedViews/scripts.jsp" />

</body>

</html>
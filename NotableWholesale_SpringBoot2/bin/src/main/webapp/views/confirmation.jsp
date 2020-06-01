<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
pageEncoding="ISO-8859-1"%>
<!doctype html>
<html lang="en">

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@ taglib uri = "http://java.sun.com/jsp/jstl/functions" prefix = "fn" %>

<head>
<c:import url="/sharedViews/headMeta.jsp" />
<title>Confirmation</title>
</head>

<body>
<c:import url="/sharedViews/header.jsp" />

<div class="center">
<h1>Thank You!</h1>
<h2>Purchase Complete</h2>
<p>Order#: ${order.get(0).orderId }</p>
</div>

<c:import url="/sharedViews/footer.jsp" />
<c:import url="/sharedViews/scripts.jsp" />
	
</body>

</html>


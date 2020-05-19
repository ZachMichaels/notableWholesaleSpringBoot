<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
pageEncoding="ISO-8859-1"%>
<!doctype html>
<html lang="en">

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@ taglib uri = "http://java.sun.com/jsp/jstl/functions" prefix = "fn" %>

<head>
<c:import url="/sharedViews/headMeta.jsp" />
<title>${products[0].category }</title>
</head>

<body>
	<c:import url="/sharedViews/header.jsp" />

  <div class="container home">
    <div class="row">
      <div class="col-md-12">
        <h1>${products[0].category }</h1>
        <div class="dropdown">
          <button class="btn dropdown-toggle" type="button" id="dropdownMenuButton" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
            Sort Products
          </button>
          <div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
            <a class="dropdown-item" id="sortAscending" href="sortAsc?name=${products[0].category }">Price - Low to High</a>
            <a class="dropdown-item" id="sortDescending" href="sortDesc?name=${products[0].category }">Price - High to Low</a>
            <a class="dropdown-item" id="sortAlpha" href="sortAlpha?name=${products[0].category }">Name - A to Z</a>
            <a class="dropdown-item" id="sortReverseAlpha" href="sortRevAlpha?name=${products[0].category }">Name - Z to A</a>
          </div>
        </div>

        <form action="priceFilter" method="post">
          <label for="">Filter by Price</label>
          <input type="hidden" name="name" value='${products[0].category }'>
          <input type="number" step="0.01" min="0.00" name="minPrice" class="lowPrice" placeholder="Enter Minimum $" value="" />
          <input type="number" step="0.01" min="0.00" name="maxPrice" class="highPrice" placeholder="Enter Maximum $" value="" />
          <button id="filterButton" class="headerButton btn">Go</button>
        </form>

      </div>
    </div>
  </div>
  
  <c:if test="${products[0].price == 0.00 }">
	     <p align="center">No products match that criteria</p>
  </c:if>
  
  <div id="SGProductsStart" class="container home">
    <div class="row featureProducts">
	  <c:forEach items="${products }" var="product">
	  	<div class="prod-1 col-sm-4">
	  	
	  		<c:set var="productName" value="${product.name }"/>
	  		<c:set var="productNameLowerCase" value="${fn:toLowerCase(productName)}"/>
	  		
	        <a href="home?name=${productNameLowerCase}"><img src="images/${product.img }" alt=""></a>
	        <p class="prodName">${product.name }</p>
	        
	        <c:if test="${product.price != 0 }">
	        <p class="prodPrice">${product.priceCurrencyFormat }</p>
	        </c:if>
	        
	      </div>
	  </c:forEach>
  	</div>
  </div>

<c:import url="/sharedViews/footer.jsp" />
<c:import url="/sharedViews/scripts.jsp" />
	
</body>

</html>


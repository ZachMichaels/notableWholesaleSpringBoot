<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<header>
        <div id="homeHeader">
            <div class="row" id="topRow">
                <div class="col-sm-4">
                    <a href="home?name=home"><img src="images/notableWholesaleLogo.png"
                        id="mainLogo" alt=""></a>
                </div>
                <div class="col-sm-4" id="searchForm">
                    <form class="form-inline-custom" action="search" method="post">
                        <input class="searchWidth mr-sm-2" type="search" placeholder="Search" aria-label="Search" name="searchTerm">
                        <button class="headerButton btn my-2 my-sm-0" id="searchBtn" type="submit"><i class="fa fa-search"></i>Search</button>
                    </form>
                </div>

                <div class="col-sm-4">
                    <div class="leftHeader">
                        <a class="headerButton btn" href="cart" role="button"><i
                            class="fa fa-shopping-cart"></i> Cart</a>
                                                
                    <c:choose>
                    	<c:when test="${cookie.loggedInCookie.value != 'yes' }">
           					<a class="headerButton btn" href="home?name=login" role="button"><i
							class="fa fa-address-card"></i> Sign In</a>
           				</c:when>
           				<c:when test="${cookie.firstNameCookie.value == 'Admin'}">
           					<a class="headerButton btn" href="home?name=account" id="navbarDropdownMenuLink" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                            <i class="fa fa-user-circle"></i>Admin Menu</a>
	                        <div class="dropdown-menu"
	                            aria-labelledby="navbarDropdownMenuLink">	
	                            <a class="dropdown-item" href="home?name=admin"><i class="fa fa-list-ul"></i>New Order</a>
	                            <a class="dropdown-item" href="adminCart"><i class="fa fa-list-ul"></i>Cart</a>	                     
	                            <a class="dropdown-item" href="adminOrders"><i class="fa fa-list-ul"></i>View History</a> 	                          
	                            <a class="dropdown-item" href="logout"><i class="fa fa-power-off"></i> Log Out</a>
	                        </div>
           				</c:when>
           				<c:when test="${cookie.loggedInCookie.value == 'yes'}">
           					<a class="headerButton btn" href="home?name=account" id="navbarDropdownMenuLink" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                            <i class="fa fa-user-circle"></i> My Account</a>
	                        <div class="dropdown-menu"
	                            aria-labelledby="navbarDropdownMenuLink">
	                            <a class="dropdown-item" href="home?name=account"><i class="fa fa-user"></i> User Profile</a> 
	                            <a class="dropdown-item" href="myOrders"><i class="fa fa-list-ul"></i> Order History</a> 
	                            <a class="dropdown-item" href="home?name=wishlist"><i class="fa fa-gift"></i> Wishlist</a> 
	                            <a class="dropdown-item" href="logout"><i class="fa fa-power-off"></i> Log Out</a>
	                        </div>
           				</c:when>
           				
           			</c:choose>

                    </div>
                </div>
            </div>

           	<c:if test="${cookie.loggedInCookie.value == 'yes'}">
           		<p id="welcomeBack">Welcome back, ${cookie.firstNameCookie.value}!</p>
           </c:if>
           
        </div>
         
<!--          This is a workaround to give space where the category dropdowns were -->
        <div class="productMenu">
            <div class="d-flex justify-content-center">
                <nav class="navbar navbar-expand-lg navbar-light bg-light">
                </nav>
                <nav class="navbar navbar-expand-lg navbar-light bg-light">
                </nav>
                <nav class="navbar navbar-expand-lg navbar-light bg-light">
                </nav>
                <nav class="navbar navbar-expand-lg navbar-light bg-light">
                </nav>
                <nav class="navbar navbar-expand-lg navbar-light bg-light">
                </nav>
            </div>
        </div>

    </header>
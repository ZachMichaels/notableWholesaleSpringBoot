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
         
        <div class="productMenu">
            <div class="d-flex justify-content-center">
                <nav class="navbar navbar-expand-lg navbar-light bg-light">
                    <a class="nav-link dropdown-toggle" href=""
                        id="navbarDropdownMenuLink" role="button" data-toggle="dropdown"
                        aria-haspopup="true" aria-expanded="false"> Groceries </a>
                    <div class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink">
                        <a class="dropdown-item" href="category?name=Groceries">All Groceries</a> <a
                            class="dropdown-item" href="product?productId=1">Meat Sticks</a> <a
                            class="dropdown-item" href="product?productId=2">Crackers</a> 
                            <a class="dropdown-item" href="product?productId=3">Free-range Tofu</a>
                            <a class="dropdown-item" href="product?productId=4">Dino Egg</a>
                            <a class="dropdown-item" href="product?productId=5">BBQ Wood Chips</a>
                            <a class="dropdown-item" href="product?productId=6">Chocolate Scorpions</a>
                    </div>
                </nav>
                <nav class="navbar navbar-expand-lg navbar-light bg-light">
                    <a class="nav-link dropdown-toggle" href=""
                        id="navbarDropdownMenuLink2" role="button" data-toggle="dropdown"
                        aria-haspopup="true" aria-expanded="false"> Clothing </a>
                    <div class="dropdown-menu"
                        aria-labelledby="navbarDropdownMenuLink2">
                        <a class="dropdown-item" href="category?name=clothing">All Clothing</a> <a
                            class="dropdown-item" href="product?productId=7">Romphims</a> <a
                            class="dropdown-item" href="product?productId=8">Onesies</a> <a
                            class="dropdown-item" href="product?productId=9">Snuggies</a>
                            <a class="dropdown-item" href="product?productId=10">Hat</a>
                            <a class="dropdown-item" href="product?productId=11">Athletic Shirt</a>
                            <a class="dropdown-item" href="product?productId=12">Bear Jacket</a>
                    </div>
                </nav>
                <nav class="navbar navbar-expand-lg navbar-light bg-light">
                    <a class="nav-link dropdown-toggle" href="#"
                        id="navbarDropdownMenuLink3" role="button" data-toggle="dropdown"
                        aria-haspopup="true" aria-expanded="false"> Electronics </a>
                    <div class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink">
                        <a class="dropdown-item" href="category?name=electronics">All
                            Electronics</a> <a class="dropdown-item" href="product?productId=13">Calculator</a>
                        <a class="dropdown-item" href="product?productId=14">HDMI Cables</a> <a
                            class="dropdown-item" href="product?productId=15">Televisions</a>
                            <a class="dropdown-item" href="product?productId=16">Super Charger</a>
                            <a class="dropdown-item" href="product?productId=17">Robot Dog</a>
                            <a class="dropdown-item" href="product?productId=18">Clapper</a>
                    </div>
                </nav>
                <nav class="navbar navbar-expand-lg navbar-light bg-light">
                    <a class="nav-link dropdown-toggle" href="#"
                        id="navbarDropdownMenuLink4" role="button" data-toggle="dropdown"
                        aria-haspopup="true" aria-expanded="false"> Sporting Goods </a>
                    <div class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink">
                        <a class="dropdown-item" href="category?name=sporting goods">All
                            Sporting Goods</a> <a class="dropdown-item" href="product?productId=19">Nunchucks</a>
                        <a class="dropdown-item" href="product?productId=20">Javelins</a> <a
                            class="dropdown-item" href="product?productId=21">Rocket Skates</a>
                            <a class="dropdown-item" href="product?productId=22">Golf Balls</a>
                            <a class="dropdown-item" href="product?productId=23">Velcro Trampoline</a>
                            <a class="dropdown-item" href="product?productId=24">Pogo Stick</a>
                    </div>
                </nav>
                <nav class="navbar navbar-expand-lg navbar-light bg-light">
                    <a class="nav-link dropdown-toggle" href="#"
                        id="navbarDropdownMenuLink5" role="button" data-toggle="dropdown"
                        aria-haspopup="true" aria-expanded="false"> Office Supplies </a>
                    <div class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink">
                        <a class="dropdown-item" href="category?name=office supplies">All
                            Office Supplies</a> <a class="dropdown-item" href="product?productId=25">Staplers</a>
                        <a class="dropdown-item" href="product?productId=26">Paper Shredders</a>
                        <a class="dropdown-item" href="product?productId=27">3D Printers</a>
                        <a class="dropdown-item" href="product?productId=28">Paperclips</a>
                        <a class="dropdown-item" href="product?productId=29">Desk Pillow</a>
                        <a class="dropdown-item" href="product?productId=30">Tape Dispenser</a>
                    </div>
                </nav>
            </div>
        </div>
    </header>
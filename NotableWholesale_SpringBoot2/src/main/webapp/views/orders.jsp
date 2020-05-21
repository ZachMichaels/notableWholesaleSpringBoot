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

	<!--Actual Cart Stuff-->

  <div class="container home">
    <div class="container">
      
      <div class="et brf">

  <div class="bqo">
    <h2 class="bqp">Order history</h2>
  </div>

        <div class="row">
  <div class="on bqr">
    <div class="axm bpy">
      <input type="text" value="01/01/15 - 01/08/15" class="form-control" data-provide="datepicker">
      <span class="bv bbc"></span>
    </div>
  </div>
    <div class="boq bor">
    <div class="axm bpy">
      <input type="text" class="form-control bsx" placeholder="Search orders">
      <span class="bv bhw"></span>
    </div>
  </div>
  
    <div class="boq">
    <div class="ol">
      <button type="button" class="ce nr">
        <span class="bv bji"></span>
      </button>
      <button type="button" class="ce nr">
        <span class="bv bei"></span>
      </button>
    </div>
  </div>
</div>


<div class="container">
  <table class="table-fluid" data-sort="table">
    <thead>
      <tr>
        <th class="header"><input type="checkbox" class="tabable" id="selectAll"></th>
        <th class="header headerSortDown">Order</th>
        <th class="header">Customer name</th>
        <th class="header">Description</th>
        <th class="header">Date</th>
        <th class="header">Total</th>
      </tr>
    </thead>
    <tbody>
      

      <tr>
        <td><input type="checkbox" class="bso"></td>
        <td><a href="#">#10001</a></td>
        <td>First Last</td>
        <td>Admin theme, marketing theme</td>
        <td>01/01/2015</td>
        <td>$200.00</td>
      </tr><tr>
        <td><input type="checkbox" class="bso"></td>
        <td><a href="#">#10002</a></td>
        <td>Firstname Last</td>
        <td>Admin theme</td>
        <td>01/01/2015</td>
        <td>$100.00</td>
      </tr><tr>
        <td><input type="checkbox" class="bso"></td>
        <td><a href="#">#10003</a></td>
        <td>Name Another</td>
        <td>Personal blog theme</td>
        <td>01/01/2015</td>
        <td>$100.00</td>
      </tr><tr>
        <td><input type="checkbox" class="bso"></td>
        <td><a href="#">#10004</a></td>
        <td>One More</td>
        <td>Marketing theme, personal blog theme, admin theme</td>
        <td>01/01/2015</td>
        <td>$300.00</td>
      </tr><tr>
        <td><input type="checkbox" class="bso"></td>
        <td><a href="#">#10005</a></td>
        <td>Name Right Here</td>
        <td>Personal blog theme, admin theme</td>
        <td>01/02/2015</td>
        <td>$200.00</td>
      </tr><tr>
        <td><input type="checkbox" class="bso"></td>
        <td><a href="#">#10006</a></td>
        <td>First Last</td>
        <td>Admin theme, marketing theme</td>
        <td>01/01/2015</td>
        <td>$200.00</td>
      </tr><tr>
        <td><input type="checkbox" class="bso"></td>
        <td><a href="#">#10007</a></td>
        <td>Firstname Last</td>
        <td>Admin theme</td>
        <td>01/01/2015</td>
        <td>$100.00</td>
      </tr><tr>
        <td><input type="checkbox" class="bso"></td>
        <td><a href="#">#10008</a></td>
        <td>Name Another</td>
        <td>Personal blog theme</td>
        <td>01/01/2015</td>
        <td>$100.00</td>
      </tr><tr>
        <td><input type="checkbox" class="bso"></td>
        <td><a href="#">#10009</a></td>
        <td>One More</td>
        <td>Marketing theme, personal blog theme, admin theme</td>
        <td>01/01/2015</td>
        <td>$300.00</td>
      </tr><tr>
        <td><input type="checkbox" class="bso"></td>
        <td><a href="#">#10010</a></td>
        <td>Name Right Here</td>
        <td>Personal blog theme, admin theme</td>
        <td>01/02/2015</td>
        <td>$200.00</td>
      </tr><tr>
        <td><input type="checkbox" class="bso"></td>
        <td><a href="#">#10011</a></td>
        <td>First Last</td>
        <td>Admin theme, marketing theme</td>
        <td>01/01/2015</td>
        <td>$200.00</td>
      </tr><tr>
        <td><input type="checkbox" class="bso"></td>
        <td><a href="#">#10012</a></td>
        <td>Firstname Last</td>
        <td>Admin theme</td>
        <td>01/01/2015</td>
        <td>$100.00</td>
      </tr><tr>
        <td><input type="checkbox" class="bso"></td>
        <td><a href="#">#10013</a></td>
        <td>Name Another</td>
        <td>Personal blog theme</td>
        <td>01/01/2015</td>
        <td>$100.00</td>
      </tr><tr>
        <td><input type="checkbox" class="bso"></td>
        <td><a href="#">#10014</a></td>
        <td>One More</td>
        <td>Marketing theme, personal blog theme, admin theme</td>
        <td>01/01/2015</td>
        <td>$300.00</td>
      </tr><tr>
        <td><input type="checkbox" class="bso"></td>
        <td><a href="#">#10015</a></td>
        <td>Name Right Here</td>
        <td>Personal blog theme, admin theme</td>
        <td>01/02/2015</td>
        <td>$200.00</td>
      </tr><tr>
        <td><input type="checkbox" class="bso"></td>
        <td><a href="#">#10016</a></td>
        <td>First Last</td>
        <td>Admin theme, marketing theme</td>
        <td>01/01/2015</td>
        <td>$200.00</td>
      </tr><tr>
        <td><input type="checkbox" class="bso"></td>
        <td><a href="#">#10017</a></td>
        <td>Firstname Last</td>
        <td>Admin theme</td>
        <td>01/01/2015</td>
        <td>$100.00</td>
      </tr><tr>
        <td><input type="checkbox" class="bso"></td>
        <td><a href="#">#10018</a></td>
        <td>Name Another</td>
        <td>Personal blog theme</td>
        <td>01/01/2015</td>
        <td>$100.00</td>
      </tr><tr>
        <td><input type="checkbox" class="bso"></td>
        <td><a href="#">#10019</a></td>
        <td>One More</td>
        <td>Marketing theme, personal blog theme, admin theme</td>
        <td>01/01/2015</td>
        <td>$300.00</td>
      </tr><tr>
        <td><input type="checkbox" class="bso"></td>
        <td><a href="#">#10020</a></td>
        <td>Name Right Here</td>
        <td>Personal blog theme, admin theme</td>
        <td>01/02/2015</td>
        <td>$200.00</td>
    </tr></tbody>
  </table>
</div>

<!-- <div class="row">
  <nav>
    <ul class="qn">
      <li class="qp">
        <a class="qo" href="#" aria-label="Previous">
          <span aria-hidden="true">«</span>
          <span class="adp">Previous</span>
        </a>
      </li>
      <li class="qp active"><a class="qo" href="#">1</a></li>
      <li class="qp"><a class="qo" href="#">2</a></li>
      <li class="qp"><a class="qo" href="#">3</a></li>
      <li class="qp"><a class="qo" href="#">4</a></li>
      <li class="qp"><a class="qo" href="#">5</a></li>
      <li class="qp">
        <a class="qo" href="#" aria-label="Next">
          <span aria-hidden="true">»</span>
          <span class="adp">Next</span>
        </a>
      </li>
    </ul>
  </nav>
</div> -->

      </div>
    </div>
  </div>



	<c:import url="/sharedViews/footer.jsp" />
	<c:import url="/sharedViews/scripts.jsp" />

</body>

</html>
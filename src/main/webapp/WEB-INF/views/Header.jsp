<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!doctype html>
<html lang="en">
<head>
<title>Header file</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="X-UA-Compatible"content="IE=11">
<meta charset="utf-8">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css" integrity="sha384-GJzZqFGwb1QTTN6wy59ffF1BuGJpLSa9DkKMp0DgiMDm4iYMj70gZWKYbI706tWS" crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.6/umd/popper.min.js" integrity="sha384-wHAiFfRlMFy6i5SRaxvfOCifBUQy1xHdJ/yoi7FRNXMRBu5WHdZYu1hA6ZOblgut" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/js/bootstrap.min.js" integrity="sha384-B0UglyR+jN6CkvvICOB2joaf5I4l3gm9GU6Hc1og6Ls7i6U/mkkaduKaBhlAXv9k" crossorigin="anonymous"></script>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css"/>
</head>
<body>
<div class="container-fluid">
<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
 <a class="navbar-brand" href="<c:url value="/image"/>">Minnanu Shop</a>
 <img src="resources/image/download.png" style="max-width:75px; margin-top: -7px;"/>

 
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
   </button>
  <div class="collapse navbar-collapse" id="navbarNav">
    <ul class="navbar-nav">
<c:if test="${!sessionScope.loggedIn}">
      <li class="nav-item">
        <a class="nav-link" href="register"><i class="fa fa-registered" aria-hidden="true"></i>Register</a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="aboutus"><i class="fa fa-address-card"></i>AboutUs</a>
      </li>
      </c:if>
      <c:if test="${sessionScope.loggedIn}">
      <c:if test="${sessionScope.role=='Role_Admin'}">
      <li class="nav-item">
        <a class="nav-link" href="category"><i class="fa fa-caret-square-o-down" aria-hidden="true"></i>
        Category</a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="product"><i class="fa fa-shopping-basket" aria-hidden="true"></i>
        Product</a>
      </li>
      </c:if>
      </c:if>
      <c:if test="${sessionScope.loggedIn}">
      <c:if test="${sessionScope.role=='Role_User'}">
      <li class="nav-item">
      <a class="nav-link" href="productdisplay">ProductDisplay</a>
      </li>
      <li class="nav-item">
      <a class="nav-link" href="cart"><i class="fa fa-cart-arrow-down" aria-hidden="true"></i>Cart</a>
      </li>
      </c:if>
      </c:if>
    </ul>
    </div>
     
     
     <div class="collapse navbar-collapse" id="navbarNav">
    <ul class="nav navbar-nav navbar-right  navbar-dark bg-dark">
    <c:if test="${!sessionScope.loggedIn}">
      <li class="nav-item"><a class="nav-link" href="<c:url value="/login"/>"><i class="fa fa-sign-in"></i>Login</a></li>
      </c:if>
      <c:if test="${sessionScope.loggedIn}">
      <div id="userdetail">
      <font color="white">
      Welcome ${sessionScope.username}
      <a class="btn btn-danger" href="<c:url value="/perform_logout"/>" class="btn-btn-danger"><i class="fa fa-sign-out-alt"></i>LogOut</a>
      
      </font>
      </div>
      </c:if>
    </ul>
   </div>
   </nav>
   </div>
   

   

</body>
</html>




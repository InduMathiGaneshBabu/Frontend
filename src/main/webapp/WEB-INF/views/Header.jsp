

<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
<title>Header file</title>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css">
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.6/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css"/>
</head>
<body>
<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
 <img src="resources/image/download.png" style="max-width:75px; margin-top: -7px;"/>
   <a class="navbar-brand" href="<c:url value="/image"/>">Minnanu Shop</a>

 
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
      </c:if>
      </c:if>
    </ul>
    </div>
     
     
     <div class="collapse navbar-collapse" id="navbarNav">
    <ul class="nav navbar-nav navbar-right  navbar-dark bg-dark">
    <c:if test="${!sessionScope.loggedIn}">
      <li class="nav-item"><a class="nav-link" href="<c:url value="/login"/>"><i class="fa fa-sign-in"></i>Login</i></a></li>
      </c:if>
      <c:if test="${sessionScope.loggedIn}">
      <div id="userdetail">
      <font color="white">
      Welcome ${sessionScope.username}
      <a href="/perform_logout" class="btn-btn-danger">LogOut</a>
      </font>
      </div>
      </c:if>
    </ul>
   </div>
   

   
</nav>
</body>
</html>




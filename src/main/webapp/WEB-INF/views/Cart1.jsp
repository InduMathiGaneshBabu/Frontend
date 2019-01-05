<%@include file="Header.jsp" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="X-UA-Compatible"content="IE=11">
<meta charset="utf-8">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css" integrity="sha384-GJzZqFGwb1QTTN6wy59ffF1BuGJpLSa9DkKMp0DgiMDm4iYMj70gZWKYbI706tWS" crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.6/umd/popper.min.js" integrity="sha384-wHAiFfRlMFy6i5SRaxvfOCifBUQy1xHdJ/yoi7FRNXMRBu5WHdZYu1hA6ZOblgut" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/js/bootstrap.min.js" integrity="sha384-B0UglyR+jN6CkvvICOB2joaf5I4l3gm9GU6Hc1og6Ls7i6U/mkkaduKaBhlAXv9k" crossorigin="anonymous"></script>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css"/>
<style>
.table {
  border-collapse: collapse;
}

.table,td,th {
  border: 1px solid black;
  color:black;
  opacity:1.4;
  text:bold;
}
.h3
{
color:white;
}
</style>



</head>

<body style=" background: url('resources/image/C4.jpg') no-repeat center center fixed; 
  -webkit-background-size:50px 50px;
  -moz-background-size: cover;
  -o-background-size: cover;
  background-size: cover;">

<h3 align="center" class="h3">CartPage</h3>
<div class="container">
<form>

<table align="center" class="table table-bordered table-light" style="border:3px solid black;">
<thead>
<tr>
<th>Name of User</th>
<th>SL#</th>
<th>ProductName</th>
<th>Price</th>
<th>Quantity</th>
<th>Total price</th>
<th>Operation</th>
</tr>
</thead>
<c:forEach items="${cartlist}" var="cart">
<tr>
<td><b>${cart.username}</b></td>
<td><b>${cart.cartid}</b></td>
<td><b>${cart.productname}</b></td>
<td><b>${cart.price}</b></td>
<td><b>${cart.quantity}</b></td>
<td><b>${cart.quantity * cart.price}</b></td>
<td><a class="btn btn-success" href="<c:url value="/editcart/${cart.cartid}"/>"><i class="fa fa-pencil" aria-hidden="true"></i>Edit</a>
<a class="btn btn-danger" href="<c:url value="/deletecart/${cart.cartid}"/>"><i class="fa fa-trash" aria-hidden="true"></i>Delete</a>
</td>
</tr>
</c:forEach>
<tr>
<td colspan="4"><b>SubTotal</b></td>
<td colspan="3"><i class="fa fa-inr" aria-hidden="true"></i><b><input type="text" value="${grandtotal}"/></b></td>
</tr>
<tr>
<td colspan="4"><a class="btn btn-success" href="<c:url value="/productdisplay"/>"><i class="fa fa-cart-plus" aria-hidden="true"></i>Continue Shopping</a></td>
<td colspan="3"><a class="btn btn-large btn-warning" href="<c:url value="/orderconfirm"/>"><i class="fa fa-check-circle-o" aria-hidden="true"></i>Checkout</a></td>
</tr>
</table>



</form>
</div>
</body>
</html>
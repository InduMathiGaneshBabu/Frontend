<%@include file="Header.jsp"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="X-UA-Compatible"content="IE=11">
<meta charset="utf-8">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-GJzZqFGwb1QTTN6wy59ffF1BuGJpLSa9DkKMp0DgiMDm4iYMj70gZWKYbI706tWS" crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.6/umd/popper.min.js" integrity="sha384-wHAiFfRlMFy6i5SRaxvfOCifBUQy1xHdJ/yoi7FRNXMRBu5WHdZYu1hA6ZOblgut" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" integrity="sha384-B0UglyR+jN6CkvvICOB2joaf5I4l3gm9GU6Hc1og6Ls7i6U/mkkaduKaBhlAXv9k" crossorigin="anonymous"></script>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css"/>

</head>
<body style=" background: url('resources/image/Bg15.jpg') no-repeat center center fixed; 
  -webkit-background-size: cover;
  -moz-background-size: cover;
  -o-background-size: cover;
  background-size: cover;">
<div class="container">
<form>
<h3 align="center">Your Order</h3>
<table align="center" border="1" class="table">
<thead class="thead-dark">
<tr>
<th>Sl#</th>
<th>ProductName</th>
<th>Price</th>
<th>Quantity</th>
<th>TotalPrice</th>
</tr>
</thead>
<tbody>
<c:forEach items="${cartitems}" var="cart">
<tr>
<td>${cart.cartid}</td>
<td>${cart.productname}</td>
<td>${cart.price}</td>
<td>${cart.quantity}</td>
<td>${cart.price * cart.quantity}</td>
</tr>
</c:forEach>
<tr>
<td colspan="4">Total Price</td>
<td>${grandtotal}</td>
</tr>
<tr>
<td><a class="btn btn-success"href="<c:url value="/cart"/>"><i class="icon-pencil"></i>EditCart</a></td>
</tr>
</tbody>
</table>
</form>

<form action="payment" method="post">
<h3 align="center">Payment Detail</h3>
<table align="center">
<tr>
<th>Payment Mode</th>
<td>
<input type="radio" value="COD" name="pmode" />Cash On Delivery
<input type="radio" value="CC" name="pmode" />Credit Card</td>
</tr>
<tr>
<th>CreditCard</th>
<td><input type="text" value="card"/></td>
</tr>
<tr>
<th>CVV</th>
<td><div class="input-group"><input type="text" value="num"/></div></td>
<th>Valid Upto</th>
<td><div class="input-group"><input type="text" value="valid"></div></td></tr>
<tr>
<td colspan="2"><button type="submit" class="btn btn-primary">
 <i class="fa fa-money" aria-hidden="true"></i>
 Pay
</button></td>
</tr>


</table>
</form>
</div>
</body>
</html>
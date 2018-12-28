<%@include file="Header.jsp" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css">
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.6/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css"/>
</head>
<body>

<h3>CartPage</h3>
<form>
<table align="center" border="1">
<tr>
<td>SL#</td>
<td>ProductName</td>
<td>Price</td>
<td>Quantity</td>
<td>TotalPrice</td>
<td>Operation</td>
</tr>
<c:forEach items="${cartlist}" var="cart">
<tr>
<td>${cart.cartid}</td>
<td>${cart.productname}</td>
<td>${cart.price}</td>
<td>${cart.quantity}</td>
<td>${cart.quantity}*${cart.price}</td>
<td><a href="<c:url value="/editcart/${cart.cartid}"/>">Edit</a>
<a href="<c:url value="/deletecart/${cart.cartid}"/>">Delete</a>
</td>
</tr>
</c:forEach>
<tr>
<td colspan="4">SubTotal</td>
<td colspan="2"><input type="text" value="${grandtotal}" /></td>
</tr>

</table>



</form>

</body>
</html>
<%@include file="Header.jsp"%>
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

</head>
<body style=" background: url('resources/image/R1.jpg') no-repeat center center fixed; 
  -webkit-background-size: cover;
  -moz-background-size: cover;
  -o-background-size: cover;
  background-size: cover;">
  <div class="container">
  
<form>
<h3 align="center">Receipt</h3>
<table align="center"  class="table" style=" border: 1px solid black;">
<thead style="  background-color: lightblue;border: 1px solid black;">
<tr >
<th>OrderId</th>
<th>CustomerName</th>
<th>Shipping Address</th>
<th>PaymentMode</th>
<th>OrderDate</th>
<th>Price</th>
</tr>
</thead>
<tr style=" border: 1px solid black;">
<td>${Order.orderid}</td>
<td>${userdetail.username}</td>
<td>${userdetail.address}</td>
<td>${Order.pmode}</td>
<td>${Order.orderdate}</td>
<td>${Order.totalshoppingamount}</td>
</tr>
</table>
</form>
<br/><br/><br/>
<form>
<table align="center" class="table" style=" border: 1px solid black;">
<thead>
<tr style="background-color:lightblue; border: 1px solid black;">

<th>SL#</th>
<th>ProductName</th>
<th>Price</th>
<th>Quantity</th>
<th>price</th>

</tr>
</thead>
<c:forEach items="${listcart}" var="cart">
<tr style=" border: 1px solid black;">

<td>${cart.cartid}</td>
<td>${cart.productname}</td>
<td>${cart.price}</td>
<td>${cart.quantity}</td>
<td>${cart.quantity * cart.price}</td>
</tr>
</c:forEach>
<tr style=" border: 1px solid black;">
<td colspan="4"><b>SubTotal<b></td>
<td colspan="2"><input type="text" value="${grandtotal}" /></td>
</tr>
</table>
</form>

<h3 align="center" style="color:green; font-family:TimesNewRoman;"> Thank u for Shopping in our Site!!</h3>
 <h3 align="center" style="color:lightgreen;font-family:TimesNewRoman;">Visit Again!!</h3>
</div>
</body>
</html>
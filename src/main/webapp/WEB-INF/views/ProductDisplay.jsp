<%@include file="Header.jsp" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
<title>Product display</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="X-UA-Compatible"content="IE=11">
<meta charset="utf-8">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css" integrity="sha384-GJzZqFGwb1QTTN6wy59ffF1BuGJpLSa9DkKMp0DgiMDm4iYMj70gZWKYbI706tWS" crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.6/umd/popper.min.js" integrity="sha384-wHAiFfRlMFy6i5SRaxvfOCifBUQy1xHdJ/yoi7FRNXMRBu5WHdZYu1hA6ZOblgut" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/js/bootstrap.min.js" integrity="sha384-B0UglyR+jN6CkvvICOB2joaf5I4l3gm9GU6Hc1og6Ls7i6U/mkkaduKaBhlAXv9k" crossorigin="anonymous"></script>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css"/>
<style type="text/css">
.img
{
position:relative;
float:left;
width:auto;
height:400px;
}
</style>
</head>
<body style="background:url('resources/image/P4.jpg')">
<h3 align="center" ><font face="TimesNewRoman" color="white" size="7">Product Display</font></h3>
<div class="container">
<div class="row">
<c:forEach items="${productlist}" var="product">
<div class="col-md-4 col-6">
<div class=img>
<a href="<c:url value="totalproductdisplay/${product.productid}"/>"class="d-block mb-4 h-100">
<img class="img-fluid img-thumbnail" style="height:300px; width:300px;"src="<c:url value="/resources/image/${product.productid}.jpg"/>">
<p align="center"> <font face="TimesNewRoman" color="white" size="5">${product.productname} <br/>
${product.price}<i class="fa fa-inr"></i></font></p>
</a>
</div>
</div>
</c:forEach>

</div>

</div>

</body>
</html>
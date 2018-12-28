<%@include file="Header.jsp" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
<title>Product display</title>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css">
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.6/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css"/>
</head>
<body>
<div class="container">
<c:forEach items="${productlist}" var="product">
<div class="col-md-2 column productbox" style="background-color:#ffffff;padding:10px;margin-bottom:10px;-webkit-box-shadow: 0 8px 6px -6px  #999; -moz-box-shadow: 0 8px 6px -6px  #999; box-shadow: 0 8px 6px -6px #999;">
    <img src="<c:url value="/resources/image/${product.productid}.jpg"/>" class="img-responsive">
    <div class="producttitle" style="font-weight:bold;
	padding:5px 0 5px 0;">${product.productname}</div>
    <div class="productprice" style="border-top:1px solid #dadada;
	padding-top:5px;"><div class="pull-right"><a href="<c:url value="totalproductdisplay/${product.productid}"/>" class="btn btn-danger btn-sm" role="button">BUY</a></div><div class="pricetext" style="font-weight:bold;
	font-size:1.4em;">${product.price}</div></div>
</div>
</c:forEach>
</div>
</body>
</html>
<%@include file="Header.jsp"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<!DOCTYPE html>
<html>
<head>
<title>Product page</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="X-UA-Compatible"content="IE=11">
<meta charset="utf-8">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css" integrity="sha384-GJzZqFGwb1QTTN6wy59ffF1BuGJpLSa9DkKMp0DgiMDm4iYMj70gZWKYbI706tWS" crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.6/umd/popper.min.js" integrity="sha384-wHAiFfRlMFy6i5SRaxvfOCifBUQy1xHdJ/yoi7FRNXMRBu5WHdZYu1hA6ZOblgut" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/js/bootstrap.min.js" integrity="sha384-B0UglyR+jN6CkvvICOB2joaf5I4l3gm9GU6Hc1og6Ls7i6U/mkkaduKaBhlAXv9k" crossorigin="anonymous"></script>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css"/>
<style>
.table,td,th,h3 {
  border: 1px solid black;
  color:white;
  opacity:1;
  text:bold;
}
body
{ background-image:url('resources/image/C15.jpg');
  background-position:center;
}

</style>
</head>
<body>
<form:form action="save" modelAttribute="product" method="post" enctype="multipart/form-data">
<table align="center">
<tr>
<td>ProductName</td>
<td><form:input path="productname"/></td>
</tr>
<tr>
<td>Price</td>
<td><form:input path="price"/></td>
</tr>
<tr>
<td>Product Description</td>
<td><form:input path="productdesc"/></td>
</tr>
<tr>
<td>Stock</td>
<td><form:input path="stock"/></td>
</tr>
<tr>
<td>CategoryId</td>
<td><form:select path="categoryid">
<form:option value="0" label="--selectCategory--"/>
<form:options items="${categorylist}"/>
</form:select>
</td>
</tr>
<tr>
<td>SupplierId</td>
<td><form:select path="supplierid">
<form:option value="0" label="--selectSupplier--"/>
<form:options items="${supplierlist}"/>
</form:select>
</td>
</tr>
<tr>
<td>Product Image</td>
<td><form:input type="File" path="pimage"/></td>
</tr>
<tr>
<td>
<a><button class="btn btn-warning" type="submit"><i class="fa fa-floppy-o" aria-hidden="true"></i>
AddProduct</button></a>
</td>
</tr>
</table>
<table align="center" class="table">
<thead>
<tr>
<th>ProductId</th>
<th>ProductName</th>
<th>Price</th>
<th>Stock</th>
<th>ProductDesc</th>
<th>CategoryID</th>
<th>SupplierID</th>
<th>Operation</th>
</tr>
</thead>
<c:forEach items="${productList}" var="product">
<tr>
<td>${product.productid}</td>
<td>${product.productname}</td>
<td>${product.price}</td>
<td>${product.stock}</td>
<td>${product.productdesc}</td>
<td>${product.categoryid}</td>
<td>${product.supplierid}</td>
<td><a class="btn btn-success" href="<c:url value="/editproducts/${product.productid}"/>"><i class="fa fa-pencil" aria-hidden="true"></i>Edit</a>
<a class="btn btn-danger" href="<c:url value="/deleteproducts/${product.productid}"/>"><i class="fa fa-trash" aria-hidden="true"></i>Delete</a>
</td>
</tr>
</c:forEach>
</table>


</form:form>

</body>
</html>
<%@include file="Header.jsp"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Product page</title>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css">
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.6/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css"/>
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
<td>Product Image</td>
<td><form:input type="File" path="pimage"/></td>
</tr>
<tr>
<td>SupplierId</td>
<td><form:input path="supplierid"/></td>
</tr>
<tr>
<td>
<input type="submit" value="addProduct"/>
</td>
</tr>
</table>
<table align="center" border="1">
<tr>
<td>ProductId</td>
<td>ProductName</td>
<td>Price</td>
<td>Stock</td>
<td>ProductDesc</td>
<td>CategoryID</td>
<td>SupplierID</td>
<td>Operation</td>
</tr>
<c:forEach items="${productList}" var="product">
<tr>
<td>${product.productid}</td>
<td>${product.productname}</td>
<td>${product.price}</td>
<td>${product.stock}</td>
<td>${product.productdesc}</td>
<td>${product.categoryid}</td>
<td>${product.supplierid}</td>
<td><a href="<c:url value="/editproducts/${product.productid}"/>">Edit</a>
<a href="<c:url value="/deleteproducts/${product.productid}"/>">Delete</a>
</td>
</tr>
</c:forEach>
</table>


</form:form>

</body>
</html>
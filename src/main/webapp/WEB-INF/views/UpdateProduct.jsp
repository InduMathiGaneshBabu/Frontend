<%@include file="Header.jsp"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<!DOCTYPE html>
<html>
<head>
<title>ProductUpdatePage</title>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css">
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.6/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css"/>
</head>
<body>
<form:form action="<c:url value="/updateproduct"/>" modelAttribute="product1" enctype="multipart/form-data" method="post">
<table>
<tr>
<td colspan="2" align="center"> Product Update Page </td>
</tr>
<tr>
<td>ProductName</td>
<td><form:input path="productname" value="${product.productname}"/></td>
</tr>
<tr>
<td>ProductDescription</td>
<td><form:input path="productdesc" value="${product.productdesc}"/></td>
</tr>
<tr>
<td>Price</td>
<td><form:input path="price" value="${product.price}"/></td>
</tr>
<tr>
<td>Stock</td>
<td><form:input path="stock" value="${product.stock}"/></td>
</tr>
<tr>
<td>CategoryId</td>
<td><form:select path="categoryid" value="${product.categoryid}">
<form:option value="0" label="--select category--"/>
<form:options items="${categorylist}"/>
</form:select>
</td>
</tr>
<tr>
<td>SupplierId</td>
<td><form:input path="supplierid" value="${product.supplierid}"/></td>
</tr>
<tr>
<td>Product Image</td>
<td><form:input type="file" path="pimage" value="${product.pimage}"/></td>
</tr>
<tr>
<td colspan="2" align="center"><input type="submit" value="Update"/></td>
</tr>
</table>
</form:form>
</body>
</html>
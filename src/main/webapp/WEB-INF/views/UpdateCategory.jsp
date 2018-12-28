<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
<title></title>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css">
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.6/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css"/>
</head>
<body>
<h3 align="center">Update Page Of Category</h3>
<form action="<c:url value="/updatecategory"/>" method="post">
<table align="center">
<tr>
<td>CategoryId</td>
<td><input type="text" value="${category.categoryid}" name="categoryId" readonly/></td>
</tr>
<tr>
<td>Category Description</td>
<td><input type="text" value="${category.categorydesc}" name="categoryDesc"/></td>
</tr>
<tr>
<td>Category Name</td>
<td><input type="text" value="${category.categoryname}" name="categoryName"/></td>
</tr>
<tr>
<td colspan="2">
<input type="submit" value="UpdateCategory"/>
</td>
</tr>
</table>
</form>
</body>
</html>
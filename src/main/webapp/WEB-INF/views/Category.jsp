<%@include file="Header.jsp" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
<title>Add the category here</title>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css">
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.6/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css"/>
</head>
<body>
<h3 align="center">Category Page</h3>
<form action="<c:url value="/addCategory"/>" method="post">
<table align="center">
<tr>
<td>Category Name</td>
<td><input type="text" name="categoryName"/></td>
</tr>
<tr>
<td>Category Desc</td>
<td><input type="text" name="categoryDesc"/></td>
</tr>
<tr>
<td>
<input type="submit" value="Add Category"/>
</td>
</tr>
</table>
<table align="center" border="2">
<tr>
<td>Category Id</td>
<td>Category Name</td>
<td>Category Desc</td>
<td>Operations</td>
</tr>
<c:forEach items="${listcategory}" var="category">
<tr>
<td>${category.categoryid}</td>
<td>${category.categoryname}</td>
<td>${category.categorydesc}</td>
<td><a href="<c:url value="/editcategory/${category.categoryid}"/>">Edit</a>
<a href="<c:url value="/deletecategory/${category.categoryid}"/>">Delete</a></td>
</tr>
</c:forEach>
</table>
</form>
</body>
</html>
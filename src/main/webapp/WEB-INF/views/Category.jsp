<%@include file="Header.jsp" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
<title>Add the category here</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="X-UA-Compatible"content="IE=11">
<meta charset="utf-8">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css" integrity="sha384-GJzZqFGwb1QTTN6wy59ffF1BuGJpLSa9DkKMp0DgiMDm4iYMj70gZWKYbI706tWS" crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.6/umd/popper.min.js" integrity="sha384-wHAiFfRlMFy6i5SRaxvfOCifBUQy1xHdJ/yoi7FRNXMRBu5WHdZYu1hA6ZOblgut" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/js/bootstrap.min.js" integrity="sha384-B0UglyR+jN6CkvvICOB2joaf5I4l3gm9GU6Hc1og6Ls7i6U/mkkaduKaBhlAXv9k" crossorigin="anonymous"></script>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css"/>
<style type="text/css">
.table {
  border-collapse: collapse;
}

.table,td,th,h3 {
  border: 1px solid black;
  color:pink;
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
<h3 align="center">Category Page</h3>
<form action="<c:url value="/addCategory"/>" method="post">
<table align="center">
<tr>
<td><b>Category Name</b></td>
<td><b><input type="text" name="categoryName"/></b></td>
</tr>
<tr>
<td><b>Category Desc</b></td>
<td><b><input type="text" name="categoryDesc"/></b></td>
</tr>
<tr align="center">
<td>
<a><button class="btn btn-warning" type="submit"><i class="fa fa-floppy-o" aria-hidden="true"></i>
AddCategory</button></a>
</td>
</tr>
</table>
<br><br>
<table align="center" style="border:2px solid black" class="table">
<thead>
<tr>
<th>Category Id</th>
<th>Category Name</th>
<th>Category Desc</th>
<th>Operations</th>
</tr>
</thead>
<c:forEach items="${listcategory}" var="category">
<tr>
<td><b>${category.categoryid}</b></td>
<td><b>${category.categoryname}</b></td>
<td><b>${category.categorydesc}</b></td>
<td><a class="btn btn-success" href="<c:url value="/editcategory/${category.categoryid}"/>"><i class="fa fa-pencil" aria-hidden="true"></i>Edit</a>
<a  class="btn btn-danger" href="<c:url value="/deletecategory/${category.categoryid}"/>"><i class="fa fa-trash" aria-hidden="true"></i>Delete</a></td>
</tr>
</c:forEach>
</table>
</form>
</body>
</html>
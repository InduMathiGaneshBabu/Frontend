<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
<title></title>
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
  color:black;
  opacity:1;
  text:bold;
}
body
{ 
background-image:url('resources/image/C15.jpg');
  background-position:center;
}

</style>
</head>
<body>
<h3 align="center">Update Page Of Category</h3>
<div class="container">
<form action="<c:url value="/updatecategory"/>" method="post">
<table align="center" class="table">
<tr>
<th>CategoryId</th>
<td><input type="text" value="${category.categoryid}" name="categoryId" readonly/></td>
</tr>
<tr>
<th>Category Description</th>
<td><input type="text" value="${category.categorydesc}" name="categoryDesc"/></td>
</tr>
<tr>
<th>Category Name</th>
<td><input type="text" value="${category.categoryname}" name="categoryName"/></td>
</tr>
<tr>
<td colspan="2">
<a><button class="btn btn-warning" type="submit"><i class="fa fa-floppy-o" aria-hidden="true"></i>
UpdateCategory</button></a>
</td>
</tr>
</table>
</form>
</div>
</body>
</html>
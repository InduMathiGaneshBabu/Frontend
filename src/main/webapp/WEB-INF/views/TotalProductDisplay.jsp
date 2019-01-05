
<%@include file="Header.jsp"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
<!DOCTYPE html>
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

<script type="text/javascript">
function incrementValue()
{
    var value = parseInt(document.getElementById('number').value);
    value = isNaN(value) ? 0 : value;
    if(value< ${product.stock}){
        value++;
            document.getElementById('number').value = value;
                    
    }
}
function decrementValue()
{
    var value = parseInt(document.getElementById('number').value);
    value = isNaN(value) ? 0 : value;
    if(value>1){
        value--;
            document.getElementById('number').value = value;
    }

}
</script>


</head>
    <body>
    <section class="product-block">
    <div class="container" style="background: url('resources/image/Bg12.jpg')">
    <div class="row">
     
    <div class="col-md-4 product-sec">
    <a><img  style="height:500px; width:400px;" src="<c:url value="/resources/image/${product.productid}.jpg"/>"/></a>
    </div>
   
   
    <div class="col-md-8 banner-sec" >
     <form action="<c:url value="/addtocart/${product.productid}"/>" method="post">
    <h2 class="text-center">${product.productname}</h2><br/>
   <p align="center"><font color="black" size="6" face="garamond">${product.productdesc}</font></p>
   
  <p align="center"> <font face="verdana" size="4">Quantity </font><input type="button" onclick="decrementValue()" value="-" align="center"/>
   <input type="text" name="quantity" value=1 max="${product.stock}" id="number" align="center"/>
   <input type="button" onclick="incrementValue()" value="+" align="center"/>
   <br/><br/><br/>
   <button type="submit" class="btn btn-warning"><i class="fa fa-shopping-cart" aria-hidden="true"></i>
   AddtoCart</button>
   </p>
   </form>
    </div>
    
    </div>
    </div>
    </section>
    </body>
</html>
        
                    
                    
                    
                  
                    
                    
                                                        
              
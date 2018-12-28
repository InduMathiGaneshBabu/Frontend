<%@include file="Header.jsp"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
<link href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
<script type="text/javascript">
$(document).ready(function(){
    //-- Click on detail
    $("ul.menu-items > li").on("click",function(){
        $("ul.menu-items > li").removeClass("active");
        $(this).addClass("active");
    })

    $(".attr,.attr2").on("click",function(){
        var clase = $(this).attr("class");

        $("." + clase).removeClass("active");
        $(this).addClass("active");
    })

    //-- Click on QUANTITY
    $(".btn-minus").on("click",function(){
        var now = $(".section > div > input").val();
        if ($.isNumeric(now)){
            if (parseInt(now) -1 > 0){ now--;}
            $(".section > div > input").val(now);
        }else{
            $(".section > div > input").val("1");
        }
    })            
    $(".btn-plus").on("click",function(){
        var now = $(".section > div > input").val();
        if ($.isNumeric(now)){
            $(".section > div > input").val(parseInt(now)+1);
        }else{
            $(".section > div > input").val("1");
        }
    })                        
}) </script>
</head>
 <body>
    <form action="<c:url value="/updatecart/${cart.cartid}"/>" method="post">
        <div class="container" style="margin-top:0px !important;">
        	<div class="row" style="padding:0 !important;">
               <div class="col-xs-4 item-photo" style="display:flex;justify-content:center;align-items:center;border-right:1px solid #f6f6f6;">
                    <img style="max-width:100%;" src="<c:url value="/resources/image/${cart.productid}.jpg"/>"/>
                </div>
                <div class="col-xs-5" style="border:0px solid gray">
                    <h6 class="title-price" style="margin-top:30px;margin-bottom:0;color:black"><small>Price</small></h6>
                    <h3 style="margin-top:0px;">${cart.price}</h3>
        <div class="section" style="padding-bottom:20px;">
                        <h6 class="title-attr" style="margin-top:30px;margin-bottom:0;color:black"><small>Quantity</small></h6>                    
                        <div>
                            <div class="btn-minus"><span class="glyphicon glyphicon-minus"></span></div>
                            <input type="text" value="${cart.quantity}" name="quantity"/>
                            <div class="btn-plus"><span class="glyphicon glyphicon-plus"></span></div>
                        </div>
                    </div>                
        <input type="submit" value="UpdateCart"/>
          </div>                              
       </div>
        </div>   
        </form>     
    </body>





</html>
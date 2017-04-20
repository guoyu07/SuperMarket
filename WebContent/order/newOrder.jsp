<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
    String staffname = (String)session.getAttribute("staffname");
    if(staffname==null){
    	pageContext.forward("index.html");
    }
%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <!-- Meta, title, CSS, favicons, etc. -->
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <title>NewOrder</title>
    <%--<link href="../css/newOrder.css" rel="stylesheet">--%>
    <!-- Bootstrap -->
    <link href="../css/bootstrap.min.css" rel="stylesheet">
    <!-- Font Awesome -->
    <link rel="stylesheet" href="http://fontawesome.io/assets/font-awesome/css/font-awesome.css">
    <!-- NProgress -->
    <link href="../css/nprogress.css" rel="stylesheet">
    <!-- iCheck -->
    <link href="../css/green.css" rel="stylesheet">

    <!-- Custom Theme Style -->
    <link href="../css/custom.min.css" rel="stylesheet">

    <script type="text/javascript">
        function additem(){
            var tb=document.getElementById('sales');
            var tr=document.createElement('tr');
            tr.setAttribute('class','class="even pointer"');
            var arr=[];
            for(var i=0;i<2;i++){
                arr[i]=document.createElement('td');
                arr[i+2]=document.createElement('input');
                arr[i+2].setAttribute('type','text');
            }
            var td=document.createElement('td');
            var img=document.createElement('img');
            td.setAttribute('class','');
            arr[2].setAttribute('name','itemID');
            arr[3].setAttribute('name','itemQty');
            arr[2].setAttribute('class','col-md-12 col-sm-12 col-xs-12 form-group has-feedback');
            arr[3].setAttribute('class','col-md-12 col-sm-12 col-xs-12 form-group has-feedback');

            img.setAttribute('src','delete2.jpeg');
            img.setAttribute('class','last');
            img.onclick=function(){
                tb.removeChild(this.parentNode.parentNode);
            }

            arr[0].appendChild(arr[2]);
            arr[1].appendChild(arr[3]);
            td.appendChild(img);
            tr.appendChild(arr[0]);
            tr.appendChild(arr[1]);
            tr.appendChild(td);
            tb.appendChild(tr);
        }
    </script>



</head>
<body  style="background:transparent;">
<div class="row">
    <div class="col-md-12 col-sm-12 col-xs-12">
        <div class="x_panel">
            <div class="x_title">
                <h2>Edit Page<small>please input new regular parameter for the Order</small></h2>
                <ul class="nav navbar-right panel_toolbox">
                    <li>
                        <a class="collapse-link"><i class="fa fa-chevron-up"></i></a>
                    </li>
                </ul>
                <div class="clearfix"></div>
            </div>
            <div class="x_content">
                <br>
                <%--<form id="demo-form2" data-parsley-validate class="form-horizontal form-label-left" action="preview.jsp" method=post>--%>
                  <%--&lt;%&ndash;<div id="sales">&ndash;%&gt;--%>
                      <%--&lt;%&ndash;<div class="form-group">&ndash;%&gt;--%>
                                  <%--&lt;%&ndash;<label class="control-label col-md-1 col-sm-1 col-xs-3" id="item1">Item ID<span class="required">*</span>&ndash;%&gt;--%>
                                  <%--&lt;%&ndash;</label>&ndash;%&gt;--%>
                                  <%--&lt;%&ndash;<div class="col-md-1 col-sm-1 col-xs-1">&ndash;%&gt;--%>
                                      <%--&lt;%&ndash;<input type="text" name='itemID' required="required" class="form-control col-md-1 col-lg-1" >&ndash;%&gt;--%>
                                  <%--&lt;%&ndash;</div>&ndash;%&gt;--%>
                                  <%--&lt;%&ndash;<label class="control-label col-md-1 col-sm-1 col-xs-3" id="quantity1">Quantity<span class="required">*</span>&ndash;%&gt;--%>
                                  <%--&lt;%&ndash;</label>&ndash;%&gt;--%>
                                  <%--&lt;%&ndash;<div class="col-md-1 col-sm-1 col-xs-1">&ndash;%&gt;--%>
                                      <%--&lt;%&ndash;<input type="text" name='itemQty' required="required" class="form-control col-md-1 col-lg-1" >&ndash;%&gt;--%>
                                  <%--&lt;%&ndash;</div>&ndash;%&gt;--%>
                                  <%--&lt;%&ndash;<div class="col-md-1 col-sm-1 col-xs-1">&ndash;%&gt;--%>
                                      <%--&lt;%&ndash;<button id="remove"  class="btn btn-success">Remove</button>&ndash;%&gt;--%>
                                  <%--&lt;%&ndash;</div>&ndash;%&gt;--%>
                      <%--&lt;%&ndash;</div>&ndash;%&gt;--%>
                  <%--&lt;%&ndash;</div>&ndash;%&gt;--%>
                    <%----%>
                  <%--</form>--%>


                <form action="preview.jsp" method="post" class="form-horizontal form-label-left input_mask">
                    <table id="sales" align="center" class="table table-striped jambo_table bulk_action">
                        <thead>
                        <tr class="headings">
                            <th class="column-title">ItemID</th>
                            <th class="column-title">Quantity</th>
                        </tr>
                        </thead>
                    </table>
                    <br>
                    <div class="col-md-6 col-sm-6 col-xs-12 col-md-offset-6">
                        <input type="submit" class="btn btn-success" value="Submit">
                    </div>
                </form>
                   <br>
                   <div class="col-md-6 col-sm-6 col-xs-12 col-md-offset-6">
                     <button onclick="additem()" class="btn btn-primary">AddItem</button>
                   </div>
                      <%--<div class="form-group">--%>
                        <%--<div class="col-md-6 col-sm-6 col-xs-12 col-md-offset-5">--%>
                            <%--<input type="submit" class="btn btn-success" value="Submit">--%>
                            <%--<span> </span>--%>
                            <%--<button id="add" onclick="additem()" class="btn btn-success">Add</button>--%>
                        <%--</div>--%>
                      <%--</div>--%>
            </div>
        </div>
    </div>
</div>
<!-- jQuery -->
<script src="../css/js/jquery.min.js"></script>
<!-- Bootstrap -->
<script src="../css/js/bootstrap.min.js"></script>
<!-- FastClick -->
<script src="../css/js/fastclick.js"></script>
<!-- NProgress -->
<script src="../css/js/nprogress.js"></script>
<!-- iCheck -->
<script src="../css/js/icheck.min.js"></script>

<!-- Custom Theme Scripts -->
<script src="../css/js/custom.min.js"></script>

<%--<script>--%>
    <%--$("#add").click(function(){--%>
        <%--$("#sales").append(--%>
            <%--"<div class='form-group'>"+--%>
            <%--"<label class='control-label col-md-1 col-sm-1 col-xs-3'>"+'Item ID'+"<span class='required'>"+'*'+"</span>"+--%>
            <%--"</label>"+--%>
            <%--"<div class='col-md-1 col-sm-1 col-xs-1'>"+--%>
            <%--"<input type='text' name='itemID' required='required' class='form-control col-md-1 col-lg-1'>"+--%>
            <%--"</div>"+--%>
            <%--"<label class='control-label col-md-1 col-sm-1 col-xs-3'>"+"Quantity"+"<span class='required'>"+"*"+"</span>"+--%>
            <%--"</label>"+--%>
            <%--"<div class='col-md-1 col-sm-1 col-xs-1'>"+--%>
            <%--"<input type='text' name='itemQty' required='required' class='form-control col-md-1 col-lg-1'>"+--%>
            <%--"</div>"+--%>
            <%--"<div class='col-md-1 col-sm-1 col-xs-1'>"+--%>
            <%--"<button id='remove'  class='btn btn-success'>"+"Remove"+"</button>"+--%>
            <%--"</div>"+--%>
            <%--"</div>"--%>
        <%--);--%>
    <%--});--%>
   <%--$("#remove").click(function () {--%>
       <%--if($(this).parent().parent())--%>
       <%--{--%>
        <%--$(this).parent().parent().remove();--%>
       <%--}--%>
    <%--});--%>
<%--</script>--%>
</body>
</html>

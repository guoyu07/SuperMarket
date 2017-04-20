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
<meta charset="UTF-8">
<title>Manage</title>
    <!-- Bootstrap -->
    <link href="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <!-- Font Awesome -->
    <link rel="stylesheet" href="http://fontawesome.io/assets/font-awesome/css/font-awesome.css">
    <!-- NProgress -->
    <link href="css/nprogress.css" rel="stylesheet">
    <!-- iCheck -->
    <link href="css/green.css" rel="stylesheet">

    <!-- bootstrap-progressbar -->
    <link href="css/bootstrap-progressbar-3.3.4.min.css" rel="stylesheet">
    <!-- JQVMap -->
    <link href="css/jqvmap.min.css" rel="stylesheet"/>
    <!-- bootstrap-daterangepicker -->
    <link href="css/daterangepicker.css" rel="stylesheet">

    <!-- Custom Theme Style -->
    <link href="css/custom.min.css" rel="stylesheet">

</head>
<body class="nav-md">
<div class="container body">
    <div class="main_container">
        <div class="col-md-3 left_col">
            <div class="left_col scroll-view">
                <div class="navbar nav_title" style="border: 0;">
                    <div class="clearfix"></div>
                    <div class="profile clearfix">
                        <div class="profile_pic">
                            <img src="images/img.jpg" class="img-circle profile_img">
                        </div>
                        <div class="profile_info">
                            <span>Welcome,</span>
                            <h2><% out.print(staffname); %> </h2>
                        </div>
                    </div>
                    <br/>
    <div>
        <div id="sidebar-menu" class="main_menu_side hidden-print main_menu">
            <div class="menu_section">
                <h3>General</h3>
                <ul class="nav side-menu">
                        <li><a><i class="fa fa-clone"></i> POS MANAGEMENT<span class="fa fa-chevron-down"></span></a>
                            <ul class="nav child_menu">
                                <li><a href="order/newOrder.jsp" target="content">New Order</a></li>
                                <li><a href="order/showOrder.jsp" target="content">Show Order</a></li>
                                <li><a href="order/forSearch.jsp" target="content">Search Order</a></li>
                            </ul>
                        </li>
                        <br>
                        <li><a><i class="fa fa-clone"></i> INVENTORY<span class="fa fa-chevron-down"></span></a>
                               <ul class="nav child_menu">
                                   <li><a a href="inventory/invManage.jsp" target="content">Inventory Management</a></li>
                               </ul>
                        </li>
                </ul>
             </div>
                     </div>
                  </div>
                </div>
            </div>
        </div>
        <div class="menu_section">
        </div>
        <div class="top_nav">
            <div class="nav_menu">
                <nav>
                    <div class="nav toggle">
                        <a data-toggle="tooltip" data-placement="top" title="Logout" href="">
                            <span class="glyphicon glyphicon-off" aria-hidden="true"></span>
                        </a>
                    </div>
                           <ul class="nav navbar-nav navbar-right">
                             <li class="">
                              <a  class="user-profile dropdown-toggle" data-toggle="dropdown" aria-expanded="false">
                                <img src="images/img.jpg" ><% out.print(staffname); %>
                                <span class=" fa fa-angle-down"></span>
                              </a>
                             </li>
                            </ul>
                        </li>
                    </ul>
                </nav>
            </div>
        </div>
        <div id="display" class="right_col" role="main" style="min-height: 1176px">
            <div class="">
                <iframe name="content" class="x_content" frameborder="0" width="100%" height="800px" src="order/showOrder.jsp" allowtransparency="true">
                </iframe>
            </div>
        </div>
        <!-- footer content -->
        <footer>
            <div class="pull-right">
                    <p>Manage Your Market! ©2017 All Rights Reserved.</p>
            </div>
            <div class="clearfix"></div>
        </footer>
        <!-- /footer content -->
    </div>
  </div>


<!-- jQuery -->
<script src="css/js/jquery.min.js"></script>
<!-- Bootstrap -->
<script src="css/js/bootstrap.min.js"></script>
<!-- FastClick -->
<script src="css/js/fastclick.js"></script>
<!-- NProgress -->
<script src="css/js/nprogress.js"></script>
<!-- iCheck -->
<script src="css/js/icheck.min.js"></script>

<!-- Custom Theme Scripts -->
<script src="css/js/custom.min.js"></script>
 </body>
</html>
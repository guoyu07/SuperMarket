<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%  String cateID=request.getParameter("cateID"); %>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <!-- Meta, title, CSS, favicons, etc. -->
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <title>InvManagement</title>

    <!-- Bootstrap -->
    <link href="../../css/bootstrap.min.css" rel="stylesheet">
    <!-- Font Awesome -->
    <link rel="stylesheet" href="http://fontawesome.io/assets/font-awesome/css/font-awesome.css">
    <!-- NProgress -->
    <link href="../../css/nprogress.css" rel="stylesheet">
    <!-- iCheck -->
    <link href="../../css/green.css" rel="stylesheet">

    <!-- Custom Theme Style -->
    <link href="../../css/custom.min.css" rel="stylesheet">
</head>
<body  style="background:transparent;">
<div class="row">
    <div class="col-md-12 col-sm-12 col-xs-12">
        <div class="x_panel">
            <div class="x_title">
    <h2>Edit Page<small>please input new regular name for the category</small></h2>
    <ul class="nav navbar-right panel_toolbox">
        <li>
            <a class="collapse-link"><i class="fa fa-chevron-up"></i></a>
        </li>
    </ul>
    <div class="clearfix"></div>
</div>
<div class="x_content">
    <br />
    <form id="demo-form2" data-parsley-validate class="form-horizontal form-label-left" action="cateUpdate.jsp" method=post>

        <div class="form-group">
            <label class="control-label col-md-3 col-sm-3 col-xs-12" >Category ID<span class="required">*</span>
            </label>
            <div class="col-md-6 col-sm-6 col-xs-12">
                <input type="text" name=cateID value="<%=cateID%>" readonly required="required" class="form-control col-md-7 col-xs-12">
            </div>
        </div>
        <div class="form-group">
            <label class="control-label col-md-3 col-sm-3 col-xs-12">Category Name<span class="required">*</span>
            </label>
            <div class="col-md-6 col-sm-6 col-xs-12">
                <input type="text" name=cateName required="required" class="form-control col-md-7 col-xs-12">
            </div>
        </div>
        <div class="form-group">
           <div class="col-md-6 col-sm-6 col-xs-12 col-md-offset-3">
            <input type="submit" class="btn btn-success" value="Update">
          </div>
        </div>
    </form>
</div>
        </div>
    </div>
</div>
<!-- jQuery -->
<script src="../../css/js/jquery.min.js"></script>
<!-- Bootstrap -->
<script src="../../css/js/bootstrap.min.js"></script>
<!-- FastClick -->
<script src="../../css/js/fastclick.js"></script>
<!-- NProgress -->
<script src="../../css/js/nprogress.js"></script>
<!-- iCheck -->
<script src="../../css/js/icheck.min.js"></script>

<!-- Custom Theme Scripts -->
<script src="../../css/js/custom.min.js"></script>
</body>
</html>
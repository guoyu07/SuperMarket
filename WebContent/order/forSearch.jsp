<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <!-- Meta, title, CSS, favicons, etc. -->
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <title>Forsearch</title>

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
</head>
<body  style="background:transparent;">
    <form action="showOrder.jsp" method=post>
        <table align="center">
            <tr>
                <td><a class="form-control">Oder ID</a></td>
                <td>
                    <input type=text class="form-control" placeholder="Search for..." name="SearchID"/>
                </td>
                <td>
                    <span class="input-group-btn">
                      <input class="btn btn-default" type="submit" value="Go" />
                    </span>
                </td>
            </tr>
        </table>
    </form>
</body>
</html>
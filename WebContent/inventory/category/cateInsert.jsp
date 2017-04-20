<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%
String staffname = (String)session.getAttribute("staffname");
if(staffname==null){
	pageContext.forward("index.html");
}
String cateName = request.getParameter("cateName");
try {  
    Class.forName("com.mysql.jdbc.Driver");  
    String url = "jdbc:mysql://localhost:3306/supermarket";  
    String usename = "root";  
    String psw = "fuermosi";
    Connection conn = DriverManager.getConnection(url,usename,psw);  
    if(conn != null){           
    	String sql1="select max(Category_ID) as maxID from Category";
        Statement stmt1 = conn.createStatement();  
        ResultSet rs1=stmt1.executeQuery(sql1);  
        String maxID=null;
        if(rs1.next()){
        	maxID=rs1.getString("maxID");
        }
        if(maxID==null){
        	maxID=String.valueOf(0);
        }
        String currentID=Integer.toString(Integer.parseInt(maxID)+1);
        String sql2="insert into Category values ('"+currentID+"' , '"+cateName+"')";
        Statement stmt2 = conn.createStatement();
        int count=stmt2.executeUpdate(sql2);
        if(count>0){
        	out.println("insert successfully!");
        }
        conn.close();  
    }else{  
        out.println("can't connect with database!");                          
    }  
}catch (ClassNotFoundException e) {  
    e.printStackTrace();  
}catch (SQLException e) {  
    e.printStackTrace();  
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

    <title>ItemInsert</title>

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
<body style="background:transparent;">
<div align="center" >
    <a href="../invManage.jsp" class="btn btn-success" >Go Back</a>
</div>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.*,java.util.Date,java.sql.*,java.text.*"%>
<% 
    String staffname = (String)session.getAttribute("staffname");
    if(staffname==null){
    	pageContext.forward("index.html");
    }
    String pay = request.getParameter("pay");
    String[] itemIDArr=(String[])session.getAttribute("itemIDArr");
    String[] itemQtyArr=(String[])session.getAttribute("itemQtyArr");
    String[] itemPriceArr=(String[])session.getAttribute("itemPriceArr");
    String staffID=(String)session.getAttribute("staffID");
    String storeID=(String)session.getAttribute("storeID");
    String salesID=(String)session.getAttribute("salesID");
    String amount=(String)session.getAttribute("amount");
    
    try {  
        Class.forName("com.mysql.jdbc.Driver");   
        String url = "jdbc:mysql://localhost:3306/supermarket?useUnicode=true&characterEncoding=utf-8&useSSL=false";
        String usename = "root";  
        String psw = "fuermosi";
        Connection conn = DriverManager.getConnection(url,usename,psw);  
        String sql=null;
        Statement stmt=null;
        ResultSet rs=null;
        int count=0;
        boolean fgSales=false;
        boolean fgSalesItem=false;
        boolean fgInv=false;
        if(conn != null){         
        	Timestamp tp =Timestamp.valueOf(new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date()));
        	sql="insert into Sales_Memo values ('"+salesID+"' , '"+storeID+"' , '"+tp+"' , '"+pay+"' , '"+amount+"' , '"+staffID+"')";
        	stmt=conn.createStatement();
        	count=stmt.executeUpdate(sql);
            if(count>0){
            	fgSales=true;
            }       
            
            
            for(int i=0;i<itemIDArr.length;i++){
            	sql="insert into Sales_Item values ('"+salesID+"' , '"+itemIDArr[i]+"' , '"+itemPriceArr[i]+"' , '"+itemQtyArr[i]+"')";
            	stmt=conn.createStatement();
                count=stmt.executeUpdate(sql);
                if(count>0){
                	fgSalesItem=true;
                }
            }
            
            String invQtyArr[]=new String[itemIDArr.length];
            for(int i=0;i<itemIDArr.length;i++){
            	sql="select * from Item where Item_ID='"+itemIDArr[i]+"'";
            	stmt=conn.createStatement();
                rs=stmt.executeQuery(sql);  
                if(rs.next()){  
                	 invQtyArr[i]=rs.getString("Inventory_Qty");
                }
            }
            
            Double newInv[]=new Double[itemIDArr.length];
            for(int i=0;i<itemIDArr.length;i++){
            	newInv[i]=Double.parseDouble(invQtyArr[i])-Double.parseDouble(itemQtyArr[i]);
            	sql="update Item set Inventory_Qty='"+newInv[i]+"' where Item_ID='"+itemIDArr[i]+"'";
            	stmt=conn.createStatement();
            	count=stmt.executeUpdate(sql);
                if(count>0){
                	fgInv=true;
                }
            }
            
            if(fgSales&&fgSalesItem&&fgInv){
            	out.print("successfully!");

            }
            conn.close();  
        }else{  
            out.print("can't connect with database!");
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

    <title>settlement</title>

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
    <a href="./showOrder.jsp" class="btn btn-success" >Go Back</a>
</div>
</body>
</html>
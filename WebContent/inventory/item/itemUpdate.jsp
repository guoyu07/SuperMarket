<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%
String staffname = (String)session.getAttribute("staffname");
if(staffname==null){
	pageContext.forward("index.html");
}
String itemID = request.getParameter("itemID");
String itemName = request.getParameter("itemName");
String cateID = request.getParameter("cateID");
String itemPrice = request.getParameter("itemPrice");
String itemQty = request.getParameter("itemQty");
String location = request.getParameter("location");
try {  
    Class.forName("com.mysql.jdbc.Driver");  
    String url = "jdbc:mysql://localhost:3306/supermarket?useUnicode=true&characterEncoding=utf-8&useSSL=false";
    String usename = "root";  
    String psw = "fuermosi";
    Connection conn = DriverManager.getConnection(url,usename,psw);  
    if(conn != null){           
        String sql="update Item set Item_Name='"+itemName+"', Selling_Price='"+itemPrice+"', Inventory_Qty='"+itemQty+"', Location='"+location+"' where Item_ID='"+itemID+"'";
        Statement stmt = conn.createStatement();
        int count=stmt.executeUpdate(sql);
        if(count>0){
        	out.println("update successfully!");
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
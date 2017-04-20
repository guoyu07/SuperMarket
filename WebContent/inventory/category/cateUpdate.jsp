<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.lang.*,java.util.*,java.sql.*"%>
<%
String staffname = (String)session.getAttribute("staffname");
if(staffname==null){
	pageContext.forward("index.html");
}
String cateID = request.getParameter("cateID");
String cateName = request.getParameter("cateName");
try {  
    Class.forName("com.mysql.jdbc.Driver");  
    String url = "jdbc:mysql://localhost:3306/supermarket";  
    String usename = "root";  
    String psw = "fuermosi";
    Connection conn = DriverManager.getConnection(url,usename,psw);  
    if(conn != null){           
        String sql="update Category set Category_Name='"+cateName+"' where Category_ID='"+cateID+"'";
        Statement stmt = conn.createStatement();
        int count=stmt.executeUpdate(sql);
        if(count>0){
        	out.println("Update successfully!");
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
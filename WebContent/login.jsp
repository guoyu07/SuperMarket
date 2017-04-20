<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%
    String staffname = request.getParameter("staffname");
    String pwd = request.getParameter("pwd");
    
    try {  
        // 加载数据库驱动，注册到驱动管理器  
        Class.forName("com.mysql.jdbc.Driver");  
        // 数据库连接字符串  
        String url = "jdbc:mysql://localhost:3306/supermarket?useUnicode=true&characterEncoding=utf-8&useSSL=false";
        // 数据库用户名  
        String usename = "root";  
        // 数据库密码  
        String psw = "fuermosi";
        // 创建Connection连接  
        Connection conn = DriverManager.getConnection(url,usename,psw);  
        // 判断 数据库连接是否为空  
        if(conn != null){           
        	String sql="select * from Staff where Staff_Name='"+staffname+"' and Password='"+ pwd + "'";  
            Statement stmt = conn.createStatement();  
            ResultSet rs=stmt.executeQuery(sql);  
            if(rs.next()){  
            	session.setAttribute("staffname",staffname);
            	pageContext.forward("manage.jsp");              
            }else{  
                pageContext.forward("index.html");
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
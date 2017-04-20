<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<% 
    String staffname = (String)session.getAttribute("staffname");
    if(staffname==null){
    	pageContext.forward("index.html");
    }
    
    String[] itemIDArr = request.getParameterValues("itemID");
    String[] itemQtyArr = request.getParameterValues("itemQty");
    session.setAttribute("itemIDArr",itemIDArr);
    session.setAttribute("itemQtyArr",itemQtyArr);
    
    String staffID=null;
    String storeID=null;
    String salesID=null;
    String[] itemPriceArr=new String[itemIDArr.length];
    Double amount=0.00;
    
    try {  
        Class.forName("com.mysql.jdbc.Driver");   
        String url = "jdbc:mysql://localhost:3306/supermarket?useUnicode=true&characterEncoding=utf-8&useSSL=false";
        String usename = "root";  
        String psw = "fuermosi";
        Connection conn = DriverManager.getConnection(url,usename,psw);  
        String sql=null;
        Statement stmt=null;
        ResultSet rs=null;
        if(conn != null){           
        	sql="select * from Staff where Staff_Name='"+staffname+"'";  
        	stmt=conn.createStatement();
            rs=stmt.executeQuery(sql);  
            if(rs.next()){  
            	 staffID=rs.getString("Staff_ID");
            	 storeID=rs.getString("Store_ID");
            }         
            session.setAttribute("staffID",staffID);
            session.setAttribute("storeID",storeID);
            
            sql="select max(SalesMemo_ID) as maxID from Sales_Memo";
            stmt=conn.createStatement();
            rs=stmt.executeQuery(sql);  
            String maxID=null;
            if(rs.next()){
            	maxID=rs.getString("maxID");
            }
            if(maxID==null){
            	maxID=String.valueOf(0);
            }
            salesID=Integer.toString(Integer.parseInt(maxID)+1);
            session.setAttribute("salesID",salesID);
            
            for(int i=0;i<itemIDArr.length;i++){
            	sql="select * from Item where Item_ID='"+itemIDArr[i]+"'";
            	stmt=conn.createStatement();
                rs=stmt.executeQuery(sql);  
                if(rs.next()){  
                	 itemPriceArr[i]=rs.getString("Selling_Price");
                }
            }
            session.setAttribute("itemPriceArr",itemPriceArr);
            
            for(int i=0;i<itemIDArr.length;i++){
            	amount=amount+Double.parseDouble(itemQtyArr[i])*Double.parseDouble(itemPriceArr[i]);
            }
            session.setAttribute("amount",String.valueOf(amount));
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

    <title>Preview</title>

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
<div class="row">
    <div class="col-md-12 col-sm-12 col-xs-12">
        <div class="x_panel">
            <div class="x_title">
                <h2>Order<small>please input new regular parameter for the Order</small></h2>
                <ul class="nav navbar-right panel_toolbox">
                    <li>
                        <a class="collapse-link"><i class="fa fa-chevron-up"></i></a>
                    </li>
                </ul>
                <div class="clearfix"></div>
            </div>
            <div class="x_content">
                <div class="table-responsive">
                    <table class="table table-striped jambo_table bulk_action">
                        <thead>
                        <tr class="headings">
                            <th class="column-title">Staff ID</th>
                            <th class="column-title">Store ID</th>
                            <th class="column-title">SalesMemo ID</th>
                            <th class="column-title no-link last"><span class="nobr">Total Amount</span></th>
                        </tr>
                        </thead>
                        <tr class="even pointer">
                            <td><%=staffID%></td>
                            <td><%=storeID%></td>
                            <td><%=salesID%></td>
                            <td><%=String.valueOf(amount)%></td>
                        </tr>
                    </table>
                </div>
            </div>
        </div>
        <br>
        <div class="x_panel">
            <div class="x_title">
                <h2>Order Item<small>please input new regular parameter for the OrderItem</small></h2>
                <ul class="nav navbar-right panel_toolbox">
                    <li>
                        <a class="collapse-link"><i class="fa fa-chevron-up"></i></a>
                    </li>
                </ul>
                <div class="clearfix"></div>
            </div>
            <div class="x_content">
                <div class="table-responsive">
                    <table class="table table-striped jambo_table bulk_action">
                        <thead>
                        <tr class="headings">
                            <th class="column-title">Item ID</th>
                            <th class="column-title">Price</th>
                            <th class="column-title no-link last"><span class="nobr">Quantity</span></th>
                        </tr>
                        </thead>
                            <%
                               for(int i=0;i<itemIDArr.length;i++){
                            %>
                        <tr>
                            <td><%=itemIDArr[i]%></td>
                            <td><%=itemPriceArr[i]%></td>
                            <td><%=itemQtyArr[i]%></td>
                        </tr>
                            <%
                            }%>
                    </table>
                </div>
            </div>
        </div>
        <br>
        <form id="demo-form2" data-parsley-validate class="form-horizontal form-label-left" action="settlement.jsp" method=post>
            <table align="center">
                <tr>
                    <td><a class="form-control">PayMent Method</a></td>
                    <td>
                        <input type=text class="form-control" placeholder="1 or 2 or 3..." name="pay"/>
                    </td>
                    <td>
                            <span class="input-group-btn">
                                <input class="btn btn-success" type="submit" value="Submit" />
                            </span>
                    </td>
                </tr>
            </table>
        </form>
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
</body>
</html>
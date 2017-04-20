<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="lib.Order"%>
<%
String staffname = (String)session.getAttribute("staffname");
if(staffname==null){
	pageContext.forward("index.html");
}

String SearchID = request.getParameter("SearchID");

Connection conn=null;
PreparedStatement ps=null;
ResultSet rs=null;
try {
    Class.forName("com.mysql.jdbc.Driver");
    conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/supermarket?useUnicode=true&characterEncoding=utf-8&useSSL=false", "root","fuermosi");
    String sql;
    if(SearchID!=null){
    	sql="select * from Sales_Memo where SalesMemo_ID='"+SearchID+"'";
    }else{
    	sql="select * from Sales_Memo";
    }
    ps=conn.prepareStatement(sql);
    rs=ps.executeQuery();
    List<Order> orderlist= new ArrayList<Order>();
    Order order=null;
    while(rs.next()){
        order=new Order(rs.getString("SalesMemo_ID"),rs.getString("Store_ID"),rs.getString("Date"),rs.getString("PaymentMethod_ID"),rs.getString("Total_Amount"),rs.getString("Staff_ID"));
        orderlist.add(order);
    }
    request.setAttribute("orderlist",orderlist);
} catch (Exception e) {
    e.printStackTrace();
}finally{
    if(conn !=null){
        try {
            conn.close();
        } catch (Exception e2) {
            e2.printStackTrace();
        }
    }
    if(ps !=null){
        try {
            ps.close();
        } catch (Exception e2) {
            e2.printStackTrace();
        }
    }
    if(rs !=null){
        try {
            rs.close();
        } catch (Exception e2) {
            e2.printStackTrace();
        }
    }
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

    <title>showOrder</title>

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
                <%ArrayList orderlist=(ArrayList)request.getAttribute("orderlist");%>
                <h2>Order List <small>Custom design</small></h2>
                <ul class="nav navbar-right panel_toolbox">
                    <li><a class="collapse-link"><i class="fa fa-chevron-up"></i></a>
                    </li>
                </ul>
                <div class="clearfix"></div>
            </div>

            <div class="x_content">
                <div class="table-responsive">
                    <table class="table table-striped jambo_table bulk_action">
                        <thead>
                        <tr class="headings">
                            <th class="column-title">SalesMemo </th>
                            <th class="column-title">Store ID</th>
                            <th class="column-title">Date </th>
                            <th class="column-title">PaymentMethod </th>
                            <th class="column-title">Total Amount </th>
                            <th class="column-title">Staff ID </th>
                            <th class="column-title no-link last"><span class="nobr">Action</span>
                            </th>
                        </tr>
                        </thead>
                        <%
                        for(int i=0;i<orderlist.size();i++){
                            Order order=(Order)orderlist.get(i);
                        %>
                        <tbody>
                        <tr class="even pointer">
                            <td class=" "><%=order.getOrder() %></td>
                            <td class=" "><%=order.getStore() %> </td>
                            <td class=" "><%=order.getDate() %></td>
                            <td class=" "><%=order.getPay() %></td>
                            <td class=" "><%=order.getAmount() %></td>
                            <td class="a-right a-right "><%=order.getStaff() %></td>
                            <td class=" last"><a href="showOrderItem.jsp?orderID=<%=order.getOrder()%>">detail</a>
                            </td>
                        </tr>
                        </tbody>
                        <%
                            }%>
                    </table>
                </div>
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
</body>
</html>
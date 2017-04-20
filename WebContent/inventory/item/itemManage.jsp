<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="lib.Item"%>
<%
String staffname = (String)session.getAttribute("staffname");
if(staffname==null){
	pageContext.forward("index.html");
}
String cateID = request.getParameter("cateID");
Connection conn=null;
PreparedStatement ps=null;
ResultSet rs=null;
try {
    Class.forName("com.mysql.jdbc.Driver");
    conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/supermarket?useUnicode=true&characterEncoding=utf-8&useSSL=false", "root","fuermosi");
    String sql="select * from Item where Category_ID='"+cateID+"'";
    ps=conn.prepareStatement(sql);
    rs=ps.executeQuery();
    List<Item> itemlist= new ArrayList<Item>();
    Item item=null;
    while(rs.next()){
        item=new Item(rs.getString("Item_ID"),rs.getString("Item_Name"),rs.getString("Category_ID"),rs.getString("Selling_Price"),rs.getString("Inventory_Qty"),rs.getString("Location"));
        itemlist.add(item);
    }
    request.setAttribute("itemlist",itemlist);
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

    <title>ItemManagement</title>

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
                <%ArrayList itemlist=(ArrayList)request.getAttribute("itemlist");%>
                <h2>Item <small>Custom design</small></h2>
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
                            <th class="column-title">Item ID</th>
                            <th class="column-title">Item Name</th>
                            <th class="column-title">Category ID</th>
                            <th class="column-title">Selling Price</th>
                            <th class="column-title">Inventory Qty </th>
                            <th class="column-title">Location</th>
                            <th class="column-title no-link last"><span class="nobr">Action</span></th>
                            <th class="column-title no-link last"><span class="nobr"></span></th>
                        </tr>
                        </thead>
                        <%
                            for(int i=0;i<itemlist.size();i++){
                                Item item=(Item)itemlist.get(i);
                        %>
                        <tr>
                            <td><%=item.getID()%></td>
                            <td><%=item.getName()%></td>
                            <td><%=item.getCate()%></td>
                            <td><%=item.getPrice()%></td>
                            <td><%=item.getQty() %></td>
                            <td><%=item.getLocation() %></td>
                            <td><a href="forUpdate.jsp?itemID=<%=item.getID()%>&cateID=<%=item.getCate()%>">edit</a></td>
                            <td><a href="itemDelete.jsp?itemID=<%=item.getID()%>">delete</a></td>
                        </tr>
                        <%
                            }%>
                    </table>
                    <div align="center"><a class="btn btn-default" href="forInsert.jsp?cateID=<%=cateID%>">Insert an item</a></div>
                </div>
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
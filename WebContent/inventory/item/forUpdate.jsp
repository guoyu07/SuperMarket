<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%  
String cateID = request.getParameter("cateID"); 
String itemID = request.getParameter("itemID");
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
</head>
<body>
    <form action="itemUpdate.jsp" method=post>
        <table align="center">
            <tr>
                <td>Item ID：</td><td><input type=text name=itemID value=<%=itemID%> readonly/></td>
            </tr>
            <tr>
                <td>Item Name：</td><td><input type=text name=itemName /></td>
            </tr>
            <tr>
                <td>Category ID：</td><td><input type=text name=cateID value=<%=cateID%> readonly/></td>
            </tr>
            <tr>
                <td>Selling Price：</td><td><input type=text name=itemPrice /></td>
            </tr>
            <tr>
                <td>Inventory Qty：</td><td><input type=text name=itemQty /></td>
            </tr>
            <tr>
                <td>Location：</td><td><input type=text name=location /></td>
            </tr>           
            <tr>
            <td align="center">
                <input type="submit" value="Update" />
            </td>
            </tr>        
        </table>
    </form>
</body>
</html>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<%@ include file="vendertabs.html" %>
<title>Untitled Document</title>
<style type="text/css">
<!--
body {
	background-color: #C9D7E5;
}
.style3 {color: #0000FF; font-weight: bold; }
.style4 {
	font-size: 36px;
	font-weight: bold;
	color: #0000FF;
}
.style5 {color: #000099}
-->
</style></head>

<body>
<div align="center" class="style4">Show Orders </div>
<%@ include file="db.jsp" %>
<% 
rst=stmt.executeQuery("select * from orderlist ");

 %>
<table width="929" border="1" align="center">
  <tr bgcolor="#FFFFFF">
    <td width="146"><span class="style3">Item name</span></td>
    <td width="69"><span class="style3">Item cost </span></td>
    <td width="65"><span class="style3">Quantity</span></td>
    <td width="73"><span class="style3">Total amount </span></td>
    <td width="146"><span class="style3">Customer ID </span></td>
    <td width="103"><span class="style3">Status</span></td>
  
    <td width="127">&nbsp;</td>
  </tr>
  <% while(rst.next()){ %>
  <form action="" method="post">
  <tr bgcolor="#CCFF99">
    <td><span class="style5">
      <input type="text" name="itemname" value="<%= rst.getString(1) %>" readonly="true" />
    </span></td>
    <td><span class="style5"><%= rst.getString(2) %></span></td>
    <td><span class="style5"><%= rst.getString(3) %></span></td>
    <td><span class="style5"><%= rst.getString(4) %></span></td>
    <td><span class="style5">
      <input type="text" name="customerid"  value="<%= rst.getString(11) %>" readonly="true" />
    </span></td>
    <td><span class="style5"><%= rst.getString(12) %></span></td>
   
    <td><input type="submit" name="Submit" value="Delivered the Items" /></td>
  </tr>
  </form>
  <% } %>
</table>
 <% if(request.getParameter("Submit")!=null){

String itemname=request.getParameter("itemname");
String customerid=request.getParameter("customerid");
try{
int x=stmt.executeUpdate("update orderlist set status='Delivered' where productname='"+itemname+"' and customerid='"+customerid+"' ");
if(x!=0){
%>
  <script>alert("Delivered Successully"); 
						window.open("showOrders.jsp","_self");
						</script>
  
  <%
}
}catch(Exception e){
out.print(e);
}
}
 %>
</body>
</html>

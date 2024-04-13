<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.sql.*" errorPage="" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<%@ include file="vendertabs.html" %>
<title>Untitled Document</title>
<style type="text/css">
<!--
body {
	background-color: #CCFFCC;
}
.style1 {
	color: #FFFF00;
	font-weight: bold;
}
.style2 {
	font-size: 36px;
	font-weight: bold;
}
-->
</style></head>

<body>
  <p align="center">
    <%@ include file="db.jsp" %>
    <span class="style2">
    <% 


try
{


rst=stmt.executeQuery("select productid,productname,productprice,quantity,image from product   ");

  
						
  %>
  Product List</span> </p>
  <table width="467" border="1" align="center">
  <tr bgcolor="#999999">
    <td><div align="center" class="style1">product ID </div></td>
    <td><div align="center" class="style1">Product Name </div></td>
    <td><div align="center" class="style1">Product cast </div></td>
	<td>Image</td>
    </tr>
  <% 
  while(rst.next()){
  
   %>
    <form action="" method="post">
  <tr bgcolor="#003399">
    <td><span class="style3 style1"><input name="e1" type="text"  value="<%= rst.getString(1) %>" readonly="true"/></span></td>
    <td><span class="style3 style1"><input name="e2" type="text" value="<%= rst.getString(2) %>"/></span></td>
    <td><span class="style3 style1"><input name="e3" type="text" value="<%= rst.getString(3) %>"/></span></td>
	<td><span class="style3 style1"><img src="uploads/<%= rst.getString(5) %>" width="100" height="100"/></span></td>
	
	  
  </tr>
   </form>
    </tr>
  <% } %>
</table>

  
  <%  						
}catch(Exception e){
out.println(e);
}

 %>
 
 
 
 
 
 
 <% 
if(request.getParameter("update")!=null){
try{
int x=stmt.executeUpdate("update product set productname='"+request.getParameter("e2")+"',productprice='"+request.getParameter("e3")+"' where productid='"+request.getParameter("e1")+"' ");
if(x!=0)
{

%>
<script>
alert("Date Updated");
window.open("viewProductList.jsp","_self");
</script>
<%

}

}catch(Exception e){
out.print("error"+e);
}
}




if(request.getParameter("delete")!=null){
try{
int x=stmt.executeUpdate("delete from product where productid='"+request.getParameter("e1")+"'");
if(x!=0){

%>
<script>
alert("Date Deleted successfully");
window.open("viewProductList.jsp","_self");

</script>
<%

}

}catch(Exception e){
out.print("error"+e);
}
}
 %>
 
</body>
</html>

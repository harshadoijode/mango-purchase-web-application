<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.sql.*" errorPage="" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<title>Untitled Document</title>
<style type="text/css">
<!--
 body {
	background-image: url(images/t1.jpg);
}
.style1 {color: #FFFF00}

-->
</style>
</head>

<body>
<%@ include file="admintabs.html" %>
<p align="center">
  <%@ include file="db.jsp" %> 
 Farmer details</p>
<table width="100%" border="1" align="center">
  <tr bgcolor="#999999">
    
    <td width="162"><strong>Farmer name </strong></td>
    <td width="157"><strong>Address</strong></td>
    
    <td width="167"><strong>phone number </strong></td>
   
    <td width="165"><strong>password</strong></td>
	  <td width="165"><strong>Status</strong></td>
	   <td width="216"><strong>ID</strong></td>
    <td width="169">&nbsp;</td>
  </tr>
  
  <% 
  
  rst=stmt.executeQuery("select * from farmer");
  while(rst.next()){
  
   %>
  
  <form action="" method="get">
  <tr bgcolor="#003399">
    <td><span class="style3 style1"><input name="e1" type="text"  value="<%= rst.getString(1) %>"/></span></td>
    <td><span class="style3 style1"><input name="e2" type="text" value="<%= rst.getString(2) %>"/></span></td>
    <td><span class="style3 style1"><input name="e3" type="text" value="<%= rst.getString(3) %>"/></span></td>
    <td><span class="style3 style1"><input name="e4" type="text" value="<%= rst.getString(4) %>"/></span></td>
    <td><span class="style3 style1"><input name="e5" type="text"  value="<%= rst.getString(6) %>"/></span></td>
	 <td><span class="style3 style1"><input name="e6" type="text"  value="<%= rst.getString(5) %>"/></span></td>
   
    <td>
	   <input type="submit" name="Accept" value="Acept" />
	   <input type="submit" name="Reject" value="Reject" />
	   </td>
  </tr>
  </form>
  <% } %>
</table>



 
 <% 
if(request.getParameter("Accept")!=null){
try{
int x=stmt.executeUpdate("update farmer set status='Accepted' where customerid='"+request.getParameter("e6")+"' ");
if(x!=0)
{
%>
<script>
alert("Date Updated");
window.open("viewfarmers.jsp","_self");

</script>
<%
//response.sendRedirect("viewstores.jsp");


}

}catch(Exception e){
out.print("error"+e);
}
}
%>


<% 
if(request.getParameter("Reject")!=null){
try{
int x=stmt.executeUpdate("update farmer set status='Rejected' where customerid='"+request.getParameter("e6")+"' ");
if(x!=0)
{
%>
<script>
alert("Date Updated");
window.open("viewfarmers.jsp","_self");

</script>
<%
//response.sendRedirect("viewstores.jsp");


}

}catch(Exception e){
out.print("error"+e);
}
}
%>


</body>
</html>

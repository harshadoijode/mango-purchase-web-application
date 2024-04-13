<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.sql.*" errorPage="" %>

<%@ page import="com.oreilly.servlet.MultipartRequest" %>


<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<title>Untitled Document</title>
<style type="text/css">
<!--
 body {
	background-image: url(images/newcity.jpg);
}
body,td,th {
	color: #000066;
	font-family: Courier New, Courier, monospace;
	font-weight: bold;
	font-size: 18px;
}
.style1 {color: blue;}
table{

 box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0 rgba(0, 0, 0, 0.19);
background-image:linear-gradient(grey,white);
border-radius:20px;
border:0;
color:#FFFFFF;
}

-->
</style>
<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<script type="text/javascript">
    $(document).ready(function(){
        $('input[type="file"]').change(function(e){
            var fileName = e.target.files[0].name;
document.getElementById("txt").value = fileName;
            alert('The file "' + fileName +  '" has been selected.');
        });
    });
</script>
</head>

<body>
<%@ include file="vendertabs.html" %>
<%@ include file="db.jsp" %>

 <br />

<p align="center" style="color:#FFFFFF; font-size:18px;"> Raw Mango Details </p>
<table width="1076" border="0" align="center">
  <tr bgcolor="#999999">
    <td width="193"><strong>Name</strong></td>
    <td width="142"><strong>Description</strong></td>
    <td width="128"><strong>Price</strong></td>
    
    <td width="94"><strong>image</strong></td>
   
   
  </tr>
  
  <% 
  
  rst=stmt.executeQuery("select * from rawmango");
  while(rst.next()){
  
   %>
  
  <form action="" method="post">
  <tr bgcolor="#003399">
    <td><span class="style3 style1"><input name="e1" type="text"  value="<%= rst.getString(1) %>" readonly="true"/></span></td>
    <td><span class="style3 style1"><input name="e2" type="text" value="<%= rst.getString(2) %>"/></span></td>
    <td><span class="style3 style1"><input name="e3" type="text" value="<%= rst.getString(3) %>"/></span></td>
    <td><span class="style3 style1"><img src="uploads/<%= rst.getString(4) %>" width="100" height="100"/></span></td>
   
  
  </tr>
  </form>
  <% } %>
</table>


<% 
if(request.getParameter("update")!=null){
try{
int x=stmt.executeUpdate("update rawmango set name='"+request.getParameter("e1")+"',description='"+request.getParameter("e2")+"',price='"+request.getParameter("e3")+"' where name='"+request.getParameter("e1")+"' ");
if(x!=0)
{

%>
<script>
alert("Date Updated");
window.open("addfruit.jsp","_self");
</script>
<%

}

}catch(Exception e){
out.print("error"+e);
}
}




if(request.getParameter("delete")!=null){
try{
int x=stmt.executeUpdate("delete from rawmango where name='"+request.getParameter("e1")+"'");
if(x!=0){

%>
<script>
alert("Date Deleted successfully");
window.open("addfruit.jsp","_self");

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

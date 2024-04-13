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
<%@ include file="farmertabs.html" %>
<%@ include file="db.jsp" %>
<div align="center"><strong>Add Fruits For sales </strong></div>

<form  method="post" action="mangosalescode.jsp"  enctype="multipart/form-data" >
  <table bgcolor="grey" width="637" border="0" align="center" style="border-radius:20px">
    <tr >
      <td width="276"><div align="right"><span class="style1">Enter Fruit name </span></div></td>
      <td width="189"><input name="s1" type="text" id="s1"  /></td>
    </tr>
    <tr>
      <td><div align="right"><span class="style1">Description</span></div></td>
      <td><input name="s2" type="text" id="s2" /></td>
    </tr>
   
    <tr>
      <td><div align="right"><span class="style1">Selling price per kg</span></div></td>
      <td><input name="s3" type="text" id="s4"  required /></td>
    </tr>
   
    <tr>
      <td><div align="right"><span class="style1">Choose   image</span></div></td>
      <td><input type="file" name="s4" id="s7" /></td>
    </tr>
   
    <tr>
      <td><span class="style1"></span></td>
      <td><input type="submit" name="Submit" value="Add Fruit" /></td>
    </tr>
  </table>
  
</form>
</div>

 <br />

<p align="center" style="color:#FFFFFF; font-size:18px;"> fruits Details </p>
<table width="1076" border="0" align="center">
  <tr bgcolor="#999999">
    <td width="193"><strong>Name</strong></td>
    <td width="142"><strong>Description</strong></td>
    <td width="128"><strong>Price</strong></td>
     <td width="128"><strong>ID</strong></td>
    <td width="94"><strong>image</strong></td>
   
    <td width="148">&nbsp;</td>
  </tr>
  
  <% 
  
  rst=stmt.executeQuery("select * from farmersales where farmerphone='"+session.getAttribute("fphone")+"'");
  while(rst.next()){
  
   %>
  
  <form action="" method="post">
  <tr bgcolor="#003399">
    <td><span class="style3 style1"><input name="e1" type="text"  value="<%= rst.getString(1) %>" readonly="true"/></span></td>
    <td><span class="style3 style1"><input name="e2" type="text" value="<%= rst.getString(2) %>"/></span></td>
    <td><span class="style3 style1"><input name="e3" type="text" value="<%= rst.getString(3) %>"/></span></td>
	 <td><span class="style3 style1"><input name="e4" type="text" value="<%= rst.getString(6) %>" readonly="true"/></span></td>
    <td><span class="style3 style1"><img src="uploads/<%= rst.getString(4) %>" width="100" height="100"/></span></td>
   
    <td><input name="update" type="submit" id="update" value="Update" />
      <input type="submit" name="delete" value="Delete" /></td>
  </tr>
  </form>
  <% } %>
</table>


<% 
if(request.getParameter("update")!=null){
try{
int x=stmt.executeUpdate("update farmersales set name='"+request.getParameter("e1")+"',description='"+request.getParameter("e2")+"',price='"+request.getParameter("e3")+"' where id='"+request.getParameter("e4")+"' ");
if(x!=0)
{

%>
<script>
alert("Date Updated");
window.open("mangosales.jsp","_self");
</script>
<%

}

}catch(Exception e){
out.print("error"+e);
}
}




if(request.getParameter("delete")!=null){
try{
int x=stmt.executeUpdate("delete from fruit where id='"+request.getParameter("e4")+"'");
if(x!=0){

%>
<script>
alert("Date Deleted successfully");
window.open("mangosales.jsp","_self");

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

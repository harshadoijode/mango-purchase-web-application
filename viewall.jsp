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
.style2 {color: blue;}

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
<p>
  <%@ include file="customertabs.html" %>
  <%@ include file="db.jsp" %>
</p>
<form id="form1" name="form1" method="post" action="">
  <div align="center">
    <input type="submit" name="raw" value="Raw Mango" />
    <input type="submit" name="fruits" value="Fruits" />  
    <input type="submit" name="madicine" value="Madicine mango" />
  </div>
</form>
<p align="center"><br />
<% if(request.getParameter("raw")!=null){ %>
<p style="color:#FFFFFF; font-size:24px;" align="center"> Raw Mango Details </p>
<table width="699" border="1" align="center">
  
  <% 
  
  rst=stmt.executeQuery("select * from rawmango");
  while(rst.next()){
  
   %>
  
  <form action="" method="post">
  <tr bgcolor="white">
    <td width="382"><div align="center"><span class="style3 style1"><img src="uploads/<%= rst.getString(4) %>" width="290" height="252"/></span></div></td>
    <td width="132"><p align="center" class="style3 style2">Name:<%= rst.getString(1) %> </p>
      <p align="center" class="style3 style2">Description:<%= rst.getString(2) %></p>
      <p align="center" class="style3 style2">Price:<%= rst.getString(3) %></p></td>
  </tr>
  </form><br />

  <% } %>
</table>
<% } %>




<% if(request.getParameter("fruits")!=null){ %>
<p style="color:#FFFFFF; font-size:24px;" align="center"> fruits Details </p>
<table width="653" border="1" align="center">
  <% 
  
  rst=stmt.executeQuery("select * from fruit");
  while(rst.next()){
  
   %>
  <form action="" method="post">
    <tr bgcolor="white">
      <td width="94"><div align="center"><span class="style3 style1"><img src="uploads/<%= rst.getString(4) %>" width="308" height="307"/></span></div></td>
      <td width="94"><p align="center" class="style3 style2">Name:<%= rst.getString(1) %> </p>
        <p align="center" class="style3 style2">Description:<%= rst.getString(2) %></p>
      <p align="center" class="style3 style2">Price:<%= rst.getString(3) %></p></td>
    </tr>
  </form><br />

  <% } %>
</table>
<% } %>





<% if(request.getParameter("madicine")!=null){ %>
<p style="color:#FFFFFF; font-size:24px;" align="center"> madicine Details </p>
<table width="679" border="1" align="center">
  <% 
  
  rst=stmt.executeQuery("select * from madicine");
  while(rst.next()){
  
   %>
  <form action="" method="post">
    <tr bgcolor="white">
      <td width="94"><div align="center"><span class="style3 style1"><img src="uploads/<%= rst.getString(4) %>" width="372" height="327"/></span></div></td>
      <td width="94"><p align="center" class="style3 style2">Name:<%= rst.getString(1) %> </p>
        <p align="center" class="style3 style2">Description:<%= rst.getString(2) %></p>
      <p align="center" class="style3 style2">Price:<%= rst.getString(3) %></p></td>
    </tr>
  </form><br />
  <% } %>
</table>

<% } %>


</body>
</html>

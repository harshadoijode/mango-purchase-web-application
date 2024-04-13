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
<div align="center"><strong>Add Category </strong></div>
<form id="form2" name="form2" method="post" action="">
  <table bgcolor="grey" width="575" border="0" align="center" style="border-radius:20px">
    <tr>
      <td>Add new Category
        <input type="text" name="category" />
      <input type="submit" name="cat" value="Submit" /></td>
    </tr>
  </table>
</form>
<% 
if(request.getParameter("cat")!=null){

String s1=request.getParameter("category");

try{
int x=stmt.executeUpdate("insert into category values('"+s1+"')");
if(x!=0){

out.print("New cagtegory added Successfully");
}
}catch(Exception e){
out.print("this category is already exist");
}
}
 %>
<p>&nbsp;</p>
<div >
<form  method="post" action="addlocationcode.jsp"  enctype="multipart/form-data" >
  <table bgcolor="grey" width="637" border="0" align="center" style="border-radius:20px">
    <tr >
      <td width="276"><div align="right"><span class="style1">Enter Lodge name </span></div></td>
      <td width="189"><input name="s1" type="text" id="s1"  /></td>
    </tr>
    <tr>
      <td><div align="right"><span class="style1">Address</span></div></td>
      <td><input name="s2" type="text" id="s2" /></td>
    </tr>
    <tr>
      <td><div align="right"><span class="style1">Category</span></div></td>
      <td><select name="s3">
	   <% 
  
  rst=stmt.executeQuery("select * from category");
  while(rst.next()){
  
   %>
        <option><%= rst.getString(1) %></option>
		<% } %>
      </select></td>
    </tr>
    <tr>
      <td><div align="right"><span class="style1">Phone</span></div></td>
      <td><input name="s4" type="text" id="s4" pattern="[0-9]{10}" title=" 10 digit phone number "  required /></td>
    </tr>
    <tr>
      <td><div align="right"><span class="style1">Email</span></div></td>
	 
      <td><input name="s5" type="email" id="s5" required/></td>
    </tr>
    <tr>
      <td><div align="right"><span class="style1">Description</span></div></td>
      <td><input name="s6" type="text"  value="" /></td>
    </tr>
    <tr>
      <td><div align="right"><span class="style1">Choose   image</span></div></td>
      <td><input type="file" name="s7" id="s7" /></td>
    </tr>
    <tr>
      <td><div align="right"><span class="style1">Add map Location </span></div></td>
      <td><textarea name="s8"></textarea>
      <a href="https://www.google.co.in/maps/" target="_blank"> google map</a></td>
    </tr>
    <tr>
      <td><span class="style1"></span></td>
      <td><input type="submit" name="Submit" value="Add location" /></td>
    </tr>
  </table>
  
</form>
</div>

 
 
 
</body>
</html>

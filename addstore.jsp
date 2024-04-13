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
	background-image: url(images/t1.jpg);
}
body,td,th {
	color: white;
	font-family: Courier New, Courier, monospace;
	font-weight: bold;
	font-size: 24px;
}
.style2 {
	color: #FF0000;
	font-size: 16px;
}

-->
</style></head>

<body>
<%@ include file="homeMenu.html" %>
<%@ include file="db.jsp" %>
<div align="center"><strong> New Vender Registration </strong></div>
<form id="form1" name="form1" method="post" action="" >
  <table width="513" border="1" align="center">
    <tr>
      <td width="285"> Vender name </td>
      <td width="212"><input name="s1" type="text"  /></td>
    </tr>
    <tr>
      <td>Address</td>
      <td><input name="s2" type="text"  /></td>
    </tr>
    <tr>
      <td>Vender mobile no. </td>
      <td><input name="s3" type="text"  /></td>
    </tr>
    <tr>
      <td>password</td>
      <td><input name="s4" type="password" /></td>
    </tr>
	 <tr>
      <td>Vender ID</td>
      <td><input name="s5" type="text" /></td>
    </tr>
    <tr>
      <td>&nbsp;</td>
      <td><input type="submit" name="Submit" value="Register" /></td>
    </tr>
  </table>
   <center>
   <input type="checkbox" name="checkbox" value="checkbox" required/><span class="style2">I accepted the terms and contions of the web sit. If i miss use the data for the users the authority can take action on me<a href="terms.jsp">read more</a></span>
   </center>
</form>
<p>&nbsp;</p>


<div align="center">
  <% 
if(request.getParameter("Submit")!=null){

String s1=request.getParameter("s1");
String s2=request.getParameter("s2");
String s3=request.getParameter("s3");
String s4=request.getParameter("s4");
String s5=request.getParameter("s5");

try{
int x=stmt.executeUpdate("insert into stores(storename,address,storemobileno,password,venderid) values('"+s1+"','"+s2+"','"+s3+"','"+s4+"','"+s5+"')");
if(x!=0){
%>
  <script>

alert("Registered  Successfull");
    </script>
  <%
}else{
out.println("this store already exist");
}

}catch(Exception e){
out.println("this store already exist");
}
}
 %>
    
 
  </div>
</body>
</html>

<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.sql.*" errorPage="" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">

<head>
  <%@ include file="homeMenu.html" %>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Untitled Document</title>
<style type="text/css">
<!--

td,th {
	color: white;
	font-family: Courier New, Courier, monospace;
	font-weight: bold;
	font-size: 16px;
	
}
.style1 {
	color: white;
	font-weight: bold;
}
.style2 {color: #FF0000}

-->
</style>
</head>

<body>
<%@ include file="db.jsp" %><br />
<br />
<br />
<br />

<div align="center" class="style1">New Farmer Registration  </div>

<form id="form1" name="form1" method="post" action="">
  <table style="background:#666666; color:white; border-radius:20px;" width="auto" border="0" align="center">
    <tr >
      <td width="285">Enter Farmer name </td>
      <td width="212"><input name="s1" type="text"  required/></td>
    </tr>
    <tr>
      <td>Address</td>
      <td><textarea name="s2" cols="auto" rows="5" required></textarea></td>
    </tr>
    <tr>
      <td>mobile no. </td>
      <td><input name="s3" type="text" pattern="[0-9]{10}" title=" phone number or number"  required /></td>
    </tr>
    <tr>
      <td>password</td>
      <td><input name="s4" input type="password" id="psw" pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,}" title="Must contain at least one number and one uppercase and lowercase letter, and at least 8 or more characters" required></td>
    </tr>
	 <tr>
      <td>Farmer ID</td>
      <td><input name="s5" type="text"   required /></td>
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
</div>


<div align="center">
  <% 
if(request.getParameter("Submit")!=null){

String s1=request.getParameter("s1");
String s2=request.getParameter("s2");
String s3=request.getParameter("s3");
String s4=request.getParameter("s4");
String s5=request.getParameter("s5");

try{
int x=stmt.executeUpdate("insert into farmer(name,address,phone,password,customerid) values('"+s1+"','"+s2+"','"+s3+"','"+s4+"','"+s5+"')");
if(x!=0){
%>
  <script>

alert("New Customer Register Successfull");
window.open("Farmerlogin.jsp","_self");
  </script>
  <%
}

}catch(Exception e){
%>
  <script>

alert("This Store is already Registered by this phone number");
window.open("Farmerlogin.jsp","_self");
  </script>
  <%
}
}
 %>

  </div>
</body>
</html>

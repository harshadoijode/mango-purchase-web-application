<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.sql.*" errorPage="" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<link rel="stylesheet" href="Style_button_text.css" type="text/css" />
<title>Untitled Document</title>



<script type="text/javascript" >
function validate(){
var x=document.forms["form1"]["of1"].value;
var y=document.forms["form1"]["of2"].value;
var a=document.forms["form1"]["of3"].value;
var b=document.forms["form1"]["of4"].value;
var c=document.forms["form1"]["of5"].value;
if(x==""){
alert(" name cannot be blank");
return false;
}else if(y==""){
alert("password name cannot be blank");
return false;

}else if(a==""){
alert("designation name cannot be blank");
return false;

}else if(b==""){
alert(" location cannot be blank");
return false;

}else if(c==""){
alert("contact no cannot be blank");
return false;

}else{
return true;
}

}



</script>

<style type="text/css">
<!--
.style1 {font-weight: bold}
.style4 {
	color: #000033;
	font-weight: bold;
}
.style5 {color: #000033}
-->
</style>
</head>

<body>
<p>
<%@ include file="customertabs.html" %>
  <%@ include file="db.jsp" %>

</p>
<p align="center" class="style1">Feed Back </p>
<div style="margin-left:30%; margin-right:30%; background-color:#999999">
<form id="form1" name="form1" method="post" action="">
  <p>&nbsp;</p>
  <table width="456" border="0" align="center">
    <tr>
      <td width="172"><span class="style4"> name </span></td>
      <td width="147"><input name="of1" type="text" id="of1" required />      </td>
    </tr>
	<tr>
      <td width="172"><span class="style4">place</span></td>
      <td width="147"><input name="of2" type="text" id="of2" required/>      </td>
    </tr>
    <tr>
      <td><span class="style4">feedBack </span></td>
      <td><textarea name="of4" cols="50" rows="5" id="of4" required></textarea></td>
    </tr>
    <tr>
      <td><span class="style5"></span></td>
      <td><input type="submit" name="Submit" value="Submit" onclick="return validate()" />
      <input type="reset" name="Submit2" value="Reset" /></td>
    </tr>
  </table>
  <p>&nbsp;</p>
</form>
</div>
<% 
if(request.getParameter("Submit")!=null){
rst=stmt.executeQuery("select count(*) from feedback where name='"+request.getParameter("of1")+"'");
if(rst.next()){
int p=Integer.parseInt(rst.getString(1));
if(p<=3){
int x=stmt.executeUpdate("insert into feedback values('"+request.getParameter("of1")+"','"+request.getParameter("of2")+"','"+request.getParameter("of4")+"'  )");


if(x!=0){
%>
<script> alert("Feed back given successfully");</script>
<%
}else{
%>
<script> alert("fail to give feedback");</script>
<%
}



}else{
%>
<script> alert("you cant send feedback now your 3 attemps are finished");</script>
<%

}
}
}




 %>
</body>
</html>

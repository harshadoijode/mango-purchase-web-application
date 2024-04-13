<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.sql.*" errorPage="" %>

<%@ page import="com.oreilly.servlet.MultipartRequest" %>


<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<title>Untitled Document</title>
<style>
html {
  box-sizing: border-box;
}

*, *:before, *:after {
  box-sizing: inherit;
}

.column {
  float: left;
  width: 33.3%;
  margin-bottom: 16px;
  padding: 0 8px;
}

@media screen and (max-width: 650px) {
  .column {
    width: 100%;
    display: block;
  }
}

.card {
  box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2);
}

.container {
  padding: 0 16px;
}

.container::after, .row::after {
  content: "";
  clear: both;
  display: table;
}

.title {
  color: grey;
}

.button {
  border: none;
  outline: 0;
  display: inline-block;
  padding: 8px;
  color: white;
  background-color: #000;
  text-align: center;
  cursor: pointer;
  width: 100%;
}

.button:hover {
  background-color: #555;
}
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
<%@ include file="customertabs.html" %>
<%@ include file="db.jsp" %>
<div align="center"><strong>Mango Fruits Details </strong></div>





<form action="" method="get">
  <div align="center">
  
	  <input name="Fruit" type="submit" value="Fruit" />
  <input name="Raw" type="submit" value="Raw Mango" />
  </div>
</form><br />
<br />


<br />

<% if(request.getParameter("Fruit")!=null){ %>

<div class="row">
<% 

rst=stmt.executeQuery("select * from fruit  ");
while(rst.next()){


 %>
  <div class="column">
    <div class="card" align="center"><center>
      <img  src="uploads/<%= rst.getString(4) %>" alt="Jane" width="300" height="300" style="width:50%"></center>
      <div class="container" align="center">
        <h3><%= rst.getString(1) %></h3>
		<h3><%= rst.getString(2) %></h3>
       
       
        <h3>Rs.<%= rst.getString(3) %></h3>
         <p>
		 <a href="buyfruit.jsp?p=<%= rst.getString(6) %>" ><button class="button">Buy</button></a>
		</p>
      </div>
    </div>
  </div>
  
  <% } 
 
  %>
  
  
</div>
<% } %>








<% if(request.getParameter("Raw")!=null){ %>

<div class="row">
<% 

rst=stmt.executeQuery("select * from rawmango ");
while(rst.next()){


 %>
  <div class="column">
    <div class="card" align="center"><center>
      <img  src="uploads/<%= rst.getString(4) %>" alt="Jane" width="300" height="300" style="width:50%"></center>
      <div class="container" align="center">
        <h3><%= rst.getString(1) %></h3>
		<h3><%= rst.getString(2) %></h3>
       
       
        <h3>Rs.<%= rst.getString(3) %></h3>
         <p>
		 <a href="buyrawfruit.jsp?p=<%= rst.getString(6) %>" ><button class="button">Buy</button></a>
		</p>
      </div>
    </div>
  </div>
  
  <% } 
 
  %>
  
  
</div>
<% } %>



 
</body>
</html>

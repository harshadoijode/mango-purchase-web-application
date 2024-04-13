<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.sql.*" errorPage="" %>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<%@ include file="homeMenu.html"  %>
<style>
body {
  font-family: Arial, Helvetica, sans-serif;
  margin: 0;
}

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

.card {
  box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2);
  margin: 8px;
}

.about-section1 {
  padding: 50px;
  text-align: center;
  background-color:#F3F3F3;
  color: red;
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

@media screen and (max-width: 650px) {
  .column {
    width: 100%;
    display: block;
  }
}
</style>
</head>
<body>

<div class="about-section1" >
  <h1>About Us Page</h1>
  <p>Some text about who we are and what we do.</p>
  <p>Resize the browser window to see that this page is responsive by the way.</p>
</div>


 <table width="1185" height="258" border="0" align="center">
<tr>
  <td width="596"><div align="justify">
   
      <p>&nbsp;</p>
      <p>The American Veterinary Medical Association (AVMA) has taken a formal position defining the difference between the two labels, Animal Extremism vs Animal Welfare. In their detailed Policy on animal welfare and animal extremism, they state that they cannot endorse the views of animal extremist groups. Here’s a quote from their policy:
        
       
        
        We have developed an interactive course about the differences between Animal Rights vs Animal Welfare for your use and to help educate friends, family, and communities. The link to the interactive course can be found at the bottom of the page. </p>
   
  </div></td>
  <td width="490">

	  <div class="w3-content w3-section" style="max-width:500px"  >   
        <img class="mySlides w3-animate-top" src="images/1.jpg" style="width:100%">
        <img class="mySlides w3-animate-bottom" src="images/2.jpg" style="width:100%">
    <img class="mySlides w3-animate-top" src="images/3.jpg" style="width:100%">	  </div></td>
</tr>
</table>

<script>
var myIndex = 0;
carousel();

function carousel() {
  var i;
  var x = document.getElementsByClassName("mySlides");
  for (i = 0; i < x.length; i++) {
    x[i].style.display = "none";  
  }
  myIndex++;
  if (myIndex > x.length) {myIndex = 1}    
  x[myIndex-1].style.display = "block";  
  setTimeout(carousel, 2500);    
}
</script>


</body>
</html>


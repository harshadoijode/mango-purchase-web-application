<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.sql.*" errorPage="" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<title>Untitled Document</title>
<style type="text/css">
<!--
body {
	background-color: white;
}
.style1 {
	color: #FFFF00;
	font-weight: bold;
}
.style2 {
	font-size: 36px;
	font-weight: bold;
}
-->
</style>
<script type="text/javascript">

function validateform(){
var x=document.forms["form1"]["buyQty"].value;
if(x==""){
alert("qunntiy annot be blank");
return false;
}else{
return true;

}
}
</script>
<script>
function myFunction() {
  var x = document.getElementById("cardtype").value;
  if(x=="Cash On Delivery"){
  document.getElementById("cardNum").disabled = true;
  document.getElementById("cvv").disabled = true;
  }else{
   document.getElementById("cardNum").disabled = false;
  document.getElementById("cvv").disabled = false;
  }
  
}
</script>

</head>

<body>
 <%@ include file="db.jsp" %>
  <%@ include file="customertabs.html" %>
  <p align="center">
   
    <span class="style2">
    <% 


try
{

String pname=request.getParameter("p");
//out.print(pname);
rst=stmt.executeQuery("select name,price,id,farmernumber from fruit where id='"+pname+"' ");

  if(rst.next()){
						
  %>
    Buy Product    </span> </p>
  <p align="center">Product Details </p>
  <form name="form1" id="form1" action="" method="get">
    <p align="center">&nbsp;</p>
	<input name="charity" type="hidden" value="1" />
	<input name="fno" type="hidden" value="<%= rst.getString(4) %>" />
	
  <table width="345" border="1" align="center">
    <tr>
      <td width="192"><div align="right">Product name </div></td>
      <td width="137"><input type="text" name="Productname" value="<%=rst.getString(1) %>" readonly="yes" /></td>
    </tr>
    <tr>
      <td><div align="right">Product Price </div></td>
      <td><input type="text" name="ProductPrice" value="<%=rst.getString(2) %>" readonly="yes"/></td>
    </tr>
    <tr>
      <td><div align="right">Available Quantity</div></td>
      <td>
      <input type="text" name="qty" value="100" readonly="yes" /> Kg</td>
    </tr>

    <tr>
      <td><div align="right">Enter Quantity </div></td>
      <td><input name="buyQty" type="text" value="1" /></td>
    </tr>
    <tr>
      <td colspan="2"><div align="center">
        <input type="submit" name="OK" value="OK" onclick="return validateform()" />
      </div></td>
    </tr>
  </table>
  </form>
  
  <%
  }
 						
}catch(Exception e){
out.println(e);
}
  
   if(request.getParameter("OK")!=null){
  String pname=request.getParameter("Productname");
 int pcost=Integer.parseInt(request.getParameter("ProductPrice"));
  int qty=Integer.parseInt(request.getParameter("buyQty"));
    String charity=request.getParameter("charity");
	float ch=Float.parseFloat(charity);
	String fno=request.getParameter("fno");

float res=ch/100;
	float charityAmt=res * pcost*qty;
	//String chamt=Integer.toString(charityAmt);
	//out.print("charity amount"+charityAmt);
  float totalAmt=(pcost*qty);
  float productAmt=(pcost*qty)-charityAmt;
 // out.print("product  amount"+productAmt);
   %>
  
  <p align="center">Order Details </p>
  <form action="" method="get">
  <input name="charityAmt" type="hidden" value="<%= charityAmt %>" />
  <input name="productAmt" type="hidden" value="<%= productAmt %>" />
  <input name="fnumber" type="hidden" value="<%= request.getParameter("fno") %>" />
  
    <input name="qty" type="hidden" value="<%= fno%>" />
  <table width="568" border="1" align="center">
    <tr>
      <td><div align="right">Product Name </div></td>
      <td><input name="pname" type="text" id="pname" readonly="yes"  value="<%= pname %>" /></td>
    </tr>
    <tr>
      <td><div align="right">Product Cast </div></td>
      <td><input name="pcost" type="text" id="pcost" readonly="yes"  value="<%=pcost %>"/></td>
    </tr>
    <tr>
      <td width="192"> <div align="right">Quantity </div></td>
      <td width="360"><input type="text" name="totalQty"   readonly="yes" value="<%= qty %>"/></td>
    </tr>
    <tr>
      <td><div align="right">Total Amount </div></td>
      <td><input type="text" name="totalAmt"  readonly="yes" value="<%= totalAmt %>"/></td>
    </tr>
    <tr>
      <td><div align="right">Enter Address </div></td>
      <td><textarea name="address" cols="50" rows="5"></textarea></td>
    </tr>
    
    <tr>
      <td>Enter Card Details </td>
      <td><p align="right">card holder phone
          <input type="text" name="chname" value="<%= session.getAttribute("cphone") %>" readonly="true"/>
      </p>
        <p align="right">card type
          <select id="cardtype" onchange="myFunction()" name="cardtype" size="1">
            <option>credit card</option>
            <option>debit card</option>
            <option>visa card</option>
			 <option>Cash On Delivery</option>
          </select>
        </p>
        <p align="right">enter 15 digit card number
        <input name="cardNum" type="text" id="cardNum" size="15" />
</p>
      <p align="right">Enter CVV number
        <input name="cvv" type="text" id="cvv" size="3" />
</p></td>
    </tr>
    <tr>
      <td colspan="2"><div align="center">
        <input type="submit" name="Buy" value="Buy" />
        
        </div></td>
    </tr>
  </table>
  </form>
  <p align="center">&nbsp;</p>
  <%  
  }
    if(request.getParameter("Buy")!=null){
	String t1=request.getParameter("pname");
	String t2=request.getParameter("pcost");
	String t3=request.getParameter("totalQty");
	String t4=request.getParameter("totalAmt");
	String t5=request.getParameter("address");
	String t6=request.getParameter("chname");
	String t7=request.getParameter("cardtype");
	String t8=request.getParameter("cardNum");
	String t9=request.getParameter("cvv");
		String fnum=request.getParameter("fnumber");
	float t10=Float.parseFloat(request.getParameter("charityAmt"));
	//int availableQty=Integer.parseInt(request.getParameter("qty"));
	int availableQty=10;
	//out.print("availableQty"+availableQty);
	int soldQty=Integer.parseInt(t3);
	//out.print("soldQty"+soldQty);
	int stockQty=availableQty-soldQty;
	//out.print("stockQty"+stockQty);
	int m=stmt.executeUpdate("update product set quantity='"+stockQty+"' where productname='"+t1+"'");
	int x=stmt.executeUpdate("insert into orderlist (productname,productCast,quantity,totalAmount,address,cardHolderName,cardtype,cardNum,cvv,fno)values('"+t1+"','"+t2+"','"+t3 +"','"+t4+"','"+t5+"','"+t6+"','"+t7+"','"+t8+"','"+t9+"','"+fnum+"')");
	if(x!=0){
	out.print("your product ordered successfully"+"<br/>");
	rst=stmt.executeQuery("select orderID from orderlist order by orderID desc");
	if(rst.next()){
	out.print("your order ID is:"+rst.getString(1));
	}
	}
	rst=stmt.executeQuery("select quantity from product where productname='"+t1+"'");
	if(rst.next()){
	int qty=Integer.parseInt(rst.getString(1));
	int curQty=qty=Integer.parseInt(t3);
	int y=stmt.executeUpdate("update product set quantity='"+stockQty+"' where productname='"+t1+"'");
	if(y!=0){
	out.print("product updated");
	}
	}
	
}
 %>
</body>
</html>

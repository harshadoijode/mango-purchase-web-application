<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.sql.*" errorPage="" %>

<%@ page import="com.oreilly.servlet.MultipartRequest" %>

<%@ include file="db.jsp" %>

<% 

try{
MultipartRequest m = new MultipartRequest(request, "C:/Program Files (x86)/Apache Software Foundation/Tomcat 5.5/webapps/GFGC_Mango/GFGC_Mango/uploads");
String s1=(String)m.getParameter("s1");
String s2=(String)m.getParameter("s2");
String s3=(String)m.getParameter("s3");

String s4=(String)m.getOriginalFileName("s4");

int x=stmt.executeUpdate("insert into rawmango values('"+s1+"','"+s2+"','"+s3+"','"+s4+"')");
if(x!=0){

%>
<script>

alert("successfully uploaded");

window.open("addRawmango.jsp","_self");
</script>
<%
}
}catch(Exception e){
out.print(e);

}
 %>




 
 
 
</body>
</html>

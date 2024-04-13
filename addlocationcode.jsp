<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.sql.*" errorPage="" %>

<%@ page import="com.oreilly.servlet.MultipartRequest" %>

<%@ include file="db.jsp" %>

<% 

try{
MultipartRequest m = new MultipartRequest(request, "D:/tomcat Installed Dont delete it/Tomcat 5.5/webapps/GFGC_Mango/uploads");
String s1=(String)m.getParameter("s1");
String s2=(String)m.getParameter("s2");
String s3=(String)m.getParameter("s3");
String s4=(String)m.getParameter("s4");
String s5=(String)m.getParameter("s5");
String s6=(String)m.getParameter("s6");
String s7=(String)m.getOriginalFileName("s7");
String s8=(String)m.getParameter("s8");
int x=stmt.executeUpdate("insert into nursery values('"+s1+"','"+s2+"','"+s3+"','"+s4+"','"+s5+"','"+s6+"','"+s7+"','"+s8+"')");
if(x!=0){

%>
<script>

alert("successfully uploaded");

window.open("addlocation.jsp","_self");
</script>
<%
}
}catch(Exception e){
out.print(e);

}
 %>




 
 
 
</body>
</html>

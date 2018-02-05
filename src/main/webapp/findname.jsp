<%@ page language="java" import="java.util.*" pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*"%>
<%
String n=request.getParameter("val");
if(n.length()>0){
try{
	String subject= request.getParameter("subject");
	String url="jdbc:mysql://mysql:3306/LetsQuo";
    String user="user";
    String password="password";
	Class.forName("com.mysql.jdbc.Driver").newInstance();
	Connection con=DriverManager.getConnection(url,user,password);
PreparedStatement ps=con.prepareStatement("select username from quizregister where username='"+n+"'");
ResultSet rs=ps.executeQuery();
while(rs.next()){
out.print("<font style='color:red'>Username already exist</font>");
}
con.close();
}catch(Exception e){e.printStackTrace();}
}//end of if
%>
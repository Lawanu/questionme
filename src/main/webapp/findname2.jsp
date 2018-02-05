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
PreparedStatement ps=con.prepareStatement("select * from QUIZINFO where subject like '"+n+"%'");
//ps.setString(1,n);
out.print("<br>");
ResultSet rs=ps.executeQuery();

out.print("<table border='3' cellspacing=3 cellpadding=2 id='myTable'>");
out.print("<tr><td><B>Quizs</B></td><td><B>Subject</B></td></tr>");
while(rs.next()){
out.print("<tr><td><a href='#' name='"+rs.getString(2)+"' onclick='javascript:viewAll(this.name)'>Quiz"+rs.getString(2)+"</a></td>");
out.print("<td>"+rs.getString(1)+"</td>");
out.print("</tr>");
}
out.print("</table>");
con.close();
}catch(Exception e){e.printStackTrace();}
}//end of if
%>
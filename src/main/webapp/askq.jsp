<%@ page language="java" import="java.util.*" pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*"%>


<%

 try {
 
String name= request.getParameter("name");
String email= request.getParameter("email");
String phone= request.getParameter("phone");
String question= request.getParameter("question");
String url="jdbc:mysql://mysql:3306/LetsQuo";
String user="user";
String password="password";
Class.forName("com.mysql.jdbc.Driver").newInstance();
Connection con=DriverManager.getConnection(url,user,password);

PreparedStatement ps=con.prepareStatement("insert into QUIZQ values(?,?,?,?)");
ps.setString(1,name);
ps.setString(2,email);
ps.setString(3,phone);
ps.setString(4,question);

int s= ps.executeUpdate();


}
catch(Exception e){e.printStackTrace();}

%>
<jsp:forward page="home.jsp"></jsp:forward>

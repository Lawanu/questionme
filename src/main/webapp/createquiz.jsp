<%@ page language="java" import="java.util.*" pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*"%>

<% try {
String subject= request.getParameter("subject");
String url="jdbc:mysql://mysql:3306/LetsQuo";
String user="user";
String password="password";
Class.forName("com.mysql.jdbc.Driver").newInstance();
Connection con=DriverManager.getConnection(url,user,password);
System.out.println("Got Connection");
PreparedStatement ps=con.prepareStatement("insert into QUIZINFO(subject) values('"+subject+"') " );
int s= ps.executeUpdate();

 }
catch(Exception e){e.printStackTrace();}
%>

<jsp:forward page="createquiz1.jsp"></jsp:forward>

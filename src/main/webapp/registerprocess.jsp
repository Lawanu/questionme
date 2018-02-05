<%@ page language="java" import="java.util.*" pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*"%>
<%try{

String username=request.getParameter("username");
String userpass=request.getParameter("userpass");
String category=request.getParameter("category");
String email=request.getParameter("email");
String subject= request.getParameter("subject");
String url="jdbc:mysql://mysql:3306/LetsQuo";
String user="user";
String password="password";
Class.forName("com.mysql.jdbc.Driver").newInstance();
Connection con=DriverManager.getConnection(url,user,password);
System.out.println("Got Connection");
PreparedStatement ps=con.prepareStatement("insert into QUIZREGISTER values(?,?,?,?)");

ps.setString(1,username);
ps.setString(2,userpass);
ps.setString(3,category);
ps.setString(4,email);
int s=ps.executeUpdate();
System.out.print(s);
}catch(SQLException e2){
e2.printStackTrace();
}
%>
<jsp:forward page="index.jsp"></jsp:forward>

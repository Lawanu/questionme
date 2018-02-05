<%@ page language="java" import="java.util.*" pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*"%>

<%! static int counter=0; %>
<%
counter++;
 try {
	 String subject= request.getParameter("subject");
	 String url="jdbc:mysql://mysql:3306/LetsQuo";
     String user="user";
     String password="password";
	 Class.forName("com.mysql.jdbc.Driver").newInstance();
	 Connection con=DriverManager.getConnection(url,user,password);
String question= request.getParameter("question");
String option1= request.getParameter("option1");
String option2= request.getParameter("option2");
String option3= request.getParameter("option3");
String option4= request.getParameter("option4");
String answer=request.getParameter("answer");
String description=request.getParameter("description");
PreparedStatement ps1=con.prepareStatement("select max(quizname) from QUIZINFO");
ResultSet rs=ps1.executeQuery();
while(rs.next()){
String quizname= rs.getString(1);

//System.out.print(quizname);

PreparedStatement ps=con.prepareStatement("insert into QUIZQUES values(?,?,?,?,?,?,?,?,?)");

ps.setString(1,question);
ps.setString(2,option1);
ps.setString(3,option2);
ps.setString(4,option3);
ps.setString(5,option4);
ps.setString(6,answer);
ps.setString(7,quizname);
ps.setString(8,null);
ps.setString(9,description);
int s= ps.executeUpdate();


}

}
catch(Exception e){e.printStackTrace();}

%>
<% 
request.setAttribute("counter",counter);
%>
<jsp:forward page="createquiz1.jsp"></jsp:forward>

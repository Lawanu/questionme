package mylisteners;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;

import com.mysql.jdbc.DatabaseMetaData;

/**
 * Application Lifecycle Listener implementation class MyDBlistener
 *
 */
public class MyDBlistener implements ServletContextListener {

    /**
     * Default constructor. 
     */
    public MyDBlistener() {
        // TODO Auto-generated constructor stub
    }

	/**
     * @see ServletContextListener#contextDestroyed(ServletContextEvent)
     */
    public void contextDestroyed(ServletContextEvent arg0)  { 
         // TODO Auto-generated method stub
    }

	/**
     * @see ServletContextListener#contextInitialized(ServletContextEvent)
     */
    public void contextInitialized(ServletContextEvent arg0)  { 
         // TODO Auto-generated method stub
    System.out.println("Database Check!!");
	Connection con=null;
try{
	String url="jdbc:mysql://localhost:3306/LetsQuo";
	String user="root";
	String password="";
	Class.forName("com.mysql.jdbc.Driver").newInstance();
	con=DriverManager.getConnection(url,user,password);
	System.out.println("Got Connection");
	
	//PreparedStatement ps1=con.prepareStatement("Select * from QUIZCONTACT");

	

DatabaseMetaData dbm = (DatabaseMetaData) con.getMetaData();
// check if "employee" table is there
ResultSet tables = dbm.getTables(null, null, "QUIZCONTACT", null);
if (tables.next()) {
  System.out.println("Table already exists");
}
else {
	System.out.println("Table doesnot exist");
	
    PreparedStatement ps=con.prepareStatement("CREATE TABLE QUIZCONTACT (NAME VARCHAR(4000),EMAIL VARCHAR(4000),PHONE VARCHAR(4000),MESSAGE VARCHAR(4000))");
	ps.executeUpdate();
	PreparedStatement ps1=con.prepareStatement("CREATE TABLE QUIZINFO (SUBJECT VARCHAR(4000),QUIZNAME INT(255) NOT NULL AUTO_INCREMENT,PRIMARY KEY(QUIZNAME))");
	ps1.executeUpdate();		
	

	PreparedStatement  ps2=con.prepareStatement("CREATE TABLE  QUIZQ(NAME VARCHAR(4000),EMAIL VARCHAR(4000),PHONE VARCHAR(4000),QUESTION VARCHAR(4000))");
	ps2.executeUpdate();
	
	
	PreparedStatement ps3= con.prepareStatement("CREATE TABLE  QUIZQUES(QUESTION VARCHAR(4000),OPTION1 VARCHAR(4000),OPTION2 VARCHAR(4000),OPTION3 VARCHAR(4000),OPTION4 VARCHAR(4000),ANSWER VARCHAR(4000),QUIZNAME INT(255) NOT NULL,QID INT(255) NOT NULL AUTO_INCREMENT,DESCRIPTION VARCHAR(4000),PRIMARY KEY(QID),FOREIGN KEY (QUIZNAME) REFERENCES QUIZINFO(QUIZNAME))");
	ps3.executeUpdate();
	
	
	PreparedStatement ps4= con.prepareStatement("CREATE TABLE  QUIZREGISTER (USERNAME VARCHAR (4000),USERPASS VARCHAR(4000),CATEGORY VARCHAR(4000),EMAIL VARCHAR(4000))");
	ps4.executeUpdate();
}
}
	
    catch(Exception e){
    	e.printStackTrace();
    	
    }
    }
	
}

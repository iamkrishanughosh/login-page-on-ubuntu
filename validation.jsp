<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
     <%@page import="java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>

  <body>
    <%
      String getFirstName = request.getParameter("username");
      //System.out.println(getFirstName);
      
      String getLastName = request.getParameter("password");
      //System.out.println(getLastName);
      boolean flag=false;
    try 
    {
    	
    	Class.forName("com.mysql.jdbc.Driver");
    	Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/login", "root", "password");
		if (!con.isClosed())
			System.out.println("Successfully connected to MySQL server...");
      
      Statement stmt = con.createStatement();
      
      String sql = "select * from user_pwd where (username='"+getFirstName+"') and (password='"+getLastName+"') " ;
     // System.out.println("sql " + sql);
      
      ResultSet rs = stmt.executeQuery(sql); 
     
      while(rs.next()) 
      {	  
       flag=true;	  
       //System.out.println(rs.getString(1)+"  "+rs.getString(2)); 
       }
      if(flag==true)
      {
    	  response.sendRedirect("member.jsp");
      }
      else
      {
    	  response.sendRedirect("error.jsp");
      }
      rs.close();
      rs = null;
    }
    catch (Exception e)
    {
      e.getMessage();
    } 
    
    %>
  </body>
</html>
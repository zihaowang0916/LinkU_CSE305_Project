<%@page import="java.util.Calendar"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<div>
	<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Welcome to Mayalu</title>
<link rel="stylesheet"
	href="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="http://cdn.static.runoob.com/libs/jquery/2.1.1/jquery.min.js"></script>
<script
	src="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/js/bootstrap.min.js"></script>

	</head>
</div>
<body>

<%
String mysJDBCDriver = "com.mysql.jdbc.Driver"; 
String mysURL ="jdbc:mysql://127.0.0.1:3306/Mayalu";
String mysUserID = "root"; 
String mysPassword = "8812992";
 java.sql.Connection conn=null;

 try 
	{
 	Class.forName(mysJDBCDriver).newInstance();
		java.util.Properties sysprops=System.getProperties();
		sysprops.put("user",mysUserID);
		sysprops.put("password",mysPassword);

		//connect to the database
 			conn=java.sql.DriverManager.getConnection(mysURL,sysprops);
 			System.out.println("Connected successfully to database using JConnect");
 
 			java.sql.Statement stmt1=conn.createStatement();
 			String sql="backup database Mayalu to disk='/Users/samzhang/Desktop/eclipse'";
		java.sql.ResultSet rs = stmt1.executeQuery(sql);
			
	} catch(Exception e)
	{
		e.printStackTrace();
		out.print(e.toString());
	}
	finally{
	
		try{conn.close();}catch(Exception ee){};
	}



%>

</body>
</html>
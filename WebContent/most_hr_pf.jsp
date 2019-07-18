
<%@ page language="java" import="java.sql.*, java.util.*" %>
<%@page import="java.util.Calendar"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>the most highly rated profile</title>
<style>
table, th, td{
 margin: 0 auto;
 font-size: 14px;
 box-sizing: padding-box;
 padding: 10px;
}
.buttonContainer {
	text-align: center;
}

.button {
	display: inline-block;
	border-radius: 4px;
	background-color: #f4511e;
	border: none;
	color: #FFFFFF;
	text-align: center;
	font-size: 13px;
	padding: 20px;
	width: 15%;
	transition: all 0.5s;
	cursor: pointer;
	margin: 5px;
}

.button span {
	cursor: pointer;
	display: inline-block;
	position: relative;
	transition: 0.5s;
}

.button span:after {
	content: '\00bb';
	position: absolute;
	opacity: 0;
	top: 0;
	right: -20px;
	transition: 0.5s;
}

.button:hover span {
	padding-right: 25px;
}

.button:hover span:after {
	opacity: 1;
	right: 0;
}
</style>
</head>
<body background="image/heart.png">

	<br>
	<br>
	<br>
	
	<h2 align="center">the most highly rated profile</h2>
	<div align="center">
	<table align="center" border="1"
				style="background-color: #FFC0CB;">
				<tr>
					<td align="center">Profile id</td>
					<td align="center">Average rating</td>
					<td align="center">Age</td>
					<td align="center">Gender</td>
					<td align="center">Hobby</td>
					<td align="center">Height</td>
					<td align="center">Weight</td>
					<td align="center">Hair color</td>
					<td align="center">City</td>
					<td align="center">State</td>
				</tr>
	<%

	String UserIdd = session.getAttribute("finalid").toString();
	session.setAttribute("finalid",UserIdd);
		String mysJDBCDriver = "com.mysql.jdbc.Driver";
		String mysURL = "jdbc:mysql://127.0.0.1:3306/Mayalu";
		String mysUserID = "root";
		String mysPassword = "8812992";
		java.sql.Connection conn = null;

		try {
			Class.forName(mysJDBCDriver).newInstance();
			java.util.Properties sysprops = System.getProperties();
			sysprops.put("user", mysUserID);
			sysprops.put("password", mysPassword);

			//connect to the database
			conn = java.sql.DriverManager.getConnection(mysURL, sysprops);
			//out.println("Connected successfully to database using JConnect");

			java.sql.Statement stmt1 = conn.createStatement();
			java.sql.Statement stmt2 = conn.createStatement();
			
		String s = "SELECT Customer, Rating FROM( SELECT Profile1 AS Customer, U1Rated AS Rating FROM DateData UNION SELECT Profile2, U2Rated FROM DateData ORDER BY Customer) temp WHERE Rating = (SELECT MAX(Rating) FROM( SELECT Profile1 AS Customer, U1Rated AS Rating FROM DateData UNION SELECT Profile2, U2Rated FROM DateData ORDER BY Customer) temp);";

		java.sql.ResultSet rs=stmt1.executeQuery(s);
		while(rs.next()){
			
			%>
				
				
				<tr>
				<td align="center">
				<% out.print(rs.getString("Customer")); %>
				</td>
				<td align="center">
				<% out.print(rs.getString("Rating")); %>
				</td>
				
			<%
			
			String pfid = rs.getString("Customer");
			String s1 = "SELECT * FROM ProfileData WHERE ProfileID='"+pfid+"'";

			java.sql.ResultSet rs1=stmt2.executeQuery(s1);	
			if(rs1.next()){
				
			}
			
			%>
				<td align="center">
					<% out.print(rs1.getString("Age")); %>
					</td>
				<td align="center">
					<% out.print(rs1.getString("Gender")); %>
					</td>
				<td align="center">
					<% out.print(rs1.getString("Hobby")); %>
					</td>
				<td align="center">
					<% out.print(rs1.getString("Height")); %>
					</td>
				<td align="center">
					<% out.print(rs1.getString("Weight")); %>
					</td>
				<td align="center">
					<% out.print(rs1.getString("HairColor")); %>
					</td>
				<td align="center">
					<% out.print(rs1.getString("City")); %>
					</td>
				<td align="center">
					<% out.print(rs1.getString("State")); %>
					</td>
			</tr>
			<%	
			}
			
			%>
		</table>
		</div>
		<br>
		
		<form action="user_login.jsp" method="post">
		<div align="center">
			<ul>

				
				<div class="buttonContainer">
					<button stylestyle="vertical-align: middle" class="button">
						<span>Continue</span>
					</button>
				</div>
			</ul>
		</div>
	</form>
		<%
		
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			
		}
	%>

	<jsp:include flush="true" page="footer.jsp"></jsp:include>
</body>
</html>

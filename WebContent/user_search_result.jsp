
<%@ page language="java" import="java.sql.*, java.util.*" %>
<%@page import="java.util.Calendar"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Searching result</title>
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
			
			
		String s="";
		
		String pf1=request.getParameter("yID");
	 	String SS=request.getParameter("SS");
	 	String sc=request.getParameter("sc");
	 	String ID=request.getParameter("ID");
	 	ID=ID.replaceAll("'","");
	 	
	 	if(sc.isEmpty()){
	 		%>
	 		 <h3 align="center">Searching condition can't be empty.</h3>
	 		 <div class="buttonContainer">
					<button stylestyle="vertical-align: middle" class="button" onclick="document.location.href='user_login.jsp'">
						<span>Continue</span>
					</button>
				</div>
	 		
	 		<%
	 		return;
	 	}
	 	if(SS.equals("ProfileID")){
	 		s= "select * from ProfileData where "+request.getParameter("SS")+"='"+request.getParameter("sc")+"' ";
	 		java.sql.ResultSet mytemp=stmt1.executeQuery(s);
	 		if(!mytemp.next()){
	 			%>
		 		 <h3 align="center">Searching profile id doesn't exist.</h3>
		 		 <div class="buttonContainer">
						<button stylestyle="vertical-align: middle" class="button" onclick="document.location.href='user_login.jsp'">
							<span>Continue</span>
						</button>
					</div>
		 		
		 		<%
	 			return;
	 		}
	 		
	 	}
	 	
	 	if(SS.equals("Age")){
	 		int a,b;
	 		try{
				a=Integer.parseInt(sc);
				if(a<18){
					%>
			 		 <h3 align="center">Your searching age is wrong.(18-75)</h3>
			 		 <div class="buttonContainer">
							<button stylestyle="vertical-align: middle" class="button" onclick="document.location.href='user_login.jsp'">
								<span>Continue</span>
							</button>
						</div>
			 		
			 		<%
		 			return;
					
				}
				if(a>75){
					%>
			 		 <h3 align="center">Your searching age is wrong.(18-75)</h3>
			 		 <div class="buttonContainer">
							<button stylestyle="vertical-align: middle" class="button" onclick="document.location.href='user_login.jsp'">
								<span>Continue</span>
							</button>
						</div>
			 		
			 		<%
		 			return;
					
				}
				b = a+6;
				a = a-6;
				if(a<18)
					a=18;
				if(b>75)
					b=75;
				s= "select * from ProfileData where "+request.getParameter("SS")+">'"+a+"' and "+request.getParameter("SS")+"<'"+b+"' ";
			}catch(NumberFormatException nn){
				%>
		 		 <h3 align="center">Your searching age is wrong.(18-75)</h3>
		 		 <div class="buttonContainer">
						<button stylestyle="vertical-align: middle" class="button" onclick="document.location.href='user_login.jsp'">
							<span>Continue</span>
						</button>
					</div>
		 		
		 		<%
	 			return;
			}		
	 		

	 		
	 	}
	 	if(SS.equals("Gender")){
	 		s= "select * from ProfileData where "+request.getParameter("SS")+"='"+request.getParameter("sc")+"' ";
	 		java.sql.ResultSet mytemp=stmt1.executeQuery(s);
	 		if(!mytemp.next()){
	 			%>
		 		 <h3 align="center">Searching profile id doesn't exist.</h3>
		 		 <div class="buttonContainer">
						<button stylestyle="vertical-align: middle" class="button" onclick="document.location.href='user_login.jsp'">
							<span>Continue</span>
						</button>
					</div>
		 		
		 		<%
	 			return;
	 		}
	 		
	 	}
	 	if(SS.equals("HairColor")){
	 		s= "select * from ProfileData where "+request.getParameter("SS")+"='"+request.getParameter("sc")+"' ";
	 		java.sql.ResultSet mytemp=stmt1.executeQuery(s);
	 		if(!mytemp.next()){
	 			%>
		 		 <h3 align="center">Searching profile id doesn't exist.</h3>
		 		 <div class="buttonContainer">
						<button stylestyle="vertical-align: middle" class="button" onclick="document.location.href='user_login.jsp'">
							<span>Continue</span>
						</button>
					</div>
		 		
		 		<%
	 			return;
	 		}
	 		
	 	}
	 	if(SS.equals("City")){
	 		s= "select * from ProfileData where "+request.getParameter("SS")+"='"+request.getParameter("sc")+"' ";
	 		java.sql.ResultSet mytemp=stmt1.executeQuery(s);
	 		if(!mytemp.next()){
	 			%>
		 		 <h3 align="center">Searching profile id doesn't exist.</h3>
		 		 <div class="buttonContainer">
						<button stylestyle="vertical-align: middle" class="button" onclick="document.location.href='user_login.jsp'">
							<span>Continue</span>
						</button>
					</div>
		 		
		 		<%
	 			return;
	 		}
	 		
	 	}
	 	if(SS.equals("State")){
	 		s= "select * from ProfileData where "+request.getParameter("SS")+"='"+request.getParameter("sc")+"' ";
	 		java.sql.ResultSet mytemp=stmt1.executeQuery(s);
	 		if(!mytemp.next()){
	 			%>
		 		 <h3 align="center">Searching profile id doesn't exist.</h3>
		 		 <div class="buttonContainer">
						<button stylestyle="vertical-align: middle" class="button" onclick="document.location.href='user_login.jsp'">
							<span>Continue</span>
						</button>
					</div>
		 		
		 		<%
	 			return;
	 		}
	 		
	 	}
	 	if(SS.equals("Weight")){
	 		int a,b;
	 		try{
				a=Integer.parseInt(sc);
				if(a<50){
					%>
			 		 <h3 align="center">Your searching weight is wrong.(50-500 lbs)</h3>
			 		 <div class="buttonContainer">
							<button stylestyle="vertical-align: middle" class="button" onclick="document.location.href='user_login.jsp'">
								<span>Continue</span>
							</button>
						</div>
			 		
			 		<%
		 			return;
					
				}
				if(a>500){
					%>
			 		 <h3 align="center">Your searching weight is wrong.(50-500 lbs)</h3>
			 		 <div class="buttonContainer">
							<button stylestyle="vertical-align: middle" class="button" onclick="document.location.href='user_login.jsp'">
								<span>Continue</span>
							</button>
						</div>
			 		
			 		<%
		 			return;
					
				}
				b = a+30;
				a = a-30;
				if(a<50)
					a=50;
				if(b>500)
					b=500;
				s= "select * from ProfileData where "+request.getParameter("SS")+">'"+a+"' and "+request.getParameter("SS")+"<'"+b+"' ";
			}catch(NumberFormatException nn){
				%>
		 		 <h3 align="center">Your searching weight is wrong.(50-500 lbs)</h3>
		 		 <div class="buttonContainer">
						<button stylestyle="vertical-align: middle" class="button" onclick="document.location.href='user_login.jsp'">
							<span>Continue</span>
						</button>
					</div>
		 		
		 		<%
	 			return;
			}		
	 		

	 		
	 	}
		
		
		
		
		%>
			<div align="center">
	<table align="center" border="1"
				style="background-color: #FFC0CB;">
				<tr>
					<td align="center">Profile id</td>
					<td align="center">Profile name</td>
					<td align="center">Age</td>
					<td align="center">Gender</td>
					<td align="center">Hobby</td>
					<td align="center">Height</td>
					<td align="center">Weight</td>
					<td align="center">Hair color</td>
					<td align="center">City</td>
					<td align="center">State</td>
					<td align="center">Last modified date</td>
					<td align="center">Like</td>
					<td align="center">Refer</td>
				</tr>
		
		<% 
		
		java.sql.ResultSet rs=stmt1.executeQuery(s);
		while(rs.next()){
			if(rs.getString("UserId").equals(ID)){
				continue;
			}
			
			%>
				
				
				<tr>
				<td align="center">
				<% out.print(rs.getString("ProfileID")); %>
				</td>
				<td align="center">
				<% out.print(rs.getString("ProfileName")); %>
				</td>
				
				<td align="center">
					<% out.print(rs.getString("Age")); %>
					</td>
				<td align="center">
					<% out.print(rs.getString("Gender")); %>
					</td>
				<td align="center">
					<% out.print(rs.getString("Hobby")); %>
					</td>
				<td align="center">
					<% out.print(rs.getString("Height")); %>
					</td>
				<td align="center">
					<% out.print(rs.getString("Weight")); %>
					</td>
				<td align="center">
					<% out.print(rs.getString("HairColor")); %>
					</td>
				<td align="center">
					<% out.print(rs.getString("City")); %>
					</td>
				<td align="center">
					<% out.print(rs.getString("State")); %>
					</td>
				<td align="center">
					<% out.print(rs.getString("LastModDate")); %>
					</td>
				<td align="center"> <a href="user_like_make_date.jsp?PF1=<%=request.getParameter("yID")%>&PF2=<%=rs.getString("ProfileID")%>">Like</a></td>
				<td align="center"> <a href="user_refer.jsp?PF1=<%=request.getParameter("yID")%>&PF2=<%=rs.getString("ProfileID")%>">Refer</a></td>
				
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

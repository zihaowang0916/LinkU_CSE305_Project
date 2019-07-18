
<%@ page language="java" import="java.sql.*, java.util.*" %>
<%@page import="java.util.Calendar"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Editing profile result</title>
<style>
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



	<%
		String  userid = session.getAttribute("finalid").toString(); 
		session.setAttribute("finalid", userid);

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
			

	
/*************************************************************************************************************/
		String pfname = request.getParameter("pfname");
		String age = request.getParameter("age");
		String sage = request.getParameter("sage");
		String eage = request.getParameter("eage");
		String geo= request.getParameter("geo");
		String gender = request.getParameter("gender");
		String hobby = request.getParameter("hobby");
		String height = request.getParameter("height");
		String weight = request.getParameter("weight");
		String hair = request.getParameter("hair");
		String city = request.getParameter("city");
		String st = request.getParameter("state");
		String ID = session.getAttribute("PF").toString(); 
		session.setAttribute("PF", ID);
		
		String currDate = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss").format(Calendar.getInstance().getTime());
		int a;
		
		stmt1.executeUpdate("UPDATE ProfileData SET LastModDate = '"+currDate+"' WHERE ProfileID='"+ID+"'");
		if(!pfname.isEmpty()){
			stmt1.executeUpdate("UPDATE ProfileData SET ProfileName = '"+pfname+"' WHERE ProfileID='"+ID+"'");
		}
		if(!age.isEmpty()){
			try{
				a=Integer.parseInt(age);
				stmt1.executeUpdate("UPDATE ProfileData SET Age = '"+a+"' WHERE ProfileID='"+ID+"'");
			}catch(NumberFormatException nn){
				
			}
		}

		if(!sage.isEmpty()){
			try{
				a=Integer.parseInt(sage);
				stmt1.executeUpdate("UPDATE ProfileData SET DateAgeRangeStart = '"+a+"' WHERE ProfileID='"+ID+"'");
			}catch(NumberFormatException nn){
			
			}		
		}
		if(!eage.isEmpty()){
			try{
				a=Integer.parseInt(eage);
				stmt1.executeUpdate("UPDATE ProfileData SET DateAgeRangeEnd = '"+a+"' WHERE ProfileID='"+ID+"'");
			}catch(NumberFormatException nn){
			
			}
		}
		if(!geo.isEmpty()){
			try{
				a=Integer.parseInt(geo);
				stmt1.executeUpdate("UPDATE ProfileData SET DatingGeoRange = '"+a+"' WHERE ProfileID='"+ID+"'");
			}catch(NumberFormatException nn){
			
			}
		}
		if(!gender.isEmpty()){
			stmt1.executeUpdate("UPDATE ProfileData SET Gender = '"+gender+"' WHERE ProfileID='"+ID+"'");
		}
		if(!hobby.isEmpty()){
			stmt1.executeUpdate("UPDATE ProfileData SET Hobby = '"+hobby+"' WHERE ProfileID='"+ID+"'");
		}
		if(!height.isEmpty()){
			stmt1.executeUpdate("UPDATE ProfileData SET Height = '"+height+"' WHERE ProfileID='"+ID+"'");
		}
		if(!weight.isEmpty()){
			try{
				a=Integer.parseInt(weight);
				stmt1.executeUpdate("UPDATE ProfileData SET Weight = '"+a+"' WHERE ProfileID='"+ID+"'");
			}catch(NumberFormatException nn){
			
			}
		}
		if(!hair.isEmpty()){
			stmt1.executeUpdate("UPDATE ProfileData SET HairColor = '"+hair+"' WHERE ProfileID='"+ID+"'");
		}
		if(!city.isEmpty()){
			stmt1.executeUpdate("UPDATE ProfileData SET City = '"+city+"' WHERE ProfileID='"+ID+"'");
		}
		if(!st.isEmpty()){
			stmt1.executeUpdate("UPDATE ProfileData SET State = '"+st+"' WHERE ProfileID='"+ID+"'");
		}
		%>
		<br>
		<br>
		<br>
		<br>
		<form action="user_login.jsp" method="post">
		<div align="center">
			<ul>

				<h3>Your profile edited successfully!</h3>
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

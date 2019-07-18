

<%@page import="java.util.Calendar"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>refer result</title>
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
	String UserIdd = session.getAttribute("finalid").toString();
	session.setAttribute("finalid",UserIdd);
		String  A = session.getAttribute("UA").toString(); 
		String  B = session.getAttribute("UB").toString(); 
		String  C = request.getParameter("UC");

		String mysJDBCDriver = "com.mysql.jdbc.Driver";
		String mysURL = "jdbc:mysql://127.0.0.1:3306/Mayalu";
		String mysUserID = "root";
		String mysPassword = "8812992";
		java.sql.Connection conn = null;
		String currDate = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss").format(Calendar.getInstance().getTime());

		try {
			Class.forName(mysJDBCDriver).newInstance();
			java.util.Properties sysprops = System.getProperties();
			sysprops.put("user", mysUserID);
			sysprops.put("password", mysPassword);

			//connect to the database
			conn = java.sql.DriverManager.getConnection(mysURL, sysprops);
			//out.println("Connected successfully to database using JConnect");

			java.sql.Statement stmt2 = conn.createStatement();
			java.sql.Statement stmt5 = conn.createStatement();
			java.sql.Statement stmt6 = conn.createStatement();
			java.sql.ResultSet rs5 = stmt5.executeQuery("select * from ProfileData where ProfileID= '"+B+"'");
			java.sql.ResultSet rs6 = stmt6.executeQuery("select * from ProfileData where ProfileID= '"+C+"'");
			if(rs5.next()){
				
			}
			if(rs6.next()){
				
			}
			if(rs5.getString("UserId").equals(rs6.getString("UserId"))){
				%>
		 		 <h3 align="center">These profiles belong to same person.</h3>
		 		 <div class="buttonContainer">
						<button stylestyle="vertical-align: middle" class="button" onclick="document.location.href='user_login.jsp'">
							<span>Go to login</span>
						</button>
					</div>
		 		
		 		<%
				
				
				return;
			}
		
		
		stmt2.executeUpdate("insert into ReferralData(UserA,UserB,UserC,Time)values('"+A+"', '"+B+"','"+C+"' , '"+currDate+"');");
		%>
		<br>
		<br>
		<br>
		<br>
		<form action="user_login.jsp" method="post">
		<div align="center">
			<ul>

				<h3>You refer successfully!</h3>
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

<%@ page language="java" import="java.sql.*, java.util.*" %>
<%@page import="java.util.Calendar"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Adding profile result</title>
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
		String currDate = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss").format(Calendar.getInstance().getTime());

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

			if (request.getParameter("pfid").isEmpty()
					|| request.getParameter("age").isEmpty()) {
	%>
	<br>
	<br>
	<br>
	<br>
	
	<form action="user_add_pf.jsp" method="post">
		<div align="center">
			<ul>

				<h3>Your profile id and age can not be empty</h3>
				<div class="buttonContainer">
					<button stylestyle="vertical-align: middle" class="button">
						<span>Go To Previous Page</span>
					</button>
				</div>
			</ul>
		</div>
	</form>
	<%
		return;
		}
	int age;
	int eage;
	int sage;
	try{
	age=Integer.parseInt(request.getParameter("age"));
	eage=Integer.parseInt(request.getParameter("eage"));
	sage=Integer.parseInt(request.getParameter("sage"));
	}catch(NumberFormatException nn){
		%>
		<br>
	<br>
	<br>
	<br>
	
	<form action="user_add_pf.jsp" method="post">
		<div align="center">
			<ul>

				<h3>Your need give the correct age</h3>
				<h3>All age section need between 18-75</h3>
				<div class="buttonContainer">
					<button stylestyle="vertical-align: middle" class="button">
						<span>Go To Previous Page</span>
					</button>
				</div>
			</ul>
		</div>
	</form>
	
		
		<%
		return;
		
	}
	
	if (age<18||age>75||sage<18||eage>75||sage>eage) {
	%>
	<br>
	<br>
	<br>
	<br>
	
	<form action="user_add_pf.jsp" method="post">
		<div align="center">
			<ul>

				<h3>Your need give the correct age</h3>
				<h3>All age section need between 18-75</h3>
				<div class="buttonContainer">
					<button stylestyle="vertical-align: middle" class="button">
						<span>Go To Previous Page</span>
					</button>
				</div>
			</ul>
		</div>
	</form>
	<%
		return;
		}
	
	int he;
	int we;
	
	try{
	we=Integer.parseInt(request.getParameter("weight"));
	}catch(NumberFormatException nn){
		%>
		<br>
	<br>
	<br>
	<br>
	
	<form action="user_add_pf.jsp" method="post">
		<div align="center">
			<ul>

				<h3>Your need give the correct weight</h3>
				<div class="buttonContainer">
					<button stylestyle="vertical-align: middle" class="button">
						<span>Go To Previous Page</span>
					</button>
				</div>
			</ul>
		</div>
	</form>
	
		
		<%
		return;
		
	}		
	
	int geo; 
	try{
		geo=Integer.parseInt(request.getParameter("geo"));
		
		}catch(NumberFormatException nn){
			%>
			<br>
		<br>
		<br>
		<br>
		
		<form action="user_add_pf.jsp" method="post">
			<div align="center">
				<ul>

					<h3>Your need give the correct geo-location range</h3>
					<div class="buttonContainer">
						<button stylestyle="vertical-align: middle" class="button">
							<span>Go To Previous Page</span>
						</button>
					</div>
				</ul>
			</div>
		</form>
		
			
			<%
			return;
			
		}
/*************************************************************************************************************/

                 	//currDate
				   
                   
                   String hobby = request.getParameter("hobby");
                   String height = request.getParameter("height");
                   String hair = request.getParameter("hair");
                   String city = request.getParameter("city");
                   String state = request.getParameter("state");
				   String pfid = request.getParameter("pfid");
				   String pfname = request.getParameter("pfname");
				   String ID = userid;
				   String gender = request.getParameter("gender");
		if(height.isEmpty())
			height="null";
		if(pfname.isEmpty())
			pfname="null";
		if(hobby.isEmpty())
			hobby="null";
		if(hair.isEmpty())
			hair="null";
		if(city.isEmpty())
			city="null";
		if(state.isEmpty())
			state="null";
		
		java.sql.ResultSet rs = stmt1.executeQuery("select * from ProfileData where ProfileID= '"+pfid+"'");
		while(rs.next()){
			%>
			<br>
			<br>
			<br>
			<br>
			
			<form action="user_add_pf.jsp" method="post">
				<div align="center">
					<ul>

						<h3>This profile id already exist.</h3>
						<div class="buttonContainer">
							<button stylestyle="vertical-align: middle" class="button">
								<span>Go To Previous Page</span>
							</button>
						</div>
					</ul>
				</div>
			</form>
			<%
				return;	

		}
		
		stmt2.executeUpdate("insert into ProfileData(UserId,ProfileID,ProfileName,Age,DateAgeRangeStart,DateAgeRangeEnd,DatingGeoRange,Gender,Hobby,Height,Weight,HairColor,CreationDate,LastModDate,City,State)values('"+ID+"', '"+pfid+"', '"+pfname+"', '"+age+"','"+sage+"','"+eage+"','"+geo+"','"+gender+"','"+hobby+"','"+height+"','"+we+"','"+hair+"','"+currDate+"','"+currDate+"','"+city+"','"+state+"');");
		%>
		<br>
		<br>
		<br>
		<br>
		<form action="user_login.jsp" method="post">
		<div align="center">
			<ul>

				<h3>Your profile add successfully!</h3>
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

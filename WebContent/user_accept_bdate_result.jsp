<%@ page import="java.sql.ResultSet"%>
<%@ page import="java.sql.SQLException"%>
<%@ page import="java.sql.Statement"%>
<%@ page import="java.sql.Connection"%>
<%@ page import="java.sql.DriverManager"%>
<%@ page language="java" import="java.sql.*, java.util.*" %>
<%@page import="java.util.Calendar"%>
<%@page import="java.text.SimpleDateFormat"%>

<html>
<head>
<title>accept your blind date</title>
<style>.buttonContainer {
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
	String mysJDBCDriver = "com.mysql.jdbc.Driver"; 
	String mysURL ="jdbc:mysql://127.0.0.1:3306/Mayalu";
	String mysUserID = "root"; 
	String mysPassword = "8812992";
	  			java.sql.Connection conn=null;
		try {
			Class.forName(mysJDBCDriver).newInstance();
			java.util.Properties sysprops=System.getProperties();
			sysprops.put("user",mysUserID);
			sysprops.put("password",mysPassword);
    
			//connect to the database
        			conn=java.sql.DriverManager.getConnection(mysURL,sysprops);
        			System.out.println("Connected successfully to database using JConnect");
        
        		java.sql.Statement stmt1=conn.createStatement();
    
			
				 String sql = "DELETE FROM ReferralData WHERE UserA = '" + request.getParameter("U1") + "' and UserB='" + request.getParameter("U2")  + "' and UserC='"+request.getParameter("U3")+"' and Time='" + request.getParameter("T")  + "'";
						
				stmt1.execute(sql); 
				
				
				
				Calendar c = Calendar.getInstance();
			    c.add(Calendar.WEEK_OF_MONTH, 1);
				String currDate = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss").format(c.getTime());
				String p1 = request.getParameter("U2");
				String p2 = request.getParameter("U3");
				sql = "insert into DateData(Profile1,Profile2,CustRep,Time,GeoLocation,BookingFee,U1Rated,U2Rated,Comments,IsGeoDate) values('"+p1+"','"+p2+"','NULL','"+currDate+"','NULL','0','3','3','NULL','0')";
				stmt1.executeUpdate(sql);
				
			%>
			<br>
			<br>
			<br>
			<br>
			<div align="center">
			<h3>Making a date successfully!</h3>
			</div>
			<%

		} catch (Exception e) {

			// TODO Auto-generated catch block

			out.println(e.getMessage());

			e.printStackTrace();

		}

	%>
	<div class="buttonContainer">
				<button class="button" style="vertical-align: middle" onclick="document.location.href='user_login.jsp'">
					<span>Return</span>
				</button>
			</div>
<jsp:include flush="true" page="footer.jsp"></jsp:include>	
</body>
</html>
<%@ page import="java.sql.ResultSet"%>
<%@ page import="java.sql.SQLException"%>
<%@ page import="java.sql.Statement"%>
<%@ page import="java.sql.Connection"%>
<%@ page import="java.sql.DriverManager"%>

<html>
<head>
<title>make your geo-date</title>
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
        		String  pf1 = session.getAttribute("pf1").toString();
        		String  pf2 = session.getAttribute("pf2").toString(); 
        		String  t = session.getAttribute("t").toString(); 
        		String  geo = request.getParameter("geo");
        		
        		if(geo.isEmpty()){
        			%>
        			<br>
        			<br>
        			<br>
        			<br>
        			<div align="center">
        			<h3>You don't input place.</h3>
        			</div>
        			<div class="buttonContainer">
				<button class="button" style="vertical-align: middle" onclick="document.location.href='user_make_geo_date.jsp'">
					<span>Return</span>
				</button>
			</div>
        			<%
        			
        			return;
        		}
        		int a=1;
				String sql = "UPDATE DateData SET GeoLocation = '"+geo+"' WHERE Profile1='"+pf1+"' and Profile2='"+pf2+"' and Time='"+t+"'";
				stmt1.executeUpdate(sql); 
				sql = "UPDATE DateData SET IsGeoDate = '"+a+"' WHERE Profile1='"+pf1+"' and Profile2='"+pf2+"' and Time='"+t+"'";
				stmt1.executeUpdate(sql); 
			%>
			<br>
			<br>
			<br>
			<br>
			<div align="center">
			<h3>Making geo-date successfully!</h3>
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
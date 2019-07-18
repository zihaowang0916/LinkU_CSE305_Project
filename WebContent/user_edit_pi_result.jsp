

<%@page import="java.util.Calendar"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Editing personal information result</title>
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
		String tel = request.getParameter("Tel");
		String em = request.getParameter("Email");
		String add = request.getParameter("Add");
		String ct = request.getParameter("City");
		String st = request.getParameter("State");
		String zip = request.getParameter("Zip");
		String ID = userid;

		
		if(!tel.isEmpty()){
			stmt1.executeUpdate("UPDATE CustomerData SET Telphone = '"+tel+"' WHERE UserID='"+ID+"'");
		}
		if(!em.isEmpty()){
			stmt1.executeUpdate("UPDATE CustomerData SET Email = '"+em+"' WHERE UserID='"+ID+"'");
		}
		if(!add.isEmpty()){
			stmt1.executeUpdate("UPDATE CustomerData SET Address = '"+add+"' WHERE UserID='"+ID+"'");
		}
		if(!ct.isEmpty()){
			stmt1.executeUpdate("UPDATE CustomerData SET City = '"+ct+"' WHERE UserID='"+ID+"'");
		}
		if(!st.isEmpty()){
			stmt1.executeUpdate("UPDATE CustomerData SET State = '"+st+"' WHERE UserID='"+ID+"'");
		}
		int a;
		if(!zip.isEmpty()){
			try{
				a=Integer.parseInt(zip);
				stmt1.executeUpdate("UPDATE CustomerData SET ZipCode = '"+zip+"' WHERE UserID='"+ID+"'");
			}catch(NumberFormatException nn){
				%>
				<br>
			<br>
			<br>
			<br>
			
			<form action="user_edit_personal_information.jsp" method="post">
				<div align="center">
					<ul>

						<h3>Your need give the correct zip code 10000-99999</h3>
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
			
		}
		%>
		<br>
		<br>
		<br>
		<br>
		<form action="user_login.jsp" method="post">
		<div align="center">
			<ul>

				<h3>Your information edited successfully!</h3>
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

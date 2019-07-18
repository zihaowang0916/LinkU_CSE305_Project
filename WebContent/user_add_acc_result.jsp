

<%@page import="java.util.Calendar"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Adding account result</title>
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
		String currDate = new SimpleDateFormat("yyyy-MM-dd").format(Calendar.getInstance().getTime());

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

			if (request.getParameter("AN").isEmpty()
					|| request.getParameter("CN").isEmpty()) {
	%>
	<br>
	<br>
	<br>
	<br>
	
	<form action="user_add_acc.jsp" method="post">
		<div align="center">
			<ul>

				<h3>Your credit card number and account number can not be empty</h3>
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
		String AN = request.getParameter("AN");
		String CN = request.getParameter("CN");
		String ID = userid;
		
		java.sql.ResultSet rs = stmt1.executeQuery("select * from AccountTable where UserId= '"+ID+"' and CreditCardNum='"+CN+"' and AccountNum='"+AN+"'");
		while(rs.next()){
			%>
			<br>
			<br>
			<br>
			<br>
			
			<form action="user_add_acc.jsp" method="post">
				<div align="center">
					<ul>

						<h3>Your already have this account information.</h3>
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
		int a;
		try{
			a=Integer.parseInt(CN);
			a=Integer.parseInt(AN);
		}catch(NumberFormatException nn){
			%>
			<br>
		<br>
		<br>
		<br>
		
		<form action="user_add_acc.jsp" method="post">
			<div align="center">
				<ul>

					<h3>Your need give the correct account number and credit card number.</h3>
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
		
		
		
		
		stmt2.executeUpdate("insert into AccountTable(UserId,CreditCardNum,AccountNum,AccountCreation)values('"+ID+"', '"+CN+"', '"+AN+"', '"+currDate+"');");
		%>
		<br>
		<br>
		<br>
		<br>
		<form action="user_login.jsp" method="post">
		<div align="center">
			<ul>

				<h3>Your credit account add successfully!</h3>
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

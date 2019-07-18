
<%@page import="java.util.Calendar"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="css/indexStyle.css">
<title>Login Page</title>
</head>
<body style="background-image: url('css/be.png')">



	<%
		String mysJDBCDriver = "com.mysql.jdbc.Driver";
		String mysURL = "jdbc:mysql://127.0.0.1:3306/Mayalu";
		String mysUserID = "root";
		String mysPassword = "8812992";
		java.sql.Connection conn = null;
		String userDefault = "User-User";
		int threeDefault = 3;
		String currDate = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(Calendar.getInstance().getTime());

		try {
			Class.forName(mysJDBCDriver).newInstance();
			java.util.Properties sysprops = System.getProperties();
			sysprops.put("user", mysUserID);
			sysprops.put("password", mysPassword);

			//connect to the database
			conn = java.sql.DriverManager.getConnection(mysURL, sysprops);
			//            		out.println("Connected successfully to database using JConnect");

			java.sql.Statement stmt1 = conn.createStatement();

			if (request.getParameter("firstname").isEmpty() || request.getParameter("Password").isEmpty()) {
	%>
	<form name="signup" action="index.jsp" method="post">
		<div
			style="position: absolute; top: 40%; left: 50%; transform: translate(-50%, -50%); text-align: center">
			<ul>

				<li style="list-style-type: none; float: top; color: black"><p>Your
						UserName or Password can not be empty</p></li>
				<li style="list-style-type: none; float: top;">
					<button style="height: 25px;" class="button1">Go To
						Previous Page</button>
				</li>
			</ul>
		</div>
	</form>
	<%
		return;

			}

			if (request.getParameter("role").equals("Customer")) {

				java.sql.ResultSet rs = stmt1.executeQuery(
						"select * from CustomerData where UserId='" + request.getParameter("firstname") + "'");
				if (!rs.next()) {
	%>
	<form name="signup" action="index.jsp" method="post">
		<div
			style="position: absolute; top: 40%; left: 50%; transform: translate(-50%, -50%); text-align: center">
			<ul>

				<li style="list-style-type: none; float: top; color: black"><p>Invalid
						UserName</p></li>
				<li style="list-style-type: none; float: top;">
					<button style="height: 25px;" class="button1">Login again</button>
				</li>
			</ul>
		</div>
	</form>
	<%
		//out.print("hope");
					return;
				}

				java.sql.ResultSet passw = stmt1.executeQuery(
						"select * from CustomerData where UserId='" + request.getParameter("firstname") + "'");
				if (passw.next()) {
				}
				String getPassword = passw.getString("Password");
				//out.println("ttttttt");
				if (!getPassword.equals(request.getParameter("Password"))) {
					//out.println("2");
	%>
	<form name="signup" action="index.jsp" method="post">
		<div
			style="position: absolute; top: 40%; left: 50%; transform: translate(-50%, -50%); text-align: center">
			<ul>

				<li style="list-style-type: none; float: top; color: black"><p>Your
						Password is't correct!</p></li>
				<li style="list-style-type: none; float: top;">
					<button style="height: 25px;" class="button1">Login again</button>
				</li>
			</ul>
		</div>
	</form>
	<%
		return;
				}
				if (getPassword.equals(request.getParameter("Password"))) {
					// out.println("3");
	%>
	<form name="signup" action="user_login.jsp" method="post">
		<div
			style="position: absolute; top: 40%; left: 50%; transform: translate(-50%, -50%); text-align: center">
			<ul>

				<li style="list-style-type: none; float: top; color: black"><p>Welcome
						back</p></li>
				<li style="list-style-type: none; float: top;">
					<button style="height: 25px;" class="button1">Your main
						page</button>
				</li>
			</ul>
		</div>
	</form>
	<%
		session.setAttribute("finalid", request.getParameter("firstname"));
					return;
				}

				//                       <form name="signup" action="index.jsp" method="post">
				//                            <div  style="position: absolute;top:40%;left:50%;transform: translate(-50%, -50%);
				//            text-align: center">
				//                             <ul>
				//                   
				//                                <li style="list-style-type:none;float: top;color: black"><p>This UserId has been signed up,can you use another one</p></li>
				//                                <li style="list-style-type:none;float: top;">
				//                                   <button  style="height: 25px;" class="button1" >Go To Previous Page</button>
				//                                </li>
				//                            </ul>
				//                            </div>
				//                            </form>

			}
			if (request.getParameter("role").equals("cus_rep") || request.getParameter("role").equals("Manager")) {
				java.sql.ResultSet rt = stmt1.executeQuery(
						"select * from EmployeeData where SSN='" + request.getParameter("firstname") + "'");

				if (!rt.next()) {
	%>
	<form name="signup" action="index.jsp" method="post">
		<div
			style="position: absolute; top: 40%; left: 50%; transform: translate(-50%, -50%); text-align: center">
			<ul>

				<li style="list-style-type: none; float: top; color: black"><p>Invalid
						SSN For Employee</p></li>
				<li style="list-style-type: none; float: top;">
					<button style="height: 25px;" class="button1">Login again</button>
				</li>
			</ul>
		</div>
	</form>
	<%
		return;
				}
				java.sql.ResultSet passwordEmployee = stmt1.executeQuery(
						"select * from EmployeeData where SSN='" + request.getParameter("firstname") + "'");
				if (passwordEmployee.next()) {
				}

				String getPassEmployee = passwordEmployee.getString("EPassword");
				if (!getPassEmployee.equals(request.getParameter("Password"))) {
	%>
	<form name="signup" action="index.jsp" method="post">
		<div
			style="position: absolute; top: 40%; left: 50%; transform: translate(-50%, -50%); text-align: center">
			<ul>

				<li style="list-style-type: none; float: top; color: black"><p>Your
						Password is't correct!</p></li>
				<li style="list-style-type: none; float: top;">
					<button style="height: 25px;" class="button1">Login again</button>
				</li>
			</ul>
		</div>
	</form>
	<%
		return;
				}
				if (getPassEmployee.equals(request.getParameter("Password"))) {
					if (request.getParameter("role").equals("cus_rep")) {
						if (!passwordEmployee.getString("Role").equals("CustRep")) {
	%>
	<form name="signup" action="index.jsp" method="post">
		<div
			style="position: absolute; top: 40%; left: 50%; transform: translate(-50%, -50%); text-align: center">
			<ul>

				<li style="list-style-type: none; float: top; color: black"><p>You
						are manager, please choose manager login.</p></li>
				<li style="list-style-type: none; float: top;">
					<button style="height: 25px;" class="button1">Login again</button>
				</li>
			</ul>
		</div>
	</form>


	<%
		return;
						}
	%>
	<form name="signup" action="customer_rep_level.jsp" method="post">
		<div
			style="position: absolute; top: 40%; left: 50%; transform: translate(-50%, -50%); text-align: center">
			<ul>

				<li style="list-style-type: none; float: top"><p>Welcome
						back</p></li>
				<li style="list-style-type: none; float: top;">
					<button style="height: 25px;" class="button1">Customer
						Representative Page</button>
				</li>
			</ul>
		</div>
	</form>
	<%
		session.setAttribute("finalid", request.getParameter("firstname"));
						return;
					}
					if (request.getParameter("role").equals("Manager")) {

						if (!passwordEmployee.getString("Role").equals("Manager")) {
	%>
	<form name="signup" action="index.jsp" method="post">
		<div
			style="position: absolute; top: 40%; left: 50%; transform: translate(-50%, -50%); text-align: center">
			<ul>

				<li style="list-style-type: none; float: top; color: black"><p>You
						are not manager, please choose Customer representative login.</p></li>
				<li style="list-style-type: none; float: top;">
					<button style="height: 25px;" class="button1">Login again</button>
				</li>
			</ul>
		</div>
	</form>


	<%
		return;
						}
	%>
	<form name="signup" action="manager_level.jsp" method="post">
		<div
			style="position: absolute; top: 40%; left: 50%; transform: translate(-50%, -50%); text-align: center">
			<ul>

				<li style="list-style-type: none; float: top"><p>Welcome
						back</p></li>
				<li style="list-style-type: none; float: top;">
					<button style="height: 25px;" class="button1">Manager
						Page</button>
				</li>
			</ul>
		</div>
	</form>
	<%
		session.setAttribute("finalid", request.getParameter("firstname"));
						return;
					}

				}

				//                        session.setAttribute("finalid",request.getParameter("UserId") );

			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				conn.close();
			} catch (Exception ee) {
				ee.printStackTrace();
			}
		}
	%>

</body>
</html>

<%@page import="java.util.Calendar"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<div>
	<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Welcome to Mayalu</title>
<link rel="stylesheet"
	href="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="http://cdn.static.runoob.com/libs/jquery/2.1.1/jquery.min.js"></script>
<script
	src="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<style>
table, th, td{
 margin: 0 auto;
 font-size: 14px;
 box-sizing: padding-box;
 padding: 10px;
}
.mytable {
	cellpadding: 30;
	border: 1px white;
}

h2 {
	margin: 0;
	display: inline;
	padding-left: 1%;
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
</div>
<body background="image/heart.png">



	<%
	/* get the user id from log in page */
String UserIdd = session.getAttribute("finalid").toString();
session.setAttribute("finalid",UserIdd);
String mysJDBCDriver = "com.mysql.jdbc.Driver"; 
String mysURL ="jdbc:mysql://127.0.0.1:3306/Mayalu";
String mysUserID = "root"; 
String mysPassword = "8812992";
  			java.sql.Connection conn=null;
			try 
			{
            	Class.forName(mysJDBCDriver).newInstance();
    			java.util.Properties sysprops=System.getProperties();
    			sysprops.put("user",mysUserID);
    			sysprops.put("password",mysPassword);
        
				//connect to the database
            			conn=java.sql.DriverManager.getConnection(mysURL,sysprops);
            			System.out.println("Connected successfully to database using JConnect");
            
            			java.sql.Statement stmt1=conn.createStatement();
            			
            		String currDate = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss").format(Calendar.getInstance().getTime());
            		stmt1.executeUpdate("UPDATE CustomerData SET LastActiveTime = '"+currDate+"' WHERE UserID='"+UserIdd+"'");
					java.sql.ResultSet rs = stmt1.executeQuery("select * from CustomerData where UserId= '"+UserIdd+"'");
					

					
 
     	  while(rs.next())                
        	{
     		 	
     		 	
%>

	<br>
	<br>
	<br>

	<div>
		<h2>
			<% out.println("Dear "+rs.getString("ProfilePlacementPriority")+" "+rs.getString("LastName")+" "+rs.getString("FirstName")+":  "); %>
		</h2>
		<input align="left" type="button" class="log_out"
			onclick="document.location.href='index.jsp'" value="Logout" />

	</div>


	<%

			}
  			} catch(Exception e)
			{
				e.printStackTrace();
				out.print(e.toString());
			}
			finally{
			
				try{conn.close();}catch(Exception ee){};
			}
%>
	<br>
	<ul id="myTab" class="nav nav-tabs">
		<li class="active"><a href="#home" data-toggle="tab">Personal information</a></li>
		<li><a href="#acc" data-toggle="tab">Account information</a></li>
		<li><a href="#pf" data-toggle="tab">Profile</a></li>
		<li><a href="#fm" data-toggle="tab">Find Mayalu</a></li>
		<li><a href="#his" data-toggle="tab">Dating history</a></li>
		<li><a href="#fl" data-toggle="tab">Favorite list</a></li>
		<li><a href="#pd" data-toggle="tab">Pending date</a></li>
		<li><a href="#bd" data-toggle="tab">Blind date</a></li>
		<li><a href="#ss" data-toggle="tab">Suggestion table</a></li>
		
		<li class="dropdown">
		<a href="#" id="myTabDrop1" class="dropdown-toggle" 
		   data-toggle="dropdown">Help menu
			<b class="caret"></b>
		</a>
		<ul class="dropdown-menu" role="menu" aria-labelledby="myTabDrop1">
			<li><a href="#0" tabindex="-1" data-toggle="tab">What is Mayalu?</a></li>
			<li><a href="#1" tabindex="-1" data-toggle="tab">How can I pay for booking fee?</a></li>
			<li><a href="#2" tabindex="-1" data-toggle="tab">What is profile?</a></li>
			<li><a href="#3" tabindex="-1" data-toggle="tab">How can I search another profile?</a></li>
			<li><a href="#4" tabindex="-1" data-toggle="tab">How to calculate my profile rating?</a></li>
			<li><a href="#5" tabindex="-1" data-toggle="tab">What is the favorite list?</a></li>
			<li><a href="#6" tabindex="-1" data-toggle="tab">How can I cancel a date?</a></li>
			<li><a href="#7" tabindex="-1" data-toggle="tab">What is a blind date?</a></li>
			<li><a href="#8" tabindex="-1" data-toggle="tab">What is a suggestion table?</a></li>
		</ul>
	</li>

	</ul>

	<div id="myTabContent" class="tab-content">

<!-- *************************************************************************************************** -->
		<div class="tab-pane fade in active" id="home">
			<%
	
				try {
					Class.forName(mysJDBCDriver).newInstance();
					java.util.Properties sysprops = System.getProperties();
					sysprops.put("user", mysUserID);
					sysprops.put("password", mysPassword);

					//connect to the database
					conn = java.sql.DriverManager.getConnection(mysURL, sysprops);
					System.out.println("Connected successfully to database using JConnect");

					java.sql.Statement stmt1 = conn.createStatement();

					java.sql.ResultSet rs = stmt1.executeQuery("select * from CustomerData where UserId= '"+UserIdd+"'");

					while (rs.next()) {
			%>
			<br>
			<table class="mytable" border="3" align="center"
				style="background-color: #FFC0CB;">

				<tr>
					<td>User id</td>
					<td>
						<%
							out.println(rs.getString("UserId"));
						%>
					</td>
				</tr>
				<tr>
					<td>SSN</td>
					<td>
						<%
							out.println(rs.getString("SSN"));
						%>
					</td>
				</tr>
				<tr>
					<td>Name</td>
					<td>
						<%
							out.println(rs.getString("LastName") + " " + rs.getString("FirstName"));
						%>
					</td>
				</tr>
				<tr>
					<td>Telephone</td>
					<td>
						<%
							out.println(rs.getString("Telphone"));
						%>
					</td>
				</tr>
				<tr>
					<td>Email</td>
					<td>
						<%
							out.println(rs.getString("Email"));
						%>
					</td>
				</tr>
				<tr>
					<td>Address</td>
					<td>
						<%
							out.println(rs.getString("Address"));
						%>
					</td>
				</tr>
				<tr>
					<td>City</td>
					<td>
						<%
							out.println(rs.getString("City"));
						%>
					</td>
				</tr>
				<tr>
					<td>State</td>
					<td>
						<%
							out.println(rs.getString("State"));
						%>
					</td>
				</tr>
				<tr>
					<td>ZipCode</td>
					<td>
						<%
							out.println(rs.getString("ZipCode"));
						%>
					</td>
				</tr>
				<tr>
					<td>PPP</td>
					<td>
						<%
							out.println(rs.getString("ProfilePlacementPriority"));
						%>
					</td>
				</tr>
				<tr>
					<td>Rating</td>
					<td>
						<%
							out.println(rs.getString("Rating"));
						%>
					</td>
				</tr>


			</table>
			<%
				}
				} catch (Exception e) {
					e.printStackTrace();
					out.print(e.toString());
				} finally {

					try {
						conn.close();
					} catch (Exception ee) {
					}
					;
				}
			
			/* session.setAttribute("finalid",""); */
			%>
			<div class="buttonContainer">
				<button class="button" style="vertical-align: middle" onclick="document.location.href='user_edit_personal_information.jsp?ID=<%=UserIdd%>'">
					<span>Edit personal information </span>
				</button>
			</div>
		</div>
<!-- *************************************************************************************************** -->
		<div class="tab-pane fade" id="acc">
			<br>
			<table class="mytable" border="3" align="center"
				style="background-color: #FFC0CB;">

				<%
	try {
		Class.forName(mysJDBCDriver).newInstance();
		java.util.Properties sysprops = System.getProperties();
		sysprops.put("user", mysUserID);
		sysprops.put("password", mysPassword);

		//connect to the database
		conn = java.sql.DriverManager.getConnection(mysURL, sysprops);
		System.out.println("Connected successfully to database using JConnect");

		java.sql.Statement stmt1 = conn.createStatement();

		java.sql.ResultSet rs = stmt1.executeQuery("select * from AccountTable where UserId= '"+UserIdd+"'");
%>
				<tr>
					<td align="middle">Credit Card Number</td>
					<td align="middle">Account Number</td>
					<td align="middle">Account Creation</td>
					<td align="middle">Delete</td>
				</tr>


				<% 					
     	  while(rs.next())                
        	{
     		 	
%>
				<tr>
					<td align="middle">
						<% out.println(rs.getString("CreditCardNum")); %>
					</td>

					<td align="middle">
						<% out.println(rs.getString("AccountNum")); %>
					</td>

					<td align="middle">
						<% out.println(rs.getString("AccountCreation")); %>
					</td>
					
					<td align="center"> <a href="user_delete_account.jsp?ID=<%=UserIdd%>&CN=<%=rs.getString("CreditCardNum")%>&AN=<%=rs.getString("AccountNum")%>">Del</a></td>

				</tr>


				<%

			}

%>
				<br>
				<br>
				<br>

				<%

  			} catch(Exception e)
			{
				e.printStackTrace();
				out.print(e.toString());
			}
			finally{
			
				try{conn.close();}catch(Exception ee){};
			}
				/* session.setAttribute("finalid",""); */
%>
			</table>
		
		<div class="buttonContainer">
				<button class="button" style="vertical-align: middle" onclick="document.location.href='user_add_acc.jsp'">
					<span>Add new account</span>
				</button>
		</div>
			
		</div>
<!-- *************************************************************************************************** -->
		<div class="tab-pane fade" id="pf">
			<br>
			<table class="mytable" border="3" align="center"
				style="background-color: #FFC0CB;">

				<%try 
			{
            	Class.forName(mysJDBCDriver).newInstance();
    			java.util.Properties sysprops=System.getProperties();
    			sysprops.put("user",mysUserID);
    			sysprops.put("password",mysPassword);
        
				//connect to the database
            			conn=java.sql.DriverManager.getConnection(mysURL,sysprops);
            			System.out.println("Connected successfully to database using JConnect");
            
            			java.sql.Statement stmt1=conn.createStatement();
        
					java.sql.ResultSet rs = stmt1.executeQuery("select * from ProfileData where UserId= '"+UserIdd+"'");
%>
				<tr>
					<td align="middle">Profile Id</td>
					<td align="middle">Profile Name</td>
					<td align="middle">Age</td>
					<td align="middle">Date Age</td>
					<td align="middle">DatingGeo-Range</td>
					<td align="middle">Gender</td>
					<td align="middle">Hobby</td>
					<td align="middle">Height</td>
					<td align="middle">Weight</td>
					<td align="middle">Hair Color</td>
					<td align="middle">Creation Date</td>
					<td align="middle">Last Actived Date</td>
					<td align="middle">City</td>
					<td align="middle">State</td>
					<td align="middle">Delete</td>
					<td align="middle">Update</td>
				</tr>


				<% 					

					
 
     	  while(rs.next())                
        	{
     		 	
     		 	
%>

				<tr>
					<td align="middle">
						<% out.println(rs.getString("ProfileID")); %>
					</td>

					<td align="middle">
						<% out.println(rs.getString("ProfileName")); %>
					</td>

					<td align="middle">
						<% out.println(rs.getString("Age")); %>
					</td>

					<td align="middle">
						<% out.println(rs.getString("DateAgeRangeStart")+" - "+rs.getString("DateAgeRangeEnd")); %>
					</td>

					<td align="middle">
						<% out.println(rs.getString("DatingGeoRange")); %>
					</td>

					<td align="middle">
						<% out.println(rs.getString("Gender")); %>
					</td>

					<td align="middle">
						<% out.println(rs.getString("Hobby")); %>
					</td>

					<td align="middle">
						<% out.println(rs.getString("Height")); %>
					</td>

					<td align="middle">
						<% out.println(rs.getString("Weight")); %>
					</td>

					<td align="middle">
						<% out.println(rs.getString("HairColor")); %>
					</td>

					<td align="middle">
						<% out.println(rs.getString("CreationDate")); %>
					</td>

					<td align="middle">
						<% out.println(rs.getString("LastModDate")); %>
					</td>

					<td align="middle">
						<% out.println(rs.getString("City")); %>
					</td>

					<td align="middle">
						<% out.println(rs.getString("State")); %>
					</td>
					
					<td align="center"> <a href="user_delete_pf.jsp?PF=<%=rs.getString("ProfileID")%>">Del</a></td>
					<td align="center"> <a href="user_edit_pf.jsp?PF=<%=rs.getString("ProfileID")%>">Edit</a></td>
					
				</tr>


				<%

			}

%>
				<br>
				<br>
				<br>

				<%

  			} catch(Exception e)
			{
				e.printStackTrace();
				out.print(e.toString());
			}
			finally{
			
				try{conn.close();}catch(Exception ee){};
			}
		/* session.setAttribute("finalid",""); */
%>
			</table>
		
		<div class="buttonContainer">
				<button class="button" style="vertical-align: middle" onclick="document.location.href='user_add_pf.jsp'">
					<span>Add new profile</span>
				</button>
		</div>	
		
		</div>
<!-- *************************************************************************************************** -->
		<div class="tab-pane fade" id="fm"> 
<form action="user_search_result.jsp?ID='f6666'" method="post">
            <div align="center" >
                <ul >
                    
                    <li style="list-style-type:none;float: top;"><h2>Find your Mayalu</h2></li>
                   <br>
                    <li>
                    select your profile id:
                    <select name="yID">
<%

			try 
			{
            	Class.forName(mysJDBCDriver).newInstance();
    			java.util.Properties sysprops=System.getProperties();
    			sysprops.put("user",mysUserID);
    			sysprops.put("password",mysPassword);
        
				//connect to the database
            			conn=java.sql.DriverManager.getConnection(mysURL,sysprops);
            			System.out.println("Connected successfully to database using JConnect");
            
            			java.sql.Statement stmt1=conn.createStatement();
            			
            		
            		
					java.sql.ResultSet rs = stmt1.executeQuery("select * from ProfileData where UserId= '"+UserIdd+"'");
					if(!rs.next()){
						%>
						<option value="KongKong">you need a proflie firstly</option>
						<%
						return;
					}
			
					
		  rs = stmt1.executeQuery("select * from ProfileData where UserId= '"+UserIdd+"'");
     	  while(rs.next())                
        	{             
     		  
        	%>
      					 <option value="<%out.print(rs.getString("ProfileID"));%>"><%out.print(rs.getString("ProfileID"));%></option>
       					 
       	 <%

			}
  			} catch(Exception e)
			{
				e.printStackTrace();
				out.print(e.toString());
			}
			finally{
			
				try{conn.close();}catch(Exception ee){};
			}
%>
					</select> 
					</li>
					<br>
					
					<li>
					<select name="SS">
					<option value="ProfileID">profile id</option>
					<option value="Age">age</option>
					<option value="Gender">gender</option>
					<option value="HairColor">hair color</option>
					<option value="City">city</option>
					<option value="State">state</option>
					<option value="Weight">weight</option>
					
					</select>
                    </li>
                   
                    <li style="list-style-type:none;float:top;margin-top: 10px">
                        <input type="text" name="sc" placeholder="Searching condition" style="height: 20px;">
                    </li>
                    

                    
          <div class="buttonContainer">
				<button class="button" style="vertical-align: middle">
					<span>Confirm</span>
				</button>
		  </div>
                    
                    
                  
                      
                </ul>
            </div>
            </form>
            
         <div class="buttonContainer">
				<button class="button" style="vertical-align: middle" onclick="document.location.href='most_active_pf.jsp?ID=<%=UserIdd%>'">
					<span>most active profile</span>
				</button>
				
				<button class="button" style="vertical-align: middle" onclick="document.location.href='most_hr_pf.jsp?ID=<%=UserIdd%>'">
					<span>most highly rated profile</span>
				</button>
				

		</div>	
            
		</div>
<!-- *************************************************************************************************** -->
		<div class="tab-pane fade" id="his">
		<br>
			<table class="mytable" border="3" align="center"
				style="background-color: #FFC0CB;">
			<tr>
			<td align="middle">Profile1 id</td>
			<td align="middle">Profile2 id</td>
			<td align="middle">Time</td>
			<td align="middle">Geo-Location</td>
			<td align="middle">Booking fee</td>
			<td align="middle">Profile1 rated</td>
			<td align="middle">Profile2 rated</td>
			<td align="middle">Comment</td>
			<td align="middle">Commit</td>
			</tr>
			
	<%
	try {
		Class.forName(mysJDBCDriver).newInstance();
		java.util.Properties sysprops = System.getProperties();
		sysprops.put("user", mysUserID);
		sysprops.put("password", mysPassword);

		//connect to the database
		conn = java.sql.DriverManager.getConnection(mysURL, sysprops);
		System.out.println("Connected successfully to database using JConnect");

		java.sql.Statement stmt1 = conn.createStatement();
		java.sql.Statement stmt2 = conn.createStatement();

		java.sql.ResultSet rs = stmt1.executeQuery("select * from ProfileData where UserId= '"+UserIdd+"'");
					
     	  while(rs.next())                
        	{
     		 String s = rs.getString("ProfileID");
     		 java.sql.ResultSet rs1 = stmt2.executeQuery("select Profile1,Profile2,Time,GeoLocation,BookingFee,U1Rated,U2Rated,Comments from DateData D WHERE (D.Profile1 = '"+s+"' OR D.Profile2 = '"+s+"') AND D.Time < CURRENT_TIME");
			while(rs1.next()){
				
				%>
				
				<tr>
				<td align="middle">
						<% out.println(rs1.getString("Profile1")); %>
					</td>
				<td align="middle">
						<% out.println(rs1.getString("Profile2")); %>
					</td>
				<td align="middle">
						<% out.println(rs1.getString("Time")); %>
					</td>
				<td align="middle">
						<% out.println(rs1.getString("GeoLocation")); %>
					</td>
				<td align="middle">
						<% out.println(rs1.getString("BookingFee")); %>
					</td>
				<td align="middle">
						<% out.println(rs1.getString("U1Rated")); %>
					</td>
				<td align="middle">
						<% out.println(rs1.getString("U2Rated")); %>
					</td>
				<td align="middle">
						<% out.println(rs1.getString("Comments")); %>
					</td>
				<td align="center"> <a href="user_commit_date.jsp?PF1=<%=rs1.getString("Profile1")%>&PF2=<%=rs1.getString("Profile2")%>&T=<%=rs1.getString("Time")%>">Commit</a></td>
				</tr>
				
				<% 
			}

			}



  			} catch(Exception e)
			{
				e.printStackTrace();
				out.print(e.toString());
			}
			finally{
			
				try{conn.close();}catch(Exception ee){};
			}
	%>
			</table>
		</div>
<!-- *************************************************************************************************** -->
		<div class="tab-pane fade" id="fl">
		
		<br>
			<table class="mytable" border="3" align="center" style="background-color: #FFC0CB;">
			<tr>
			<td align="middle">Liker</td>
			<td align="middle">Likee</td>
			<td align="middle">Time</td>
			<td align="middle">Rating</td>
			<td align="middle">Profile name</td>
			<td align="middle">Age</td>
			<td align="middle">Gender</td>
			<td align="middle">Hobby</td>
			<td align="middle">Height</td>
			<td align="middle">Weight</td>
			<td align="middle">HairColor</td>
			<td align="middle">City</td>
			<td align="middle">State</td>
			<td align="middle">CreationDate</td>
			<td align="middle">LastModDate</td>
			<td align="middle">Liking</td>
			</tr>
			
	<%
	try {
		Class.forName(mysJDBCDriver).newInstance();
		java.util.Properties sysprops = System.getProperties();
		sysprops.put("user", mysUserID);
		sysprops.put("password", mysPassword);

		//connect to the database
		conn = java.sql.DriverManager.getConnection(mysURL, sysprops);
		System.out.println("Connected successfully to database using JConnect");

		java.sql.Statement stmt1 = conn.createStatement();
		java.sql.Statement stmt2 = conn.createStatement();
		java.sql.Statement stmt3 = conn.createStatement();
		java.sql.Statement stmt4 = conn.createStatement();


		java.sql.ResultSet rs = stmt1.executeQuery("select * from ProfileData where UserId= '"+UserIdd+"'");
					
     	  while(rs.next())                
        	{
     		 String s = rs.getString("ProfileID");
     		 java.sql.ResultSet rs1 = stmt2.executeQuery("select * from LikerData L WHERE L.Likee = '"+s+"'");
			while(rs1.next()){
				String s1 = rs1.getString("Liker");
				%>
     		 
				
				<tr>
				<td align="middle">
						<% out.println(rs1.getString("Liker")); %>
					</td>
				<td align="middle">
						<% out.println(rs1.getString("Likee")); %>
					</td>
				<td align="middle">
						<% out.println(rs1.getString("Date")); %>
					</td>
				<%
				
				java.sql.ResultSet rs2 = stmt3.executeQuery("select * from ProfileData WHERE ProfileID = '"+s1+"'");
				if(rs2.next());
				String s2 = rs2.getString("UserID");
				java.sql.ResultSet rs3 = stmt4.executeQuery("select * from CustomerData WHERE UserID = '"+s2+"'");
				if(rs3.next());
				%>
				<td align="middle">
						<% out.println(rs3.getString("Rating")); %>
					</td> 
			    <td align="middle">
						<% out.println(rs2.getString("ProfileName")); %>
					</td>
				<td align="middle">
						<% out.println(rs2.getString("Age")); %>
					</td>
				<td align="middle">
						<% out.println(rs2.getString("Gender")); %>
					</td>
				<td align="middle">
						<% out.println(rs2.getString("Hobby")); %>
					</td>
				<td align="middle">
						<% out.println(rs2.getString("Height")); %>
					</td>
				<td align="middle">
						<% out.println(rs2.getString("Weight")); %>
					</td>
				<td align="middle">
						<% out.println(rs2.getString("HairColor")); %>
					</td>
				<td align="middle">
						<% out.println(rs2.getString("City")); %>
					</td>
				<td align="middle">
						<% out.println(rs2.getString("State")); %>
					</td>
				<td align="middle">
						<% out.println(rs2.getString("CreationDate")); %>
					</td>
				<td align="middle">
						<% out.println(rs2.getString("LastModDate")); %>
					</td>
				<td align="center"> <a href="user_like.jsp?PF1=<%=rs1.getString("Liker")%>&PF2=<%=rs1.getString("Likee")%>">Like</a></td>


				</tr>
				
				<% 
			}

        	}



  			} catch(Exception e)
			{
				e.printStackTrace();
				out.print(e.toString());
			}
			finally{
			
				try{conn.close();}catch(Exception ee){};
			}
	%>
			</table>
		
		</div>
<!-- *************************************************************************************************** -->
		<div class="tab-pane fade" id="pd">
		<br>
			<table class="mytable" border="3" align="center"
				style="background-color: #FFC0CB;">
			<tr>
			<td align="middle">Profile1 id</td>
			<td align="middle">Profile2 id</td>
			<td align="middle">Time</td>
			<td align="middle">Geo-Location</td>
			<td align="middle">Booking fee</td>
			<td align="middle">Cancel</td>
			<td align="middle">Geo-date</td>

			</tr>
			
	<%
	try {
		Class.forName(mysJDBCDriver).newInstance();
		java.util.Properties sysprops = System.getProperties();
		sysprops.put("user", mysUserID);
		sysprops.put("password", mysPassword);

		//connect to the database
		conn = java.sql.DriverManager.getConnection(mysURL, sysprops);
		System.out.println("Connected successfully to database using JConnect");

		java.sql.Statement stmt1 = conn.createStatement();
		java.sql.Statement stmt2 = conn.createStatement();

		java.sql.ResultSet rs = stmt1.executeQuery("select * from ProfileData where UserId= '"+UserIdd+"'");
					
     	  while(rs.next())                
        	{
     		 String s = rs.getString("ProfileID");
     		 java.sql.ResultSet rs1 = stmt2.executeQuery("select Profile1,Profile2,Time,GeoLocation,BookingFee,U1Rated,U2Rated,Comments from DateData D WHERE (D.Profile1 = '"+s+"' OR D.Profile2 = '"+s+"') AND D.Time >= CURRENT_TIME");
			while(rs1.next()){
				
				%>
				
				<tr>
				<td align="middle">
						<% out.println(rs1.getString("Profile1")); %>
					</td>
				<td align="middle">
						<% out.println(rs1.getString("Profile2")); %>
					</td>
				<td align="middle">
						<% out.println(rs1.getString("Time")); %>
					</td>
				<td align="middle">
						<% out.println(rs1.getString("GeoLocation")); %>
					</td>
				<td align="middle">
						<% out.println(rs1.getString("BookingFee")); %>
					</td>
				<td align="center"> <a href="user_cancel_date_result.jsp?PF1=<%=rs1.getString("Profile1")%>&PF2=<%=rs1.getString("Profile2")%>&T=<%=rs1.getString("Time")%>">Cancel</a></td>
				<td align="center"> <a href="user_make_geo_date.jsp?PF1=<%=rs1.getString("Profile1")%>&PF2=<%=rs1.getString("Profile2")%>&T=<%=rs1.getString("Time")%>">Geo-date</a></td>
				
				</tr>
				
				<% 
			}

			}



  			} catch(Exception e)
			{
				e.printStackTrace();
				out.print(e.toString());
			}
			finally{
			
				try{conn.close();}catch(Exception ee){};
			}
	%>
			</table>
		<div class="buttonContainer">
				<button class="button" style="vertical-align: middle" onclick="document.location.href='p_geo_result.jsp'">
					<span>Show the popular geo-date location</span>
				</button>
		</div>	
			
		</div>
<!-- *************************************************************************************************** -->
		<div class="tab-pane fade" id="bd">
		<br>
			<table class="mytable" border="3" align="center" style="background-color: #FFC0CB;">
			<tr>
			<td align="middle">Referrer</td>
			<td align="middle">Time</td>
			<td align="middle">Recommended</td>
			<td align="middle">Rating</td>
			<td align="middle">Profile name</td>
			<td align="middle">Age</td>
			<td align="middle">Gender</td>
			<td align="middle">Hobby</td>
			<td align="middle">Height</td>
			<td align="middle">Weight</td>
			<td align="middle">HairColor</td>
			<td align="middle">City</td>
			<td align="middle">State</td>
			<td align="middle">Accept</td>
			<td align="middle">Cancel</td>

			
			</tr>
			
	<%
	try {
		Class.forName(mysJDBCDriver).newInstance();
		java.util.Properties sysprops = System.getProperties();
		sysprops.put("user", mysUserID);
		sysprops.put("password", mysPassword);

		//connect to the database
		conn = java.sql.DriverManager.getConnection(mysURL, sysprops);
		System.out.println("Connected successfully to database using JConnect");

		java.sql.Statement stmt1 = conn.createStatement();
		java.sql.Statement stmt2 = conn.createStatement();
		java.sql.Statement stmt3 = conn.createStatement();
		java.sql.Statement stmt4 = conn.createStatement();


		java.sql.ResultSet rs = stmt1.executeQuery("select * from ProfileData where UserId= '"+UserIdd+"'");
					
     	  while(rs.next())                
        	{
     		 String s = rs.getString("ProfileID");
     		 java.sql.ResultSet rs1 = stmt2.executeQuery("select * from ReferralData R WHERE R.UserC = '"+s+"'");
			while(rs1.next()){
				String s1 = rs1.getString("UserB");
				%>
     		 
				
				<tr>
				<td align="middle">
						<% out.println(rs1.getString("UserA")); %>
					</td>
				<td align="middle">
						<% out.println(rs1.getString("Time")); %>
					</td>
				<td align="middle">
						<% out.println(rs1.getString("UserB")); %>
					</td>
				<%
				
				java.sql.ResultSet rs2 = stmt3.executeQuery("select * from ProfileData WHERE ProfileID = '"+s1+"'");
				if(rs2.next());
				String s2 = rs2.getString("UserID");
				java.sql.ResultSet rs3 = stmt4.executeQuery("select * from CustomerData WHERE UserID = '"+s2+"'");
				if(rs3.next());
				%>
				<td align="middle">
						<% out.println(rs3.getString("Rating")); %>
					</td> 
			    <td align="middle">
						<% out.println(rs2.getString("ProfileName")); %>
					</td>
				<td align="middle">
						<% out.println(rs2.getString("Age")); %>
					</td>
				<td align="middle">
						<% out.println(rs2.getString("Gender")); %>
					</td>
				<td align="middle">
						<% out.println(rs2.getString("Hobby")); %>
					</td>
				<td align="middle">
						<% out.println(rs2.getString("Height")); %>
					</td>
				<td align="middle">
						<% out.println(rs2.getString("Weight")); %>
					</td>
				<td align="middle">
						<% out.println(rs2.getString("HairColor")); %>
					</td>
				<td align="middle">
						<% out.println(rs2.getString("City")); %>
					</td>
				<td align="middle">
						<% out.println(rs2.getString("State")); %>
					</td>
				<td align="center"> <a href="user_accept_bdate_result.jsp?U1=<%=rs1.getString("UserA")%>&U2=<%=rs1.getString("UserB")%>&U3=<%=rs1.getString("UserC")%>&T=<%=rs1.getString("Time")%>">Accept</a></td>
				<td align="center"> <a href="user_cancel_bdate_result.jsp?U1=<%=rs1.getString("UserA")%>&U2=<%=rs1.getString("UserB")%>&U3=<%=rs1.getString("UserC")%>&T=<%=rs1.getString("Time")%>">Cancel</a></td>
	


				</tr>
				
				<% 
			}

        	}



  			} catch(Exception e)
			{
				e.printStackTrace();
				out.print(e.toString());
			}
			finally{
			
				try{conn.close();}catch(Exception ee){};
			}
	%>
			</table>
		</div>
<!-- *************************************************************************************************** -->		
		<div class="tab-pane fade" id="ss">
		<br>
			<table class="mytable" border="3" align="center" style="background-color: #FFC0CB;">
			<tr>
			<td align="middle">Customer Representative</td>
			<td align="middle">Time</td>
			<td align="middle">Recommended</td>
			<td align="middle">Rating</td>
			<td align="middle">Profile name</td>
			<td align="middle">Age</td>
			<td align="middle">Gender</td>
			<td align="middle">Hobby</td>
			<td align="middle">Height</td>
			<td align="middle">Weight</td>
			<td align="middle">HairColor</td>
			<td align="middle">City</td>
			<td align="middle">State</td>
			<td align="middle">Accept</td>
			<td align="middle">Cancel</td>

			</tr>
			
	<%
	
	try {
		Class.forName(mysJDBCDriver).newInstance();
		java.util.Properties sysprops = System.getProperties();
		sysprops.put("user", mysUserID);
		sysprops.put("password", mysPassword);

		//connect to the database
		conn = java.sql.DriverManager.getConnection(mysURL, sysprops);
		System.out.println("Connected successfully to database using JConnect");

		java.sql.Statement stmt1 = conn.createStatement();
		java.sql.Statement stmt2 = conn.createStatement();
		java.sql.Statement stmt3 = conn.createStatement();
		java.sql.Statement stmt4 = conn.createStatement();
	

		java.sql.ResultSet rs = stmt1.executeQuery("select * from ProfileData where UserId= '"+UserIdd+"'");
					
     	  while(rs.next())                
        	{
     		 String s = rs.getString("ProfileID");
     		 java.sql.ResultSet rs1 = stmt2.executeQuery("select * from SuggestedBy S WHERE S.Profile2 = '"+s+"'");
			while(rs1.next()){
				String s1 = rs1.getString("Profile1");
				%>
     		 
				
				<tr>
				<td align="middle">
						<% out.println(rs1.getString("CustRep")); %>
					</td>
				<td align="middle">
						<% out.println(rs1.getString("DateTime")); %>
					</td>
				<td align="middle">
						<% out.println(rs1.getString("Profile1")); %>
					</td>
				<%
				
				java.sql.ResultSet rs2 = stmt3.executeQuery("select * from ProfileData WHERE ProfileID = '"+s1+"'");
				if(rs2.next());
				String s2 = rs2.getString("UserID");
				java.sql.ResultSet rs3 = stmt4.executeQuery("select * from CustomerData WHERE UserID = '"+s2+"'");
				if(rs3.next());
				%>
				<td align="middle">
						<% out.println(rs3.getString("Rating")); %>
					</td> 
			    <td align="middle">
						<% out.println(rs2.getString("ProfileName")); %>
					</td>
				<td align="middle">
						<% out.println(rs2.getString("Age")); %>
					</td>
				<td align="middle">
						<% out.println(rs2.getString("Gender")); %>
					</td>
				<td align="middle">
						<% out.println(rs2.getString("Hobby")); %>
					</td>
				<td align="middle">
						<% out.println(rs2.getString("Height")); %>
					</td>
				<td align="middle">
						<% out.println(rs2.getString("Weight")); %>
					</td>
				<td align="middle">
						<% out.println(rs2.getString("HairColor")); %>
					</td>
				<td align="middle">
						<% out.println(rs2.getString("City")); %>
					</td>
				<td align="middle">
						<% out.println(rs2.getString("State")); %>
					</td>
				
				<td align="center"> <a href="user_accept_sdate_result.jsp?CR=<%=rs1.getString("CustRep")%>&P1=<%=rs1.getString("Profile1")%>&P2=<%=rs1.getString("Profile2")%>&T=<%=rs1.getString("DateTime")%>">Accept</a></td>
				<td align="center"> <a href="user_cancel_sdate_result.jsp?CR=<%=rs1.getString("CustRep")%>&P1=<%=rs1.getString("Profile1")%>&P2=<%=rs1.getString("Profile2")%>&T=<%=rs1.getString("DateTime")%>">Cancel</a></td>
	



				</tr>
				
				<% 
			}

        	}



  			} catch(Exception e)
			{
				e.printStackTrace();
				out.print(e.toString());
			}
			finally{
			
				try{conn.close();}catch(Exception ee){};
			}
	%>
			</table>
			<br>
		</div>
<!-- *************************************************************************************************** -->		
		<div class="tab-pane fade" id="0" align="center">
		<h4>Dear customer, Mayalu means "lover" in Nepal. We want everyone can find his/her own Mayalu in our website.</h4>
		<h4>If you have any more question, please feel free to email us. Enjoy the trip of finding your own Mayalu.</h4>
		</div>
		
		<div class="tab-pane fade" id="1" align="center">
		<h4>Dear customer, in the second tab, you can create your own account information.</h4> 
		<h4>The customer representative will use the most recent modified account to charge booking fee.</h4>
		<h4>If you have any more question, please feel free to email us. Enjoy the trip of finding your own Mayalu.</h4>
		</div>
		
	<div class="tab-pane fade" id="2" align="center">
		<h4>Dear customer, profile is the personal information which you want to show with another customer.</h4> 
		<h4>Please fill out the data as many as you can, it will increase the possibility which another customer search your profile. </h4>
		<h4>Of course, you can create more than one profile, and you also can edit the old one or delete it. More function please check the "profile" tab.</h4>
		<h4>If you have any more question, please feel free to email us. Enjoy the trip of finding your own Mayalu.</h4>
	</div>
	<div class="tab-pane fade" id="3" align="center">
		<h4>Dear customer, in the "Find Mayalu" tab, you can set the searching condition.</h4> 
		<h4>When you get the result page, you can click the like or refer.</h4>
		<h4>If you have any more question, please feel free to email us. Enjoy the trip of finding your own Mayalu.</h4>
		</div>
	<div class="tab-pane fade" id="4" align="center">
		<h4>Dear customer, calculating your rating is based on the comment of your history date record.</h4> 
		<h4>It is auto action, our customer representative will do this for you.</h4>
		<h4>Also you can commit your history date, it can help us give the correct rating for you.</h4>
		<h4>If you have any more question, please feel free to email us. Enjoy the trip of finding your own Mayalu.</h4>
		</div>
	<div class="tab-pane fade" id="5" align="center">
		<h4>Dear customer, favorite list is base on the liking data.</h4> 
		<h4>It will tell you which customer is interested on you. If you are also interested on him/her, you can click the "Like"</h4>
		<h4>It will create a pending date for you.</h4>
		<h4>If you have any more question, please feel free to email us. Enjoy the trip of finding your own Mayalu.</h4>
		</div>
	<div class="tab-pane fade" id="6" align="center">
		<h4>Dear customer, you can't cancel the dating history, but for pending date, you can cancel it if you want.</h4> 
		<h4>If you have any more question, please feel free to email us. Enjoy the trip of finding your own Mayalu.</h4>
		</div>
	<div class="tab-pane fade" id="7" align="center">
		<h4>Dear customer, when your friend find a good profile and want to share with you, they can refer it to you.</h4>
		<h4>Then, you will receive a blind date invitation. You can also cancel or accept this invitation.</h4>
		<h4>So when you find a good profile, don't forget share with your friend :)</h4> 
		<h4>If you have any more question, please feel free to email us. Enjoy the trip of finding your own Mayalu.</h4>
		</div>
	<div class="tab-pane fade" id="8" align="center">
		<h4>Dear customer, our customer representative will suggest the suitable profile for you.</h4>
		<h4>If you like, just click the like. It will create a pending date for you.</h4>
		<h4>If you have any more question, please feel free to email us. Enjoy the trip of finding your own Mayalu.</h4>
		</div>
		
	</div>
	
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>


</body>
<jsp:include flush="true" page="footer.jsp" ></jsp:include>
</html>
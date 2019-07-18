<%-- 
    Document   : manager_level
    Created on : 2018-4-27, 19:13:14
    Author     : Pakigya Tuladhar
--%>

<%@page import="java.text.DecimalFormat"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Calendar"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="css/indexStyle.css">
        <link rel="stylesheet" href="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/css/bootstrap.min.css">
	<script src="http://cdn.static.runoob.com/libs/jquery/2.1.1/jquery.min.js"></script>
	<script src="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/js/bootstrap.min.js"></script>
        <title>Manager Level</title>
    </head>
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
    
    <body>

    	<%
        String mysJDBCDriver = "com.mysql.jdbc.Driver";
        String mysURL ="jdbc:mysql://127.0.0.1:3306/Mayalu";
String mysUserID = "root"; 
String mysPassword = "8812992";
        java.sql.Connection conn=null;
        String userDefault="User-User";
        int threeDefault=3;
        String currDate=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(Calendar.getInstance().getTime());
        java.util.Properties sysprops, sysprops2;
        String query = "";
        
        String manager_ssn = session.getAttribute("finalid").toString();
        session.setAttribute("finalid",manager_ssn);
 
			try 
			{
            	Class.forName(mysJDBCDriver).newInstance();
    			java.util.Properties sysprops3=System.getProperties();
    			sysprops3.put("user",mysUserID);
    			sysprops3.put("password",mysPassword);
        
				//connect to the database
            			conn=java.sql.DriverManager.getConnection(mysURL,sysprops3);
            			System.out.println("Connected successfully to database using JConnect");
            
            			java.sql.Statement stmt4=conn.createStatement();
            			
					java.sql.ResultSet rs4 = stmt4.executeQuery("select * from employeedata where ssn= '"+manager_ssn+"'");
					
     	  while(rs4.next())                
        	{ 	
%>
	<div>
		<h2>
			<% out.println("Dear Manager "+rs4.getString("FirstName")+" "+rs4.getString("LastName")+":  "); %>
		</h2><input align="left" type="button" class="log_out"
			onclick="document.location.href='index.jsp'" value="Logout" />
	</div>
		<%  }}
          catch(Exception e)
          {
              e.printStackTrace();
          }
          finally
          {
              try {
                      conn.close();
                  } 
              catch (Exception ee) 
              {
                  ee.printStackTrace();
              }
          } %>
		
			
    
        <ul id="myTab" class="nav nav-tabs">
            <li ><a href="#employeeInformation" data-toggle="tab" onclick="document.location.href='manager_level.jsp'" >Employee Information</a></li>
	
	 <li><a href="#monthsales" data-toggle="tab" onclick="document.location.href='manager_level_2.jsp'">
    	 Monthly Sales
  		</a></li>
        <li><a href="#userList" data-toggle="tab">Users List</a></li>
    
        <li class="dropdown">
		<a href="#" id="myTabDrop1" class="dropdown-toggle" data-toggle="dropdown">Date Report 
			<b class="caret"></b>
		</a>
		<ul class="dropdown-menu" role="menu" aria-labelledby="myTabDrop1">
			<li><a href="#byCal" tabindex="-1" data-toggle="tab" onclick="document.location.href='manager_level_3.jsp'" >by calendar</a></li>
			<li><a href="#byCus" tabindex="-1" data-toggle="tab" onclick="document.location.href='manager_level_4.jsp'" >by customer name</a></li>
		</ul>
	</li>
        <li class="dropdown">
		<a href="#" id="myTabDrop1" class="dropdown-toggle" data-toggle="dropdown">Revenue List 
			<b class="caret"></b>
		</a>
		<ul class="dropdown-menu" role="menu" aria-labelledby="myTabDrop1">
			<li><a href="#onParDate" tabindex="-1" data-toggle="tab" onclick="document.location.href='manager_level_5.jsp'" >On Particular Date</a></li>
			<li><a href="#aParCus" tabindex="-1" data-toggle="tab" onclick="document.location.href='manager_level_6.jsp'" >A Particular Customer</a></li>
		</ul>
	</li>
        <li class="dropdown">
		<a href="#" id="myTabDrop1" class="dropdown-toggle" data-toggle="dropdown">Most Revenue 
			<b class="caret"></b>
		</a>
		<ul class="dropdown-menu" role="menu" aria-labelledby="myTabDrop1">
			<li><a href="#cusRep" tabindex="-1" data-toggle="tab">Customer Representative</a></li>
			<li><a href="#cus" tabindex="-1" data-toggle="tab">Customer</a></li>
		</ul>
	</li>
        <li><a href="#mActCus" data-toggle="tab">Most Active Customers</a></li>
        <li><a href="#datingRec" data-toggle="tab" onclick="document.location.href='manager_level_7.jsp'" >Dating Record</a></li>
        <li><a href="#highRaCus" data-toggle="tab">Highest-rated Customers</a></li>
        <li><a href="#highRaCal" data-toggle="tab">Highest-rated dates</a></li>
        
</ul>
<div id="myTabContent" class="tab-content">

	<div class="tab-pane fade " id="employeeInformation">
		<h1>All Employees Information</h1>
                
                <%
                    
                    try 
                    {
                        Class.forName(mysJDBCDriver).newInstance();
    				sysprops=System.getProperties();
    			sysprops.put("user",mysUserID);
    			sysprops.put("password",mysPassword);
        
				//connect to the database
                        conn=java.sql.DriverManager.getConnection(mysURL,sysprops);
            
            		java.sql.Statement stmt1=conn.createStatement();
                %>
                <table border="1" align="center">
                    <tr align="center">
                        <td>FirstName</td>
                        <td>LastName</td>
                        <td>SSN</td>
                        <td>StartDate</td>
                        <td>Role</td>
                        <td>HourlyRate</td>
                        <td>Address</td>
                        <td>City</td>
                        <td>State</td>
                        <td>ZipCode</td>
                        <td>Telephone</td>
                        <td>Email</td>
                        <td>Edit</td>
                        <td>Delete</td> 
                    </tr>
                
                <%
                    java.sql.ResultSet rs1=stmt1.executeQuery("select * From EmployeeData");
                        while(rs1.next())
                        {
                            %>
                            <tr align="center">
                                <td>
                                    <%
                                        out.println(rs1.getString("FirstName"));
                                    %>
                                </td>
                                <td>
                                    <%
                                        out.println(rs1.getString("LastName"));
                                    %>
                                </td>
                                <td>
                                    <%
                                        out.println(rs1.getString("SSN"));
                                    %>
                                </td>
                                <td>
                                    <%
                                        out.println(rs1.getString("StartDate"));
                                    %>
                                </td>
                                <td>
                                    <%
                                        out.println(rs1.getString("Role"));
                                    %>
                                </td>
                                <td>
                                    <%
                                        out.println(rs1.getString("HourlyRate"));
                                    %>
                                </td>
                                <td>
                                    <%
                                        out.println(rs1.getString("Address"));
                                    %>
                                </td>
                                <td>
                                    <%
                                        out.println(rs1.getString("City"));
                                    %>
                                </td>
                                <td>
                                    <%
                                        out.println(rs1.getString("State"));
                                    %>
                                </td>
                                <td>
                                    <%
                                        out.println(rs1.getString("ZipCode"));
                                    %>
                                </td>
                                <td>
                                    <%
                                        out.println(rs1.getString("Telphone"));
                                    %>
                                </td>
                                <td>
                                    <%
                                        out.println(rs1.getString("Email"));
                                    %>
                                </td>
                                <td>
                                    <a href="Employee_delete_edit.jsp?SSN=<%=rs1.getString("SSN")%>&Option=<%="edit"%>">Edit</a>
                                </td>
                                <td>
                                    <a href="Employee_delete_edit.jsp?SSN=<%=rs1.getString("SSN")%>&Option=<%="delete"%>">Delete</a>
                                </td>
                            </tr>
                
                            <%
                        }
                        %>
                </table>
                <form name="manage_add" action="manager_add_result.jsp" method="post">
                <li style="list-style-type:none; margin-top: 10px">
                            <button  style="height: 25px;" class="button1" >Add</button>
                </li>
                </form>
                        <%
                    }
                    catch(Exception e)
                    {
                        e.printStackTrace();
                    }
                    finally
                    {
                        try {
                                conn.close();
                            } 
                        catch (Exception ee) 
                        {
                            ee.printStackTrace();
                        }
                    }
                    %>

	</div>
        
        <div class="tab-pane fade" id="monthsales">

            <form method="post" action=""> 
				<table>
				<tr><td>Year:</td><td><input type="text" name="search_year" > </td></tr>
				<tr><td>Month:</td><td><input type="text" name="search_month"></td></tr>
				<tr><td></td><td><input type="submit" name= "btnSubmit6" name= "btnSubmit6" value="Submit"></td></tr>
				</table>
				</form>
<%
                 
                   
                    
if(request.getParameter("btnSubmit6")!=null) //btnSubmit is the name of your button, not id of that button.
{
    String year =request.getParameter("search_year").trim();
    String month = request.getParameter("search_month").trim();
    String message = "Hello world";
    int flag = 0;
    int error = 0;
    if (year.isEmpty())
    {
    	year = "2018"; flag+=1;
    }
    else
    {
        //if (!ev.validate_phone(new_tn)){ error+=1; }// CHECKING USING REGEX
    }
    if (month.isEmpty())
    {
    	month = "05"; flag+=1;
    }
    else
    {
        //if (!ev.validate_email(new_email)){ error+=1; }// CHECKING USING REGEX
    }
    
    if (flag ==2)
    {
    	message = "You did not input anything.";
		%>
			<script type="text/javascript">
			    var msg = "<%=message%>";
			    if(alert(msg))
			    {
			    	//try{conn.close();}catch(Exception ee){};
			    	//response.sendRedirect("/305/update_data.jsp");
			    };
			</script>			
		<%	
    }
    else if(error>0)
    {
    	message = "Please check for spelling errors.";
		%>
			<script type="text/javascript">
			    var msg = "<%=message%>";
			    if(alert(msg))
			    {
			    	//try{conn.close();}catch(Exception ee){};
			    	//response.sendRedirect("/305/update_data.jsp");
			    };
			</script>			
		<%	
    }
    else
    {
    	%>
    		<h1>Month information</h1>
                    
                    <%
                    

            		Class.forName(mysJDBCDriver).newInstance();
            		sysprops2 =System.getProperties();
            		sysprops2.put("user",mysUserID);
            		sysprops2.put("password",mysPassword);
            	    //connect to the database
            	    conn=java.sql.DriverManager.getConnection(mysURL,sysprops2);
            	    
            		System.out.println(year + "  "+ month +" what this?\n ");

    				//connect to the database
            
                        try 
                        {
                            Class.forName(mysJDBCDriver).newInstance();
        			sysprops=System.getProperties();
        			sysprops.put("user",mysUserID);
        			sysprops.put("password",mysPassword);
            
                    %>
                    <table border="1" align="center">
                        <tr align="center">
                            <td>Year</td>
                            <td>Month</td>
                            <td>Total Revenue</td>
                        </tr>
                    
                    <%
                    

                	int n_month = Integer.parseInt(month) + 1;
                	int n_year = Integer.parseInt(year);
                	if (n_month==13)
                	{
                		n_month = 1;
                		n_year +=1;
                	}

                	String n_month_str = Integer.toString(n_month);
                	String n_year_str = Integer.toString(n_year);
                	//year = Integer.toString(n_year);
                	query = "SELECT SUM(BookingFee) as bookingfee FROM DateData WHERE Time>='" + year + "-" + month + "-01' AND Time<'"+ n_year +"-"+ n_month + "-01'";
                	java.sql.Statement stmt1=conn.createStatement();
                	java.sql.ResultSet rs1 = stmt1.executeQuery(query);
                	
                            while(rs1.next())
                            {
                                %>
                                <tr align="center">
                                 <td>
                                        <%
                                            out.println(year);

                                        %>
                                    </td>
                                    <td>
                                        <%
                                            out.println(month);
                                        %>
                                    </td>
                                    <td>
                                        <%
                                            out.println(rs1.getString("bookingfee"));
                                        %>
                                    </td>
                                </tr>
                    
                                <%
                            }
                            %>
                    </table>
                    
                            <%
                        }
                        catch(Exception e)
                        {
                            e.printStackTrace();
                        }
                        finally
                        {
                            try {
                                    conn.close();
                                } 
                            catch (Exception ee) 
                            {
                                ee.printStackTrace();
                            }
                        }
                        %>

    	

<%
    }
}
%>
</div>            
      
  <div class="tab-pane fade" id="userList">
    		<h1>All Customer Information </h1>
                    
                    <%
                   
            		Class.forName(mysJDBCDriver).newInstance();
            		sysprops2 =System.getProperties();
            		sysprops2.put("user",mysUserID);
            		sysprops2.put("password",mysPassword);
            	    //connect to the database
            	    conn=java.sql.DriverManager.getConnection(mysURL,sysprops2);
            	    

    				//connect to the database
            
                        try 
                        {
                            Class.forName(mysJDBCDriver).newInstance();
		        			sysprops=System.getProperties();
		        			sysprops.put("user",mysUserID);
		        			sysprops.put("password",mysPassword);
            
                    %>
                    <table border="1" align="center">
                        <tr align="center">
                            <td>User id</td>
							<td>SSN</td>
							<td>Name</td>
							<td>Telephone</td>
							<td>Email</td>
							<td>Address</td>
							<td>City</td>
							<td>State</td>
							<td>ZipCode</td>
							<td>PPP</td>
							<td>Rating</td>
                        </tr>
                    
                    <%

                	//String query = "SELECT * FROM DateData where userid = '"+ userid +"'";
                    query = "select * from customerdata";
                    
                    java.sql.Statement stmt1=conn.createStatement();
                	java.sql.ResultSet rs = stmt1.executeQuery(query);
                	
                            while(rs.next())
                            {
                                %>
                                <tr align="center">
                               		<td>
										<%
											out.println(rs.getString("UserId"));
										%>
									</td>
									<td>
										<%
											out.println(rs.getString("SSN"));
										%>
									</td>
									<td>
										<%
											out.println(rs.getString("LastName") + " " + rs.getString("FirstName"));
										%>
									</td>
									<td>
										<%
											out.println(rs.getString("Telphone"));
										%>
									</td>
									<td>
										<%
											out.println(rs.getString("Email"));
										%>
									</td>
									<td>
										<%
											out.println(rs.getString("Address"));
										%>
									</td>
									<td>
										<%
											out.println(rs.getString("City"));
										%>
									</td>
									<td>
										<%
											out.println(rs.getString("State"));
										%>
									</td>
									<td>
										<%
											out.println(rs.getString("ZipCode"));
										%>
									</td>
									<td>
										<%
											out.println(rs.getString("ProfilePlacementPriority"));
										%>
									</td>
									<td>
										<%
											out.println(rs.getString("Rating"));
										%>
									</td>
                                </tr>
                    
                                <%
                            }
                            %>
                            <%
                        }
                        catch(Exception e)
                        {
                            e.printStackTrace();
                        }
                        finally
                        {
                            try {
                                    conn.close();
                                } 
                            catch (Exception ee) 
                            {
                                ee.printStackTrace();
                            }
                        }
                        %>

                    </table>
    	</div>

<div class="tab-pane fade" id="byCal">

				<form method="post"> <!--action="http://localhost:8080/305/save_edit.jsp">  -->
				<table>
				<tr><td>Year:</td><td><input type="text" name="search_year" >	</td></tr>
				<tr><td>Month:</td><td><input type="text" name="search_month"></td></tr>
				<tr><td>Day:</td><td><input type="text" name="search_day"></td></tr>
				<tr><td></td><td><input type="submit" name= "btnSubmit1" name= "btnSubmit1" value="Submit"></td></tr>
				</table>
				</form>
<%     
if(request.getParameter("btnSubmit1")!=null) //btnSubmit is the name of your button, not id of that button.
{
    String year =request.getParameter("search_year").trim();
    String month = request.getParameter("search_month").trim();
    String day = request.getParameter("search_day").trim();
    String message = "Hello world";
    int flag = 0;
    int error = 0;
    if (year.isEmpty())
    {
    	year = "2018"; flag+=1;
    }
    else
    {
        //if (!ev.validate_phone(new_tn)){ error+=1; }// CHECKING USING REGEX
    }
    if (month.isEmpty())
    {
    	month = "05"; flag+=1;
    }
    else
    {
        //if (!ev.validate_email(new_email)){ error+=1; }// CHECKING USING REGEX
    }
    if (day.isEmpty())
    {
    	month = "03"; flag+=1;
    }
    
    if (flag ==3)
    {
    	message = "You did not input anything.";
		%>
			<script type="text/javascript">
			    var msg = "<%=message%>";
			    if(alert(msg))
			    {
			    	//try{conn.close();}catch(Exception ee){};
			    	//response.sendRedirect("/305/update_data.jsp");
			    };
			</script>			
		<%	
    }
    else if(error>0)
    {
    	message = "Please check for spelling errors.";
		%>
			<script type="text/javascript">
			    var msg = "<%=message%>";
			    if(alert(msg))
			    {
			    	//try{conn.close();}catch(Exception ee){};
			    	//response.sendRedirect("/305/update_data.jsp");
			    };
			</script>			
		<%	
    }
    else
    {
    	%>
    		<h1>Date information: <% out.println(year+ "-" + month +"-"+ day); %> </h1>
                    
                    <%
                   
            		Class.forName(mysJDBCDriver).newInstance();
            		sysprops2 =System.getProperties();
            		sysprops2.put("user",mysUserID);
            		sysprops2.put("password",mysPassword);
            	    //connect to the database
            	    conn=java.sql.DriverManager.getConnection(mysURL,sysprops2);
            	    
            		System.out.println(year + "  "+ month +" what this?\n ");

    				//connect to the database
            
                        try 
                        {
                            Class.forName(mysJDBCDriver).newInstance();
        			sysprops=System.getProperties();
        			sysprops.put("user",mysUserID);
        			sysprops.put("password",mysPassword);
            
                    %>
                    <table border="1" align="center">
                        <tr align="center">
                            <td>Profile1</td>
                            <td>Profile2</td>
                            <td>Customer Representative</td>
                            <td>Time</td>
                            <td>Geo Location</td>
                            <td>Booking Fee</td>
                            <td>U1 Rated</td>
                            <td>U2 Rated</td>
                            <td>Comments</td>
                            <td>Geo Date</td>
                        </tr>
                    
                    <%
                    String date = year+ "-" + month +"-"+ day;
                    String next_day = Integer.toString(Integer.parseInt(day) + 1);
                	String next_date = year+ "-" + month +"-"+ next_day;

                	query = "SELECT * FROM DateData WHERE Time >= '"+date + "' AND TIME < '"+next_date +"' AND BookingFee <> 0";
                	java.sql.Statement stmt1=conn.createStatement();
                	java.sql.ResultSet rs1 = stmt1.executeQuery(query);

                            while(rs1.next())
                            {
                                %>
                                <tr align="center">
                                 <td>
                                        <%
                                            out.println(rs1.getString("profile1"));

                                        %>
                                    </td>
                                 <td>
                                        <%
                                            out.println(rs1.getString("profile2"));

                                        %>
                                    </td>
                                   <td>
                                        <%
                                            out.println(rs1.getString("custrep"));

                                        %>
                                    </td>
                                   <td>
                                        <%
                                            out.println(rs1.getString("time"));

                                        %>
                                    </td>
                                   <td>
                                        <%
                                            out.println(rs1.getString("geolocation"));

                                        %>
                                    </td>
                                   <td>
                                        <%
                                            out.println(rs1.getString("bookingfee"));

                                        %>
                                    </td>
                                   <td>
                                        <%
                                            out.println(rs1.getString("U1Rated"));

                                        %>
                                    </td>
                                   <td>
                                        <%
                                            out.println(rs1.getString("U2Rated"));

                                        %>
                                    </td>
                                   <td>
                                        <%
                                            out.println(rs1.getString("Comments"));

                                        %>
                                    </td>
                                   <td>
                                        <%
                                            out.println(rs1.getString("IsGeoDate"));

                                        %>
                                    </td>
                                </tr>
                    
                                <%
                            }
                            %>
                    </table>
                            <%
                        }
                        catch(Exception e)
                        {
                            e.printStackTrace();
                        }
                        finally
                        {
                            try {
                                    conn.close();
                                } 
                            catch (Exception ee) 
                            {
                                ee.printStackTrace();
                            }
                        }
                        %>

    	

<%
    }
}
%>
</div>

 	<div class="tab-pane fade" id="byCus">
				<form method="post"> 
				<table>
				<tr><td>User ID:</td><td>
					<select name="search_user" id = "search_user">
						<%
            	    

    				//connect to the database
            
                        try 
                        {
    						Class.forName(mysJDBCDriver).newInstance();
    	            		sysprops =System.getProperties();
    	            		sysprops.put("user",mysUserID);
    	            		sysprops.put("password",mysPassword);
                            Class.forName(mysJDBCDriver).newInstance();
                            
            	    //connect to the database
            	    conn =java.sql.DriverManager.getConnection(mysURL,sysprops);
            

                	query = "SELECT * from customerdata";
                	java.sql.Statement stmt1 = conn.createStatement();
                	java.sql.ResultSet rs1 = stmt1.executeQuery(query);
                	
                            while(rs1.next())
                            {
                                %>
                                		<option >  <% out.println(rs1.getString("UserID")); 
                                        %> </option>
                                <%
                            }
                        }
                        catch(Exception e)
                        {
                            e.printStackTrace();
                        }
                        finally
                        {
                            try {
                                    conn.close();
                                } 
                            catch (Exception ee) 
                            {
                                ee.printStackTrace();
                            }
                        }
                        %>

						
						
					</select>
				</td></tr>
				<tr><td></td><td><input type="submit" name= "btnSubmit2" name= "btnSubmit2" value="Submit"></td></tr>
				</table>
				
				
				</form>
<%

                    
if(request.getParameter("btnSubmit2")!=null) //btnSubmit is the name of your button, not id of that button.
{
    String userid =request.getParameter("search_user").trim();
    String message = "Hello world";
    int flag = 0;
    int error = 0;
    if (userid.isEmpty())
    {
    	userid = "2018"; flag+=1;
    }
    else
    {
        //if (!ev.validate_phone(new_tn)){ error+=1; }// CHECKING USING REGEX
    }
    
    if (flag ==1)
    {
    	message = "You did not input anything.";
		%>
			<script type="text/javascript">
			    var msg = "<%=message%>";
			    if(alert(msg))
			    {
			    	//try{conn.close();}catch(Exception ee){};
			    	//response.sendRedirect("/305/update_data.jsp");
			    };
			</script>			
		<%	
    }
    else if(error>0)
    {
    	message = "Please check for spelling errors.";
		%>
			<script type="text/javascript">
			    var msg = "<%=message%>";
			    if(alert(msg))
			    {
			    };
			</script>			
		<%	
    }
    else
    {
    	%>
    		<h1>Date information: <% out.println(userid); %> </h1>
                    
                    <%
                   
            		Class.forName(mysJDBCDriver).newInstance();
            		sysprops2 =System.getProperties();
            		sysprops2.put("user",mysUserID);
            		sysprops2.put("password",mysPassword);
            	    //connect to the database
            	    conn=java.sql.DriverManager.getConnection(mysURL,sysprops2);
            	    

    				//connect to the database
            
                        try 
                        {
                            Class.forName(mysJDBCDriver).newInstance();
		        			sysprops=System.getProperties();
		        			sysprops.put("user",mysUserID);
		        			sysprops.put("password",mysPassword);
            
                    %>
                    <table border="1" align="center">
                        <tr align="center">
                            <td>Profile1</td>
                            <td>Profile2</td>
                            <td>Customer Representative</td>
                            <td>Time</td>
                            <td>Geo Location</td>
                            <td>Booking Fee</td>
                            <td>U1 Rated</td>
                            <td>U2 Rated</td>
                            <td>Comments</td>
                            <td>Geo Date</td>
                        </tr>
                    
                    <%

                	//String query = "SELECT * FROM DateData where userid = '"+ userid +"'";
                    query = "select * from datedata inner join (select userid, profileid from profiledata) temp on (datedata.Profile1 = temp.ProfileID or datedata.Profile2 = temp.ProfileID) where userid = '"+ userid +"'";
                    
                    java.sql.Statement stmt1=conn.createStatement();
                	java.sql.ResultSet rs1 = stmt1.executeQuery(query);
                	
                            while(rs1.next())
                            {
                                %>
                                <tr align="center">
                                 <td>
                                        <%
                                            out.println(rs1.getString("profile1"));

                                        %>
                                    </td>
                                 <td>
                                        <%
                                            out.println(rs1.getString("profile2"));

                                        %>
                                    </td>
                                   <td>
                                        <%
                                            out.println(rs1.getString("custrep"));

                                        %>
                                    </td>
                                   <td>
                                        <%
                                            out.println(rs1.getString("time"));

                                        %>
                                    </td>
                                   <td>
                                        <%
                                            out.println(rs1.getString("geolocation"));

                                        %>
                                    </td>
                                   <td>
                                        <%
                                            out.println(rs1.getString("bookingfee"));

                                        %>
                                    </td>
                                   <td>
                                        <%
                                            out.println(rs1.getString("U1Rated"));

                                        %>
                                    </td>
                                   <td>
                                        <%
                                            out.println(rs1.getString("U2Rated"));

                                        %>
                                    </td>
                                   <td>
                                        <%
                                            out.println(rs1.getString("Comments"));

                                        %>
                                    </td>
                                   <td>
                                        <%
                                            out.println(rs1.getString("IsGeoDate"));

                                        %>
                                    </td>
                                </tr>
                    
                                <%
                            }
                            %>
                            <%
                        }
                        catch(Exception e)
                        {
                            e.printStackTrace();
                        }
                        finally
                        {
                            try {
                                    conn.close();
                                } 
                            catch (Exception ee) 
                            {
                                ee.printStackTrace();
                            }
                        }
                        %>

                    </table>
    

<%
    }
}
%>
	</div>
         
          	<div class="tab-pane fade " id="onParDate">
				<form method="post"> <!--action="http://localhost:8080/305/save_edit.jsp">  -->
				<table>
				<tr><td>Year:</td><td><input type="text" name="search_year" >	</td></tr>
				<tr><td>Month:</td><td><input type="text" name="search_month"></td></tr>
				<tr><td>Day:</td><td><input type="text" name="search_day"></td></tr>
				<tr><td></td><td><input type="submit" name= "btnSubmit3" name= "btnSubmit3" value="Submit"></td></tr>
				</table>
				</form>

     <%              
if(request.getParameter("btnSubmit3")!=null) //btnSubmit is the name of your button, not id of that button.
{
    String year =request.getParameter("search_year").trim();
    String month = request.getParameter("search_month").trim();
    String day = request.getParameter("search_day").trim();
    String message = "Hello world";
    int flag = 0;
    int error = 0;
    if (year.isEmpty())
    {
    	year = "2018"; flag+=1;
    }
    else
    {
        //if (!ev.validate_phone(new_tn)){ error+=1; }// CHECKING USING REGEX
    }
    if (month.isEmpty())
    {
    	month = "05"; flag+=1;
    }
    else
    {
        //if (!ev.validate_email(new_email)){ error+=1; }// CHECKING USING REGEX
    }
    if (day.isEmpty())
    {
    	month = "03"; flag+=1;
    }
    
    if (flag ==3)
    {
    	message = "You did not input anything.";
		%>
			<script type="text/javascript">
			    var msg = "<%=message%>";
			    if(alert(msg))
			    {
			    	//try{conn.close();}catch(Exception ee){};
			    	//response.sendRedirect("/305/update_data.jsp");
			    };
			</script>			
		<%	
    }
    else if(error>0)
    {
    	message = "Please check for spelling errors.";
		%>
			<script type="text/javascript">
			    var msg = "<%=message%>";
			    if(alert(msg))
			    {
			    	//try{conn.close();}catch(Exception ee){};
			    	//response.sendRedirect("/305/update_data.jsp");
			    };
			</script>			
		<%	
    }
    else
    {
    	%>
    		<h1>Month information</h1>
                    
                    <%
                   
            		Class.forName(mysJDBCDriver).newInstance();
            		sysprops2 =System.getProperties();
            		sysprops2.put("user",mysUserID);
            		sysprops2.put("password",mysPassword);
            	    //connect to the database
            	    conn=java.sql.DriverManager.getConnection(mysURL,sysprops2);
            	    
            		System.out.println(year + "  "+ month +" what this?\n ");

    				//connect to the database
            
                        try 
                        {
                            Class.forName(mysJDBCDriver).newInstance();
        			sysprops=System.getProperties();
        			sysprops.put("user",mysUserID);
        			sysprops.put("password",mysPassword);
            
                    %>
                    <table border="1" align="center">
                        <tr align="center">
                            <td>Year</td>
                            <td>Month</td>
                            <td>Day</td>
                            <td>Total Revenue</td>
                        </tr>
                    
                    <%
                    String date = year+ "-" + month +"-"+ day;
                    String next_day = Integer.toString(Integer.parseInt(day) + 1);
                	String next_date = year+ "-" + month +"-"+ next_day;

                	query = "SELECT SUM(BookingFee) as bookingfee,SUM(BookingFee) AS TotalRevenue FROM DateData WHERE Time >= '"+date + "' AND TIME < '"+next_date +"' AND BookingFee <> 0";
                	java.sql.Statement stmt1=conn.createStatement();
                	java.sql.ResultSet rs1 = stmt1.executeQuery(query);
                	
                            while(rs1.next())
                            {
                                %>
                                <tr align="center">
                                 <td>
                                        <%
                                            out.println(year);

                                        %>
                                    </td>
                                    <td>
                                        <%
                                            out.println(month);
                                        %>
                                    </td>
                                    <td>
                                        <%
                                            out.println(day);
                                        %>
                                    </td>
                                    <td>
                                        <%
                                            out.println(rs1.getString("bookingfee"));
                                        %>
                                    </td>
                                </tr>
                    
                                <%
                            }
                            %>
                    </table>
                            <%
                        }
                        catch(Exception e)
                        {
                            e.printStackTrace();
                        }
                        finally
                        {
                            try {
                                    conn.close();
                                } 
                            catch (Exception ee) 
                            {
                                ee.printStackTrace();
                            }
                        }
                       
    }
}
%>
</div>

                   
        <div class="tab-pane fade" id="onParDate">
            <form method="post"> 
            <table>
            <tr><td>Year:</td><td><input type="text" name="search_year" >	</td></tr>
            <tr><td>Month:</td><td><input type="text" name="search_month"></td></tr>
            <tr><td>Day:</td><td><input type="text" name="search_day"></td></tr>
            <tr><td></td><td><input type="submit" name= "btnSubmit4" name= "btnSubmit4" value="Submit"></td></tr>
            </table>
            </form>

     <%              
if(request.getParameter("btnSubmit4")!=null) //btnSubmit is the name of your button, not id of that button.
{
    String year =request.getParameter("search_year").trim();
    String month = request.getParameter("search_month").trim();
    String day = request.getParameter("search_day").trim();
    String message = "Hello world";
    int flag = 0;
    int error = 0;
    if (year.isEmpty())
    {
    	year = "2018"; flag+=1;
    }
    else
    {
        //if (!ev.validate_phone(new_tn)){ error+=1; }// CHECKING USING REGEX
    }
    if (month.isEmpty())
    {
    	month = "05"; flag+=1;
    }
    else
    {
        //if (!ev.validate_email(new_email)){ error+=1; }// CHECKING USING REGEX
    }
    if (day.isEmpty())
    {
    	month = "03"; flag+=1;
    }
    
    if (flag ==3)
    {
    	message = "You did not input anything.";
		%>
			<script type="text/javascript">
			    var msg = "<%=message%>";
			    if(alert(msg))
			    {
			    	//try{conn.close();}catch(Exception ee){};
			    	//response.sendRedirect("/305/update_data.jsp");
			    };
			</script>			
		<%	
    }
    else if(error>0)
    {
    	message = "Please check for spelling errors.";
		%>
			<script type="text/javascript">
			    var msg = "<%=message%>";
			    if(alert(msg))
			    {
			    	//try{conn.close();}catch(Exception ee){};
			    	//response.sendRedirect("/305/update_data.jsp");
			    };
			</script>			
		<%	
    }
    else
    {
    	%>
    		<h1>Month information</h1>
                    
                    <%
                   
            		Class.forName(mysJDBCDriver).newInstance();
            		sysprops2 =System.getProperties();
            		sysprops2.put("user",mysUserID);
            		sysprops2.put("password",mysPassword);
            	    //connect to the database
            	    conn=java.sql.DriverManager.getConnection(mysURL,sysprops2);
            	    
            		System.out.println(year + "  "+ month +" what this?\n ");

    				//connect to the database
            
                        try 
                        {
                            Class.forName(mysJDBCDriver).newInstance();
        			sysprops=System.getProperties();
        			sysprops.put("user",mysUserID);
        			sysprops.put("password",mysPassword);
            
                    %>
                    <table border="1" align="center">
                        <tr align="center">
                            <td>Year</td>
                            <td>Month</td>
                            <td>Day</td>
                            <td>Total Revenue</td>
                        </tr>
                    
                    <%
                    String date = year+ "-" + month +"-"+ day;
                    String next_day = Integer.toString(Integer.parseInt(day) + 1);
                	String next_date = year+ "-" + month +"-"+ next_day;

                	query = "SELECT SUM(BookingFee) as bookingfee,SUM(BookingFee) AS TotalRevenue FROM DateData WHERE Time >= '"+date + "' AND TIME < '"+next_date +"' AND BookingFee <> 0";
                	java.sql.Statement stmt1=conn.createStatement();
                	java.sql.ResultSet rs1 = stmt1.executeQuery(query);
                	
                            while(rs1.next())
                            {
                                %>
                                <tr align="center">
                                 <td>
                                        <%
                                            out.println(year);

                                        %>
                                    </td>
                                    <td>
                                        <%
                                            out.println(month);
                                        %>
                                    </td>
                                    <td>
                                        <%
                                            out.println(day);
                                        %>
                                    </td>
                                    <td>
                                        <%
                                            out.println(rs1.getString("bookingfee"));
                                        %>
                                    </td>
                                </tr>
                    
                                <%
                            }
                            %>
                    </table>
                            <%
                        }
                        catch(Exception e)
                        {
                            e.printStackTrace();
                        }
                        finally
                        {
                            try {
                                    conn.close();
                                } 
                            catch (Exception ee) 
                            {
                                ee.printStackTrace();
                            }
                        }
                       
    }
}
%>
</div>          

<div class="tab-pane fade " id="aParCus">

				<form method="post">
				<table>
				<tr><td>User ID:</td><td>
					<select name="search_user" id = "search_user">
						<%
            	    

    				//connect to the database
            
                        try 
                        {
    						Class.forName(mysJDBCDriver).newInstance();
    	            		sysprops =System.getProperties();
    	            		sysprops.put("user",mysUserID);
    	            		sysprops.put("password",mysPassword);
                            Class.forName(mysJDBCDriver).newInstance();
                            
            	    //connect to the database
            	    conn =java.sql.DriverManager.getConnection(mysURL,sysprops);
            

                	query = "SELECT * from customerdata";
                	java.sql.Statement stmt1 = conn.createStatement();
                	java.sql.ResultSet rs1 = stmt1.executeQuery(query);
                	
                            while(rs1.next())
                            {
                                %>
                                		<option >  <% out.println(rs1.getString("UserID")); 
                                        %> </option>
                                <%
                            }
                        }
                        catch(Exception e)
                        {
                            e.printStackTrace();
                        }
                        finally
                        {
                            try {
                                    conn.close();
                                } 
                            catch (Exception ee) 
                            {
                                ee.printStackTrace();
                            }
                        }
                        %>

						
						
					</select>
				</td></tr>
				<tr><td></td><td><input type="submit" name= "btnSubmit5" name= "btnSubmit5" value="Submit"></td></tr>
				</table>
				
				
				</form>
<%

                    
if(request.getParameter("btnSubmit5")!=null) //btnSubmit is the name of your button, not id of that button.
{
    String userid =request.getParameter("search_user").trim();
    String message = "Hello world";
    int flag = 0;
    int error = 0;
    if (userid.isEmpty())
    {
    	userid = "2018"; flag+=1;
    }
    else
    {
        //if (!ev.validate_phone(new_tn)){ error+=1; }// CHECKING USING REGEX
    }
    
    if (flag ==1)
    {
    	message = "You did not input anything.";
		%>
			<script type="text/javascript">
			    var msg = "<%=message%>";
			    if(alert(msg))
			    {
			    	//try{conn.close();}catch(Exception ee){};
			    	//response.sendRedirect("/305/update_data.jsp");
			    };
			</script>			
		<%	
    }
    else if(error>0)
    {
    	message = "Please check for spelling errors.";
		%>
			<script type="text/javascript">
			    var msg = "<%=message%>";
			    if(alert(msg))
			    {
			    };
			</script>			
		<%	
    }
    else
    {
    	%>
    		<h1>Month information</h1>
                    
                    <%
                   
            		Class.forName(mysJDBCDriver).newInstance();
            		sysprops2 =System.getProperties();
            		sysprops2.put("user",mysUserID);
            		sysprops2.put("password",mysPassword);
            	    //connect to the database
            	    conn=java.sql.DriverManager.getConnection(mysURL,sysprops2);
            	    

    				//connect to the database
            
                        try 
                        {
                            Class.forName(mysJDBCDriver).newInstance();
        			sysprops=System.getProperties();
        			sysprops.put("user",mysUserID);
        			sysprops.put("password",mysPassword);
            
                    %>
                    <table border="1" align="center">
                        <tr align="center">
                            <td>User ID</td>
                            <td>First Name</td>
                            <td>Last Name</td>
                            <td>Total Revenue</td>
                        </tr>
                    
                    <%

                	query = "select userID, LastName, FirstName, sum(BookingFee) as bookingfee from ((select temp.userid as userid, profiledata.ProfileID as profileid , lastname, firstname   from (select * from customerdata) temp INNER JOIN profiledata ON profiledata.userID = temp.userID ) temp2 INNER JOIN datedata ON (datedata.profile1 = temp2.profileID or datedata.profile2 = temp2.profileID )) where userid = '"+ userid +"'";
                    java.sql.Statement stmt1=conn.createStatement();
                	java.sql.ResultSet rs1 = stmt1.executeQuery(query);
                	
                            while(rs1.next())
                            {
                                %>
                                <tr align="center">
                                 <td>
                                        <%
                                            out.println(userid);

                                        %>
                                    </td>
                                    <td>
                                        <%
                                            out.println( rs1.getString("FirstName"));
                                        %>
                                    </td>
                                    <td>
                                        <%
                                            out.println( rs1.getString("LastName"));
                                        %>
                                    </td>
                                    <td>
                                        <%
                                            out.println( rs1.getString("bookingfee"));
                                        %>
                                    </td>
                                </tr>
                    
                                <%
                            }
                            %>
                            <%
                        }
                        catch(Exception e)
                        {
                            e.printStackTrace();
                        }
                        finally
                        {
                            try {
                                    conn.close();
                                } 
                            catch (Exception ee) 
                            {
                                ee.printStackTrace();
                            }
                        }
                        %>
                        

                    </table>
                        <%
    
    }
}
%>
</div>  

	<div class="tab-pane fade" id="cusRep">
		<h1>Customer Representative Generated Most Total Revenue</h1>
                    
                <%
                   
                    try 
                    {
                        Class.forName(mysJDBCDriver).newInstance();
    			sysprops=System.getProperties();
    			sysprops.put("user",mysUserID);
    			sysprops.put("password",mysPassword);
        
				//connect to the database
                        conn=java.sql.DriverManager.getConnection(mysURL,sysprops);
            
            		java.sql.Statement stmt2=conn.createStatement();
                %>
                <table border="1" align="center">
                    <tr align="center">
                        <td>FirstName</td>
                        <td>LastName</td>
                        <td>SSN</td>
                        <td>Total Revenue</td>
                    </tr>
                
                <%
                    query = "SELECT CustRep, SUM(BookingFee) AS TotalRevenue FROM DateData WHERE CustRep IS NOT NULL GROUP BY DateData.CustRep ORDER BY TotalRevenue DESC LIMIT 1";
                    java.sql.ResultSet rs2 = stmt2.executeQuery(query);
                    if(rs2.next())
                    {
//                        out.print(rs2.getString("TotalRevenue"));
                    }
                    String mostCusRep=rs2.getString("CustRep");
                    String money=rs2.getString("TotalRevenue");
                    String query1="select * from EmployeeData where SSN='"+mostCusRep+"'";
                    java.sql.ResultSet rs1 = stmt2.executeQuery(query1);
                    
                        while(rs1.next())
                        {
                            %>
                            <tr align="center">
                                <td>
                                    <%
                                        out.println(rs1.getString("FirstName"));
                                    %>
                                </td>
                                <td>
                                    <%
                                        out.println(rs1.getString("LastName"));
                                    %>
                                </td>
                                <td>
                                    <%
                                        out.println(rs1.getString("SSN"));
                                    %>
                                </td>
                                <td>
                                    <%
                                        //out.println(rs2.getString("TotalRevenue"));
                                        out.println(money);
                                    %>
                                </td>
                            </tr>
                
                            <%
                        }
    
                    }
                    catch(Exception e)
                    {
                        e.printStackTrace();
                    }
                    finally
                    {
                        try {
                                conn.close();
                            } 
                        catch (Exception ee) 
                        {
                            ee.printStackTrace();
                        }
                    }
                        %>
                </table>
	</div>

	<div class="tab-pane fade" id="cus">

		<h2>Customer Generated Most Total Revenue</h2>
                    
                <%
                   
                    try 
                    {
                        Class.forName(mysJDBCDriver).newInstance();
    			sysprops=System.getProperties();
    			sysprops.put("user",mysUserID);
    			sysprops.put("password",mysPassword);
        
				//connect to the database
                        conn=java.sql.DriverManager.getConnection(mysURL,sysprops);
            
            		java.sql.Statement stmt2=conn.createStatement();
                %>
                <table border="1" align="center">
                    <tr align="center">
                        <td>FirstName</td>
                        <td>LastName</td>
                        <td>SSN</td>
                        <td>UserId</td>
                        <td>Profile Placement Priority</td>
                        <td>Rating</td>
                        <td>Total Revenue</td>
                    </tr>
                
                <%
                   query = "select userID, sum(Fees) as BookingFees From (SELECT ProfileID, SUM(Fee) AS Fees	FROM( SELECT Profile1 AS ProfileID, BookingFee AS Fee FROM DateData	UNION SELECT Profile2, BookingFee FROM DateData ) temp GROUP BY Profileid ORDER BY SUM(Fee) ) temp INNER JOIN profiledata ON profiledata.ProfileID = temp.ProfileID GROUP BY UserID ORDER BY BookingFees DESC limit 1";
                    java.sql.ResultSet rs = stmt2.executeQuery(query);
                    if(rs.next())
                    {
                    }
                    String money=rs.getString("BookingFees");
//                    int money1=Integer.parseInt(money);
                   String userid = rs.getString("userID");
                   
                   query = "Select * from CustomerData where UserId = '" + userid + "'";
                    java.sql.ResultSet rs1 = stmt2.executeQuery(query);
                    
                    
                    
                        while(rs1.next())
                        {
                            %>
                            <tr align="center">
                                <td>
                                    <%
                                        out.println(rs1.getString("FirstName"));
                                    %>
                                </td>
                                <td>
                                    <%
                                        out.println(rs1.getString("LastName"));
                                    %>
                                </td>
                                <td>
                                    <%
                                        out.println(rs1.getString("SSN"));
                                    %>
                                </td>
                                <td>
                                    <%
                                        out.println(rs1.getString("UserId"));
                                    %>
                                </td>
                                <td>
                                    <%
                                        out.println(rs1.getString("ProfilePlacementPriority"));
                                    %>
                                </td>
                                <td>
                                    <%
                                        out.println(rs1.getString("Rating"));
                                    %>
                                </td>
                                <td>
                                    <%
                                        DecimalFormat df = new DecimalFormat(".####");
                                        
                                        out.println(df.format(Double.parseDouble(money)));
                                    %>
                                </td>
                                
                            </tr>
                
                            <%
                        }
    
                    }
                    catch(Exception e)
                    {
                        e.printStackTrace();
                    }
                    finally
                    {
                        try {
                                conn.close();
                            } 
                        catch (Exception ee) 
                        {
                            ee.printStackTrace();
                        }
                    }
                        %>
                </table>
	</div>


<div class= "tab-pane fade" id="mActCus">

    		<h1> Most Active Customer </h1>
                    
                    <%
                   
            		Class.forName(mysJDBCDriver).newInstance();
            		sysprops2 =System.getProperties();
            		sysprops2.put("user",mysUserID);
            		sysprops2.put("password",mysPassword);
            	    conn=java.sql.DriverManager.getConnection(mysURL,sysprops2);
            	   
            
                        try 
                        {
                            Class.forName(mysJDBCDriver).newInstance();
		        			sysprops=System.getProperties();
		        			sysprops.put("user",mysUserID);
		        			sysprops.put("password",mysPassword);
            
                    %>
                    <table border="1" align="center">
                        <tr align="center">
                            <td>Number of Profiles</td>
                            <td>User id</td>
							<td>SSN</td>
							<td>Name</td>
							<td>Telephone</td>
							<td>Email</td>
							<td>Address</td>
							<td>City</td>
							<td>State</td>
							<td>ZipCode</td>
							<td>PPP</td>
							<td>Rating</td>
                        </tr>
                    
                    <%

                	query = "Select * from (SELECT C.UserID as userid, COUNT(*) AS NumOfProfile FROM ProfileData P, CustomerData C WHERE P.UserId = C.UserID GROUP BY C.UserID ) temp inner join customerdata on temp.userid = customerdata.userid";
                    
                    java.sql.Statement stmt1=conn.createStatement();
                	java.sql.ResultSet rs = stmt1.executeQuery(query);
                	
                            while(rs.next())
                            {
                                %>
                                <tr align="center">
                               		<td>
										<%
											out.println(rs.getString("NumOfProfile"));
										%>
									</td>
                               		<td>
										<%
											out.println(rs.getString("UserId"));
										%>
									</td>
									<td>
										<%
											out.println(rs.getString("SSN"));
										%>
									</td>
									<td>
										<%
											out.println(rs.getString("LastName") + " " + rs.getString("FirstName"));
										%>
									</td>
									<td>
										<%
											out.println(rs.getString("Telphone"));
										%>
									</td>
									<td>
										<%
											out.println(rs.getString("Email"));
										%>
									</td>
									<td>
										<%
											out.println(rs.getString("Address"));
										%>
									</td>
									<td>
										<%
											out.println(rs.getString("City"));
										%>
									</td>
									<td>
										<%
											out.println(rs.getString("State"));
										%>
									</td>
									<td>
										<%
											out.println(rs.getString("ZipCode"));
										%>
									</td>
									<td>
										<%
											out.println(rs.getString("ProfilePlacementPriority"));
										%>
									</td>
									<td>
										<%
											out.println(rs.getString("Rating"));
										%>
									</td>
                                </tr>
                    
                                <%
                            }
                            %>
                            <%
                        }
                        catch(Exception e)
                        {
                            e.printStackTrace();
                        }
                        finally
                        {
                            try {
                                    conn.close();
                                } 
                            catch (Exception ee) 
                            {
                                ee.printStackTrace();
                            }
                        }
                        %>

            </table>
</div>


<div class= "tab-pane fade in active" id="datingRec">
				<form method="post"> <!--action="http://localhost:8080/305/save_edit.jsp">  -->
				<table>
				<tr><td>User ID:</td><td>
					<select name="search_user" id = "search_user">
						<%
            	    

    				//connect to the database
            
                        try 
                        {
    						Class.forName(mysJDBCDriver).newInstance();
    	            		sysprops =System.getProperties();
    	            		sysprops.put("user",mysUserID);
    	            		sysprops.put("password",mysPassword);
                            Class.forName(mysJDBCDriver).newInstance();
                            
            	    //connect to the database
            	    conn =java.sql.DriverManager.getConnection(mysURL,sysprops);
            

                	query = "SELECT * from customerdata";
                	java.sql.Statement stmt1 = conn.createStatement();
                	java.sql.ResultSet rs1 = stmt1.executeQuery(query);
                	
                            while(rs1.next())
                            {
                                %>
                                		<option >  <% out.println(rs1.getString("UserID")); 
                                        %> </option>
                                <%
                            }
                        }
                        catch(Exception e)
                        {
                            e.printStackTrace();
                        }
                        finally
                        {
                            try {
                                    conn.close();
                                } 
                            catch (Exception ee) 
                            {
                                ee.printStackTrace();
                            }
                        }
                        %>

						
						
					</select>
				</td></tr>
				<tr><td></td><td><input type="submit" name= "btnSubmit8" name= "btnSubmit8" value="Submit"></td></tr>
				</table>
				
				
				</form>
<%

                    
if(request.getParameter("btnSubmit8")!=null) //btnSubmit is the name of your button, not id of that button.
{
    String userid =request.getParameter("search_user").trim();
    String message = "Hello world";
    int flag = 0;
    int error = 0;
    if (userid.isEmpty())
    {
		 flag+=1;
    }
    
    if (flag ==1)
    {
    	message = "You did not input anything.";
		%>
			<script type="text/javascript">
			    var msg = "<%=message%>";
			    if(alert(msg))
			    {
			    	//try{conn.close();}catch(Exception ee){};
			    	//response.sendRedirect("/305/update_data.jsp");
			    };
			</script>			
		<%	
    }
    else if(error>0)
    {
    	message = "Please check for spelling errors.";
		%>
			<script type="text/javascript">
			    var msg = "<%=message%>";
			    if(alert(msg))
			    {
			    };
			</script>			
		<%	
    }
    else
    {
    	%>
    		<h1>Dating Record</h1>
                    
                    <%
                   
            		Class.forName(mysJDBCDriver).newInstance();
            		sysprops2 =System.getProperties();
            		sysprops2.put("user",mysUserID);
            		sysprops2.put("password",mysPassword);
            	    //connect to the database
            	    conn=java.sql.DriverManager.getConnection(mysURL,sysprops2);
            	    

    				//connect to the database
            
                        try 
                        {
                            Class.forName(mysJDBCDriver).newInstance();
        			sysprops=System.getProperties();
        			sysprops.put("user",mysUserID);
        			sysprops.put("password",mysPassword);
            
                    %>
                    <table border="1" align="center">
                        <tr align="center">

                            <td>User id</td>
							<td>SSN</td>
							<td>Name</td>
							<td>Telephone</td>
							<td>Email</td>
							<td>Address</td>
							<td>City</td>
							<td>State</td>
							<td>ZipCode</td>
							<td>PPP</td>
							<td>Rating</td>
                        </tr>
                    
                    <%

                	query = "select * from (Select userid as u2 from (select  p21 as profileid from (select profile1 as p11, profile2 as p21 from datedata) temp1 inner join profiledata on profiledata.ProfileID = temp1.p11 where userid = '"+userid+"' Union select p11 as profileid from (select profile1 as p11, profile2 as p21 from datedata) temp1 inner join profiledata on profiledata.ProfileID = temp1.p21 where userid = '"+userid+ "' ) temp4 inner join profiledata on temp4.profileid = profiledata.ProfileID) temp5 inner join customerdata on customerdata.UserID = temp5.u2";
					java.sql.Statement stmt1=conn.createStatement();
                	java.sql.ResultSet rs = stmt1.executeQuery(query);
                	
                            while(rs.next())
                            {
                                %>
                                <tr align="center">
                                 	<td>
										<%
											out.println(rs.getString("UserId"));
										%>
									</td>
									<td>
										<%
											out.println(rs.getString("SSN"));
										%>
									</td>
									<td>
										<%
											out.println(rs.getString("LastName") + " " + rs.getString("FirstName"));
										%>
									</td>
									<td>
										<%
											out.println(rs.getString("Telphone"));
										%>
									</td>
									<td>
										<%
											out.println(rs.getString("Email"));
										%>
									</td>
									<td>
										<%
											out.println(rs.getString("Address"));
										%>
									</td>
									<td>
										<%
											out.println(rs.getString("City"));
										%>
									</td>
									<td>
										<%
											out.println(rs.getString("State"));
										%>
									</td>
									<td>
										<%
											out.println(rs.getString("ZipCode"));
										%>
									</td>
									<td>
										<%
											out.println(rs.getString("ProfilePlacementPriority"));
										%>
									</td>
									<td>
										<%
											out.println(rs.getString("Rating"));
										%>
									</td>
                                </tr>
                    
                                <%
                            }
                            %>
                            <%
                        }
                        catch(Exception e)
                        {
                            e.printStackTrace();
                        }
                        finally
                        {
                            try {
                                    conn.close();
                                } 
                            catch (Exception ee) 
                            {
                                ee.printStackTrace();
                            }
                        }
                        %>

   </table>

<%
    }
}
%>
</div>

<div class= "tab-pane fade" id="highRaCus">
	<h1> Highest Rated Customer </h1>
                    
                    <%
                   
            		Class.forName(mysJDBCDriver).newInstance();
            		sysprops2 =System.getProperties();
            		sysprops2.put("user",mysUserID);
            		sysprops2.put("password",mysPassword);
            	    conn=java.sql.DriverManager.getConnection(mysURL,sysprops2);
            	   
            
                        try 
                        {
                            Class.forName(mysJDBCDriver).newInstance();
		        			sysprops=System.getProperties();
		        			sysprops.put("user",mysUserID);
		        			sysprops.put("password",mysPassword);
            
                    %>
                    <table border="1" align="center">
                        <tr align="center">
                            <td>Number of Profiles</td>
                            <td>User id</td>
							<td>SSN</td>
							<td>Name</td>
							<td>Telephone</td>
							<td>Email</td>
							<td>Address</td>
							<td>City</td>
							<td>State</td>
							<td>ZipCode</td>
							<td>PPP</td>
							<td>Rating</td>
                        </tr>
                    
                    <%

                	query = "Select * from (SELECT USERID, SUM(AvgRating)/COUNT(USERID) as rating1 FROM(SELECT Customer, SUM(Rating)/COUNT(Rating) AS AvgRating FROM( SELECT Profile1 AS Customer, U1Rated AS Rating FROM DateData	UNION SELECT Profile2, U2Rated FROM DateData ORDER BY Customer) temp GROUP BY Customer ORDER BY SUM(Rating)/COUNT(Rating) ) temp INNER JOIN profiledata ON profiledata.ProfileID = temp.Customer GROUP BY UserID ) temp inner join customerdata on temp.userid = customerdata.userid order by rating1 DESC";
                    
                    java.sql.Statement stmt1=conn.createStatement();
                	java.sql.ResultSet rs = stmt1.executeQuery(query);
                	
                            while(rs.next())
                            {
                                %>
                                <tr align="center">
                               		<td>
										<%
											out.println(rs.getString("rating1"));
										%>
									</td>
                               		<td>
										<%
											out.println(rs.getString("UserId"));
										%>
									</td>
									<td>
										<%
											out.println(rs.getString("SSN"));
										%>
									</td>
									<td>
										<%
											out.println(rs.getString("LastName") + " " + rs.getString("FirstName"));
										%>
									</td>
									<td>
										<%
											out.println(rs.getString("Telphone"));
										%>
									</td>
									<td>
										<%
											out.println(rs.getString("Email"));
										%>
									</td>
									<td>
										<%
											out.println(rs.getString("Address"));
										%>
									</td>
									<td>
										<%
											out.println(rs.getString("City"));
										%>
									</td>
									<td>
										<%
											out.println(rs.getString("State"));
										%>
									</td>
									<td>
										<%
											out.println(rs.getString("ZipCode"));
										%>
									</td>
									<td>
										<%
											out.println(rs.getString("ProfilePlacementPriority"));
										%>
									</td>
									<td>
										<%
											out.println(rs.getString("Rating"));
										%>
									</td>
                                </tr>
                    
                                <%
                            }
                            %>
                            <%
                        }
                        catch(Exception e)
                        {
                            e.printStackTrace();
                        }
                        finally
                        {
                            try {
                                    conn.close();
                                } 
                            catch (Exception ee) 
                            {
                                ee.printStackTrace();
                            }
                        }
                        %>

            </table>
</div>


<div class= "tab-pane fade" id="highRaCal">
    			<h1> Highest Rated Dates</h1>
                    
                    <%
                   
            		Class.forName(mysJDBCDriver).newInstance();
            		sysprops2 =System.getProperties();
            		sysprops2.put("user",mysUserID);
            		sysprops2.put("password",mysPassword);
            	    conn=java.sql.DriverManager.getConnection(mysURL,sysprops2);
            	   
            
                        try 
                        {
                            Class.forName(mysJDBCDriver).newInstance();
		        			sysprops=System.getProperties();
		        			sysprops.put("user",mysUserID);
		        			sysprops.put("password",mysPassword);
            
                    %>
                    <!-- 
                    <table border="1" align="center">
                        <tr align="center">
                            <td>Number of Profiles</td>
                            <td>User id</td>
							<td>SSN</td>
							<td>Name</td>
							<td>Telephone</td>
							<td>Email</td>
							<td>Address</td>
							<td>City</td>
							<td>State</td>
							<td>ZipCode</td>
							<td>PPP</td>
							<td>Rating</td>
                        </tr>
                         -->
                     <table border="1" align="center">
                        <tr align="center">
                            <td>Date</td>
                            <!-- <td>Rating </td> -->
                        </tr>
                    
                    <%

                	//query = "Select * from (SELECT C.UserID as userid, COUNT(*) AS NumOfProfile FROM ProfileData P, CustomerData C WHERE P.UserId = C.UserID GROUP BY C.UserID ) temp inner join customerdata on temp.userid = customerdata.userid";
                    //query = "Select * from (SELECT USERID, SUM(AvgRating)/COUNT(USERID) as rating1 FROM(SELECT Customer, SUM(Rating)/COUNT(Rating) AS AvgRating FROM( SELECT Profile1 AS Customer, U1Rated AS Rating FROM DateData	UNION SELECT Profile2, U2Rated FROM DateData ORDER BY Customer) temp GROUP BY Customer ORDER BY SUM(Rating)/COUNT(Rating) ) temp INNER JOIN profiledata ON profiledata.ProfileID = temp.Customer GROUP BY UserID ) temp inner join customerdata on temp.userid = customerdata.userid order by rating1 DESC";
                    //query = "SELECT * FROM(SELECT Date(Time) AS T, (U1Rated + U2Rated)/2 AS Rating FROM DateData	ORDER BY T) temp GROUP BY Rating	ORDER BY SUM(Rating)/COUNT(Rating) DESC";
                    query = "SELECT T FROM( SELECT Date(Time) AS T, U1Rated AS Rating FROM DateData UNION SELECT Date(Time), U2Rated FROM DateData 	ORDER BY T) temp	GROUP BY T	ORDER BY SUM(Rating) DESC";

                    java.sql.Statement stmt1=conn.createStatement();
                	java.sql.ResultSet rs = stmt1.executeQuery(query);
                	
                            while(rs.next())
                            {
                                %>
                                <tr align="center">
                               		<td>
										<%
											out.println(rs.getString("T"));
										%>
									</td>
                               		<%-- <td>
										<%
											//out.println(rs.getString("rating"));
										%>
									</td> --%>
									
                    
                                <%
                            }
                            %>
                            <%
                        }
                        catch(Exception e)
                        {
                            e.printStackTrace();
                        }
                        finally
                        {
                            try {
                                    conn.close();
                                } 
                            catch (Exception ee) 
                            {
                                ee.printStackTrace();
                            }
                        }
                        %>

            </table>
</div>

</div>
</body>
</html>

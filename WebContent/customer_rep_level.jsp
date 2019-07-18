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
        <title>Customer Representative Level</title>
    </head>
    <body>
        <ul id="myTab" class="nav nav-tabs">
            <li ><a href="#myinformation" data-toggle="tab">My Information</a></li>
            <li ><a href="#rec" data-toggle="tab">Record a date</a></li>
	 
            <li><a href="#cusdo" data-toggle="tab">Customer Information</a></li>
        
            <li><a href="#mailinglist" data-toggle="tab">Mailing Lists</a></li>
            <li><a href="#profilelist" data-toggle="tab">Dating Suggestions</a></li>
            <li><a href="#information" data-toggle="tab">Employee Information</a></li>
            <li><a href="#logout" data-toggle="tab">Log Out</a></li>
        
        
        </ul>
<div id="myTabContent" class="tab-content">
	<div class="tab-pane fade " id="cusdo">
		<h1>All Customers Information</h1>
                <%
                    String mysJDBCDriver = "com.mysql.jdbc.Driver";
                    String mysURL = "jdbc:mysql://127.0.0.1:3306/Mayalu";
		String mysUserID = "root";
		String mysPassword = "8812992";
                    java.sql.Connection conn=null;
                    String userDefault="User-User";
                    int threeDefault=3;
                    String currDate=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(Calendar.getInstance().getTime());
                %>
                <%
                    
                    try 
                    {
                        Class.forName(mysJDBCDriver).newInstance();
    			java.util.Properties sysprops=System.getProperties();
    			sysprops.put("user",mysUserID);
    			sysprops.put("password",mysPassword);
        
				//connect to the database
                        conn=java.sql.DriverManager.getConnection(mysURL,sysprops);
            
            		java.sql.Statement stmt1=conn.createStatement();
                %>
                <table border="1" align="center">
                    <tr align="center">
                        <td>UserId</td>
                        <td>SSN</td>
                        <td>FirstName</td>
                        <td>LastName</td>
                        <td>Address</td>
                        <td>City</td>
                        <td>State</td>
                        <td>ZipCode</td>
                        <td>Telphone</td>
                        <td>Email</td>
                        <td>ProfilePlacementPriority</td>
                        <td>Rating</td>
                        <td>Edit</td>
                        <td>Delete</td> 
                    </tr>
                
                <%
                    java.sql.ResultSet rs1=stmt1.executeQuery("select * From CustomerData");
                        while(rs1.next())
                        {
                            %>
                            <tr align="center">
                                <td>
                                    <%
                                        out.println(rs1.getString("UserId"));
                                    %>
                                </td>
                                <td>
                                    <%
                                        out.println(rs1.getString("SSN"));
                                    %>
                                </td>
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
                                    <a href="customer_rep_delete_edit.jsp?SSN=<%=rs1.getString("SSN")%>&Option=<%="edit"%>">Edit</a>
                                </td>
                                <td>
                                    <a href="customer_rep_delete_edit.jsp?SSN=<%=rs1.getString("SSN")%>&Option=<%="delete"%>">Delete</a>
                                </td>
                            </tr>
                
                            <%
                        }
                        %>
                </table>
                <form name="manage_add" action="customer_rep_add_result.jsp" method="post">
                <li style="list-style-type:none;margin-top: 10px">
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
        
        <div class="tab-pane fade" id="mailinglist">
		<h1>All Customers' Mailing List</h1>
                
                <%
                    
                    try 
                    {
                        Class.forName(mysJDBCDriver).newInstance();
    			java.util.Properties sysprops=System.getProperties();
    			sysprops.put("user",mysUserID);
    			sysprops.put("password",mysPassword);
        
				//connect to the database
                        conn=java.sql.DriverManager.getConnection(mysURL,sysprops);
            
            		java.sql.Statement stmt1=conn.createStatement();
                %>
                <table border="1" align="center">
                    <tr align="center">
                        <td>UserId</td>
                        <td>FirstName</td>
                        <td>LastName</td>
                        <td>Address</td>
                        <td>City</td>
                        <td>State</td>
                        <td>ZipCode</td> 
                    </tr>
                
                <%
                    java.sql.ResultSet rs1=stmt1.executeQuery("select * From CustomerData");
                        while(rs1.next())
                        {
                            %>
                            <tr align="center">
                                <td>
                                    <%
                                        out.println(rs1.getString("UserId"));
                                    %>
                                </td>
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

	</div>
        
        <div class="tab-pane fade " id="rec">
		<h1>Record A Dating</h1>
                    
                <%
                    
                    try 
                    {
                        Class.forName(mysJDBCDriver).newInstance();
    			java.util.Properties sysprops=System.getProperties();
    			sysprops.put("user",mysUserID);
    			sysprops.put("password",mysPassword);
        
				//connect to the database
                        conn=java.sql.DriverManager.getConnection(mysURL,sysprops);
            
            		java.sql.Statement stmt1=conn.createStatement();
                %>
                <table border="1" align="center">
                    <tr align="center">
                        <td>Profile1</td>
                        <td>Profile2</td>
                        <td>CustRep</td>
                        <td>BookingFee</td>
                    </tr>
                
                <%
                    java.sql.ResultSet rs1=stmt1.executeQuery("select * from DateData D WHERE  D.Time >= CURRENT_TIME");
                        while(rs1.next())
                        {
                            %>
                            <tr align="center">
                                <td>
                                    <%
                                        out.println(rs1.getString("Profile1"));
                                    %>
                                </td>
                                <td>
                                    <%
                                        out.println(rs1.getString("Profile2"));
                                    %>
                                </td>
                                <td>
                                    
                                       
                                    
                                    
                                    
                                    <a href="customer_rep_addfee.jsp?Profile1=<%=rs1.getString("Profile1")%>&Profile2=<%=rs1.getString("Profile2")%>&Time=<%=rs1.getString("Time")%>">
                                               <% out.println(rs1.getString("CustRep")); %>
                                            </a>
                                            
                                        
                                    
                                    
                                </td>
                                <td>
                                    <%
                                        out.println(rs1.getString("BookingFee"));
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

	</div>

                    
                    
        <div class="tab-pane fade" id="profilelist">
		<h1>Dating Suggestions List</h1>
                    
                <%
                    
                    try 
                    {
                        Class.forName(mysJDBCDriver).newInstance();
    			java.util.Properties sysprops=System.getProperties();
    			sysprops.put("user",mysUserID);
    			sysprops.put("password",mysPassword);
        
				//connect to the database
                        conn=java.sql.DriverManager.getConnection(mysURL,sysprops);
            
            		java.sql.Statement stmt1=conn.createStatement();
                %>
                <table border="1" align="center">
                    <tr align="center">
                        <td>Profile Id</td>
                    </tr>
                
                <%
                    java.sql.ResultSet rs1=stmt1.executeQuery("select * from ProfileData");
                        while(rs1.next())
                        {
                            %>
                            <tr align="center">
                                <td>
                                    
                                        <a href="customer_rep_suggest.jsp?ProfileId=<%=rs1.getString("ProfileId")%>">
                                               <% out.println(rs1.getString("ProfileId")); %>
                                            </a>
                                    
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

	</div>
                    
                    
                    
        <div class="tab-pane fade " id="logout">
		<h1>Do you want to Log out?</h1>
                    
                
                            <div  style="position: absolute;top:40%;left:50%;transform: translate(-50%, -50%);
            text-align: center">
                             <ul>
                   
                                <form name="signup" action="index.jsp" method="post">
                                <li style="list-style-type:none;float: top;">
                                   <button  style="height: 25px;" class="button1" >Yes</button>
                                </li>
                                </form>
                                 
                                <form name="signup" action="customer_rep_level.jsp" method="post">
                                <li style="list-style-type:none;float: top;">
                                   <button  style="height: 25px;" class="button1" >No</button>
                                </li>
                                </form>
                            </ul>
                            </div>
      </div>

        <div class="tab-pane fade" id="information">
		<h1>All Employees Information</h1>
              
                <%
                    
                    try 
                    {
                        Class.forName(mysJDBCDriver).newInstance();
    			java.util.Properties sysprops=System.getProperties();
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
                        <td>Address</td>
                        <td>City</td>
                        <td>State</td>
                        <td>ZipCode</td>
                        <td>Telphone</td>
                        <td>Email</td>
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

	</div>
                    
        <div class="tab-pane fade in active" id="myinformation">
		<h1>All Employees Information</h1>
               
                <%
                    
                    try 
                    {
                        Class.forName(mysJDBCDriver).newInstance();
    			java.util.Properties sysprops=System.getProperties();
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
                        <td>StartDate</td>
                        <td>Address</td>
                        <td>City</td>
                        <td>State</td>
                        <td>ZipCode</td>
                        <td>Telphone</td>
                        <td>Email</td>
                    </tr>
                
                <%
                    java.sql.ResultSet rs1=stmt1.executeQuery("select * From EmployeeData WHERE SSN= '"+session.getAttribute("finalid").toString()+"'");
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
                                        out.println(rs1.getString("StartDate"));
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

	</div>

</div>






</body>
</html>
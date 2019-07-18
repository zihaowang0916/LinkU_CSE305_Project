

<%@page import="java.util.Calendar"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Job Search-Candidate Registration</title>
	    <!-- Bootstrap core CSS -->
	    <link href="css/bootstrap.min.css" rel="stylesheet">
	
	
	    <!-- Custom styles for this template -->
	    <link href="css/register_form.css" rel="stylesheet">
    </head>
    <body>
       
       
       
       <!-- Side Nav Bar -->
		<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
		  <a class="navbar-brand brand right-space" href="#">Logo goes here</a>
		  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
		    <span class="navbar-toggler-icon"></span>
		  </button>
		
		  <div class="collapse navbar-collapse" id="navbarSupportedContent">
		    <ul class="navbar-nav mr-auto">
		      <!-- <li class="nav-item active">
		        <a class="nav-link fas fa-home" href="index.html">Home <span class="sr-only">(current)</span></a>
		      </li>
		      <li class="nav-item">
		        <a class="nav-link fas fa-ticket-alt" href="ticket.html">Tickets</a>
		      </li>
		      <li class="nav-item">
		        <a class="nav-link fas fa-shopping-cart" href="#">Cart</a>
		      </li> -->
		    </ul>
		  </div>
		</nav>
    <%
        String mysJDBCDriver = "com.mysql.jdbc.Driver";
        String mysURL = "jdbc:mysql://127.0.0.1:3306/final";
		String mysUserID = "root";
		String mysPassword = "Hl917525";
        java.sql.Connection conn=null;

    
                    try 
                    {
                        Class.forName(mysJDBCDriver).newInstance();
    			java.util.Properties sysprops=System.getProperties();
    			sysprops.put("user",mysUserID);
    			sysprops.put("password",mysPassword);
        
				//connect to the database
                        conn=java.sql.DriverManager.getConnection(mysURL,sysprops);
            		//out.println("Connected successfully to database using JConnect");
            
            		java.sql.Statement stmt1=conn.createStatement();
            		
                       java.sql.ResultSet rs = stmt1.executeQuery("select * from candidate where email='"+request.getParameter("cand-email")+"'");
                       
                       if (rs.next()) {
                       %>
                      	<form name="signup" action="index.jsp" method="post">
                            <div  style="position: absolute;top:40%;left:50%;transform: translate(-50%, -50%);
            text-align: center">
                             <ul>
                   
                                <li style="list-style-type:none;float: top;color: black"><p>Email has been signed up.</p></li>
                                <li style="list-style-type:none;float: top;">
                                   <button class="btn btn-success" >Go To Previous Page</button>
                                </li>
                            </ul>
                            </div>
                            </form>
                       
                       <%
                           return;
                        }

			stmt1.executeUpdate("INSERT INTO candidate (email, phone, about, firstname, lastname, password, address) VALUES("
                                + "'"+request.getParameter("cand-email")+"','"+request.getParameter("cand-phone")+"',"
                                        + "'"+request.getParameter("cand-about")+"','"+request.getParameter("firstname")+"',"
                                                + "'"+request.getParameter("lastname")+"','"+request.getParameter("cand-password")+"',"
                                                        + "'"+request.getParameter("cand-address") +"')");
                        //session.setAttribute("user-id",request.getParameter("cand-email") );
                        %>
                        <form name="signup" action="index.jsp" method="post">
                            <div  style="position: absolute;top:40%;left:50%;transform: translate(-50%, -50%);
            text-align: center">
                             <ul>
                   
                                <li style="list-style-type:none;float: top;color: black"><p>Congratulations, you have registered a new account.</p></li>
                                <li style="list-style-type:none;float: top;">
                                   <button  class="btn btn-success" >Continue</button>
                                </li>
                            </ul>
                            </div>
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
    </body>
</html>



<%@page import="java.util.Calendar"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="css/indexStyle.css">
        <title>Registering</title>
    </head>
    <body>
       
	<ul>
		<li>
            firstname is <%=request.getParameter("firstname")%>
        </li>
	</ul>
    <%
        String mysJDBCDriver = "com.mysql.jdbc.Driver";
        String mysURL = "jdbc:mysql://127.0.0.1:3306/Mayalu";
		String mysUserID = "root";
		String mysPassword = "8812992";
        java.sql.Connection conn=null;
        String userDefault="User-User";

    
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
            		
                       java.sql.ResultSet rs = stmt1.executeQuery("select * from CustomerData where email='"+request.getParameter("cand-email")+"'");
                       
                       if (rs.next()) {
                       %>
                      	<form name="signup" action="index.jsp" method="post">
                            <div  style="position: absolute;top:40%;left:50%;transform: translate(-50%, -50%);
            text-align: center">
                             <ul>
                   
                                <li style="list-style-type:none;float: top;color: black"><p>Email has been signed up.</p></li>
                                <li style="list-style-type:none;float: top;">
                                   <button  style="height: 25px;" class="button1" >Go To Previous Page</button>
                                </li>
                            </ul>
                            </div>
                            </form>
                       
                       <%
                           return;
                        }

			stmt1.executeUpdate("INSERT INTO CustomerData VALUES("
                                + "'"+request.getParameter("UserId")+"','"+request.getParameter("Ssn")+"',"
                                        + "'"+request.getParameter("Password")+"','"+request.getParameter("Lastname")+"',"
                                                + "'"+request.getParameter("Firstname")+"','"+request.getParameter("Address")+"',"
                                                        + "'"+request.getParameter("City")+"','"+request.getParameter("State")+"',"
                                                                + "'"+request.getParameter("Zipcode")+"','"+request.getParameter("Telphone")+"',"
                                                                        + "'"+request.getParameter("Email")+"','"+userDefault+"',"
                                                                                +"')");
                        session.setAttribute("finalid",request.getParameter("UserId") );
                        %>
                        <form name="signup" action="user_login.jsp" method="post">
                            <div  style="position: absolute;top:40%;left:50%;transform: translate(-50%, -50%);
            text-align: center">
                             <ul>
                   
                                <li style="list-style-type:none;float: top;color: black"><p>Congratulations, you have registered a new account.</p></li>
                                <li style="list-style-type:none;float: top;">
                                   <button  style="height: 25px;" class="button1" >Continue</button>
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

<%-- 
    Document   : manager_edit_result
    Created on : 2018-4-27, 23:44:05
    Author     : fenglin
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Customer Edit Result Page</title>
        <link rel="stylesheet" href="css/indexStyle.css">
    </head>
    <body>
        
        <%
            String mysJDBCDriver = "com.mysql.jdbc.Driver";
                    String mysURL = "jdbc:mysql://127.0.0.1:3306/Mayalu";
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
            
            		java.sql.Statement stmt1=conn.createStatement();                     
                        String address=request.getParameter("cus_address");
                        String city=request.getParameter("cus_city");
                        String state=request.getParameter("cus_state");
                        
                        String telphone=request.getParameter("cus_telphone");
                        String email=request.getParameter("cus_email");
                        String profilePlacement=request.getParameter("cus_profileplacementpriority");

                        
                        if(!address.isEmpty())
                        {
                            stmt1.executeUpdate("UPDATE CustomerData SET Address = "
                                    + "'"+address+"' WHERE SSN='"+session.getAttribute("cus_ssn").toString()+"'");
                        }
                        if(!city.isEmpty())
                        {
                            stmt1.executeUpdate("UPDATE CustomerData SET City "
                                    + "= '"+city+"' WHERE SSN='"+session.getAttribute("cus_ssn").toString()+"'");
                        }
                        if(!state.isEmpty())
                        {
                            
                            stmt1.executeUpdate("UPDATE CustomerData SET State "
                                    + "= '"+state+"' WHERE SSN='"+session.getAttribute("cus_ssn").toString()+"'");
                            
                        }
                        
                        if(!telphone.isEmpty())
                        {
                            stmt1.executeUpdate("UPDATE CustomerData SET Telphone "
                                    + "= '"+telphone+"' WHERE SSN='"+session.getAttribute("cus_ssn").toString()+"'");
                        }
                        if(!email.isEmpty())
                        {
                            stmt1.executeUpdate("UPDATE CustomerData SET Email "
                                    + "= '"+email+"' WHERE SSN='"+session.getAttribute("cus_ssn").toString()+"'");
                        }
                        if(!request.getParameter("cus_rating").isEmpty())
                        {
                            stmt1.executeUpdate("UPDATE CustomerData SET Rating "
                                    + "= '"+request.getParameter("cus_rating")+"' WHERE SSN='"+session.getAttribute("cus_ssn").toString()+"'");
                        }
                        if(!request.getParameter("cus_zipcode").isEmpty())
                        {
                            stmt1.executeUpdate("UPDATE CustomerData SET ZipCode "
                                    + "= '"+request.getParameter("cus_zipcode")+"' WHERE SSN='"+session.getAttribute("cus_ssn").toString()+"'");
                        }
                        if(!profilePlacement.isEmpty())
                        {
                            stmt1.executeUpdate("UPDATE CustomerData SET ProfilePlacementPriority = "
                                    + "'"+profilePlacement+"' WHERE SSN='"+session.getAttribute("cus_ssn").toString()+"'");
                        }
                        %>
                        <form name="signupup" action="customer_rep_level.jsp" method="post">
                            <div  style="position: absolute;top:40%;left:50%;transform: translate(-50%, -50%);
            text-align: center">
                             <ul>
                   
                                <li style="list-style-type:none;float: top;color: cyan"><p>This Customer Information has been edited</p></li>
                                <li style="list-style-type:none;float: top;">
                                   <button  style="height: 25px;" class="button1" >Go To Customer Representative Page</button>
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

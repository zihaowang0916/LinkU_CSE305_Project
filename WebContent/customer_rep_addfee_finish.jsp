<%-- 
    Document   : cus_rep_addfee_finish
    Created on : 2018-4-29, 4:03:22
    Author     : fenglin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="css/indexStyle.css">
        <title>JSP Page</title>
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
                        if(request.getParameter("cus_bookingfee").isEmpty())
                        {
                            
                        }
                        else{
                            int a = Integer.parseInt(request.getParameter("cus_bookingfee"));
                            stmt1.executeUpdate("UPDATE DateData SET CustRep = "
                                    + "'"+session.getAttribute("finalid")+"' WHERE Profile1='"+session.getAttribute("Profile1").toString()+"' AND Profile2='"+session.getAttribute("Profile2").toString()+"' AND Time='"+session.getAttribute("Time").toString()+"'");
                        stmt1.executeUpdate("UPDATE DateData SET BookingFee = "
                                    + "'"+request.getParameter("cus_bookingfee")+"' WHERE Profile1='"+session.getAttribute("Profile1").toString()+"' AND Profile2='"+session.getAttribute("Profile2").toString()+"' AND Time='"+session.getAttribute("Time").toString()+"'");
                        
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
             <form name="signup" action="customer_rep_level.jsp" method="post">
                            <div  style="position: absolute;top:40%;left:50%;transform: translate(-50%, -50%);
            text-align: center">
                             <ul>
                   
                                <li style="list-style-type:none;float: top"><p>You have Recorded Date</p></li>
                                <li style="list-style-type:none;float: top;">
                                   <button  style="height: 25px;" class="button1" >Back To Customer Representative Page</button>
                                </li>
                            </ul>
                            </div>
                            </form>
    </body>
</html>

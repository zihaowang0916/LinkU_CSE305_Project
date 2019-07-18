<%-- 
    Document   : customer_rep_suggest_match
    Created on : 2018-4-29, 18:34:58
    Author     : fenglin
--%>

<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Calendar"%>
<%@page import="java.util.Calendar"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="css/indexStyle.css">
        <title>Match</title>
    </head>
    <body>
        <%
                    String mysJDBCDriver = "com.mysql.jdbc.Driver";
                   String mysURL = "jdbc:mysql://127.0.0.1:3306/Mayalu";
		String mysUserID = "root";
		String mysPassword = "8812992";
                    java.sql.Connection conn=null;
                    String userDefault="User-User";
                    int threeDefault=3;
                    String currDate=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(Calendar.getInstance().getTime());
                
                    
                    try 
                    {
                       
                        Class.forName(mysJDBCDriver).newInstance();
    			java.util.Properties sysprops=System.getProperties();
    			sysprops.put("user",mysUserID);
    			sysprops.put("password",mysPassword);
        
				//connect to the database
                        conn=java.sql.DriverManager.getConnection(mysURL,sysprops);
            
            		java.sql.Statement stmt1=conn.createStatement();
                        stmt1.executeUpdate("INSERT INTO SuggestedBy(CustRep,Profile1,Profile2,DateTime) VALUES("
        + "'"+session.getAttribute("finalid").toString()+"','"+request.getParameter("ProfileId")+"',"
        + "'"+request.getParameter("ProfileIdOne")+"','"+currDate+"')");
                        
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
                   
                                <li style="list-style-type:none;float: top;color: cyan"><p>You have add these two Profiles into Suggested List.</p></li>
                                <li style="list-style-type:none;float: top;">
                                   <button  style="height: 25px;" class="button1" >Back To Customer Representative Page</button>
                                </li>
                            </ul>
                            </div>
                            </form>
    </body>
</html>

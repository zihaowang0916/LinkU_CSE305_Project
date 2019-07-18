<%-- 
    Document   : Employee_delete_edit
    Created on : 2018-4-27, 22:37:12
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
        <title>Edit or Delete page</title>
    </head>
    <body style="background-image: url('css/be.png')">
        <h1>Customer Representative Edit Page</h1>
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
                        String option=request.getParameter("Option");
                    if(option.equals("delete"))
                    {
                        
                       String  query ="DELETE FROM CustomerData WHERE SSN = '"+request.getParameter("SSN")+"'";
                       int result = stmt1.executeUpdate(query);	
                       
                       %>
                        <form name="signup" action="customer_rep_level.jsp" method="post">
                            <div  style="position: absolute;top:40%;left:50%;transform: translate(-50%, -50%);
            text-align: center">
                             <ul>
                   
                                <li style="list-style-type:none;float: top;color: cyan"><p>This Customer Information Has Been Deleted</p></li>
                                <li style="list-style-type:none;float: top;">
                                   <button  style="height: 25px;" class="button1" >Back To Previous Page</button>
                                </li>
                            </ul>
                            </div>
                        </form>
                        <%
                            return;
                    }
                    if(option.equals("edit"))
                    {
                        session.setAttribute("cus_ssn",request.getParameter("SSN") );
                        %>
                            <form name="cusrep_edit_result" action="customer_rep_edit_result.jsp" method="post">
            <div>
                <ul>
                    
                    <li style="list-style-type:none;float: top;"><p>Please Edit Here</p></li>
                    <li style="list-style-type:none;margin-top: 10px">
                        <input type="text" name="cus_address" placeholder="Address" style="height: 20px;">
                        <input type="text" name="cus_city" placeholder="City" style="height: 20px;">
                    </li>
                    <li style="list-style-type:none;margin-top: 10px">
                        <input type="text" name="cus_state" placeholder="State" style="height: 20px;">
                        <input type="text" name="cus_zipcode" placeholder="ZipCode" style="height: 20px;">
                    </li>
                    
                    <li style="list-style-type:none;margin-top: 10px">
                        <input type="text" name="cus_telphone" placeholder="Telphone" style="height: 20px;">
                    </li>
                    <li style="list-style-type:none;margin-top: 10px">
                        <input type="text" name="cus_email" placeholder="Email" style="height: 20px;">
                    </li>
                    <li style="list-style-type:none;margin-top: 10px">
                        <select  style="height: 20px;" name="cus_profileplacementpriority">
                                <option value="">Profile Placement Priority</option>
                                <option value="User_User">User_User</option>
                                <option value="Good_User">Good_User</option>
                                <option value="Super_User">Super_User</option>
                        </select>
                    </li>
                    <li style="list-style-type:none;margin-top: 10px">
                        <select  style="height: 20px;" name="cus_rating">
                                <option value="">Rating</option>
                                <option value="1">1</option>
                                <option value="2">2</option>
                                <option value="3">3</option>
                                <option value="4">4</option>
                                <option value="5">5</option>
                        </select>
                    </li>
                    <li style="list-style-type:none;margin-top: 10px">
                            <button  style="height: 25px;" class="button1" >Edit</button>
                    </li>
                    
                  
                      
                </ul>
            </div>
            </form>
                        <%
                            return;
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
    </body>
</html>

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
        <h1>Manager Edit Page</h1>
        <% 
           
                 
                    String mysJDBCDriver = "com.mysql.jdbc.Driver";
                    String mysURL ="jdbc:mysql://127.0.0.1:3306/Mayalu";
String mysUserID = "root"; 
String mysPassword = "8812992";
                    java.sql.Connection conn=null;
                    String userDefault="User-User";
                    int threeDefault=3;
                    String currDate=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(Calendar.getInstance().getTime());

                    String manager_ssn = session.getAttribute("finalid").toString();
                    session.setAttribute("finalid",manager_ssn);
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
                        
                       String  query ="DELETE FROM EmployeeData WHERE SSN = '"+request.getParameter("SSN")+"'";
                       int result = stmt1.executeUpdate(query);	
                       
                       %>
                        <form name="signup" action="manager_level.jsp" method="post">
                            <div  style="position: absolute;top:40%;left:50%;transform: translate(-50%, -50%);
            text-align: center">
                             <ul>
                   
                                <li style="list-style-type:none;float: top;color: cyan"><p>This Employee Information Has Been Deleted</p></li>
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
                        session.setAttribute("emp_ssn",request.getParameter("SSN") );
                        %>
                            <form name="manager_edit_result" action="manager_edit_result.jsp" method="post">
            <div class="emp_middle" >
                <ul>
                    
                    <li style="list-style-type:none;float: top;"><p>Please Edit Here</p></li>
  
                    <li style="list-style-type:none;float: top;margin-top: 10px">
                        <input type="text" name="emp_firstname" placeholder="FirstName" style="height: 20px;">
                    </li>
                    <li style="list-style-type:none;float:top;margin-top: 10px">
                        <input type="text" name="emp_lastname" placeholder="LastName" style="height: 20px;">
                    </li>
                    <li style="list-style-type:none;float: top;margin-top: 10px">
                        <input type="text" name="emp_hourlyrate" placeholder="HourlyRate" style="height: 20px;">
                    </li>
                    <li style="list-style-type:none;margin-top: 10px">
<!--                            <select id="signup-sex" class="signup-field" name="gender">
                                <option value="">Please Your Gender</option>
				<option value="male">Male</option>
                                <option value="female">Female</option>
                            </select>-->
                        <input type="text" name="emp_address" placeholder="Address" style="height: 20px;">
                        <input type="text" name="emp_city" placeholder="City" style="height: 20px;">
                    </li>
                    <li style="list-style-type:none;margin-top: 10px">
                        <input type="text" name="emp_state" placeholder="State" style="height: 20px;">
                        <input type="text" name="emp_zipcode" placeholder="ZipCode" style="height: 20px;">
                    </li>
                    
                    <li style="list-style-type:none;margin-top: 10px">
                        <input type="text" name="emp_telphone" placeholder="Telphone" style="height: 20px;">
                    </li>
                    <li style="list-style-type:none;margin-top: 10px">
                        <input type="text" name="emp_email" placeholder="Email" style="height: 20px;">
                    </li>
                    <li style="list-style-type:none;margin-top: 10px">
                        <select  style="height: 20px;" name="emp_role">
                                <option value="">Role</option>
                                <option value="Manager">Manager</option>
                                <option value="CustRep">Customer-Representative</option>									
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

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
        <title>Manager Edit Result Page</title>
        <link rel="stylesheet" href="css/indexStyle.css">
    </head>
    <body>
        <%
            String mysJDBCDriver = "com.mysql.jdbc.Driver";
                    String mysURL ="jdbc:mysql://127.0.0.1:3306/Mayalu";
String mysUserID = "root"; 
String mysPassword = "8812992";
                    java.sql.Connection conn=null;
                    
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
                        String firstName=request.getParameter("emp_firstname");;
                        String lastName=request.getParameter("emp_lastname");;
                        String role=request.getParameter("emp_role");
                        
                        String address=request.getParameter("emp_address");
                        String city=request.getParameter("emp_city");
                        String state=request.getParameter("emp_state");
                        
                        String telphone=request.getParameter("emp_telphone");
                        String email=request.getParameter("emp_email");
                        if(!firstName.isEmpty())
                        {
                            stmt1.executeUpdate("UPDATE EmployeeData SET FirstName = "
                                    + "'"+firstName+"' WHERE SSN='"+session.getAttribute("emp_ssn").toString()+"'");
                        }
                        if(!lastName.isEmpty())
                        {
                            stmt1.executeUpdate("UPDATE EmployeeData SET LastName "
                                    + "= '"+lastName+"' WHERE SSN='"+session.getAttribute("emp_ssn").toString()+"'");
                        }
                        if(!role.isEmpty())
                        {
                            if (role.equals(null)) 
                            {
                                    
                            }
                            else
                            {
                            stmt1.executeUpdate("UPDATE EmployeeData SET Role "
                                    + "= '"+role+"' WHERE SSN='"+session.getAttribute("emp_ssn").toString()+"'");
                            }
                        }
                        if(!address.isEmpty())
                        {
                            stmt1.executeUpdate("UPDATE EmployeeData SET Address "
                                    + "= '"+address+"' WHERE SSN='"+session.getAttribute("emp_ssn").toString()+"'");
                        }
                        if(!city.isEmpty())
                        {
                            stmt1.executeUpdate("UPDATE EmployeeData SET City "
                                    + "= '"+city+"' WHERE SSN='"+session.getAttribute("emp_ssn").toString()+"'");
                        }
                        if(!state.isEmpty())
                        {
                            stmt1.executeUpdate("UPDATE EmployeeData SET State = "
                                    + "'"+state+"' WHERE SSN='"+session.getAttribute("emp_ssn").toString()+"'");
                        }
                        if(!telphone.isEmpty())
                        {
                            stmt1.executeUpdate("UPDATE EmployeeData SET Telphone "
                                    + "= '"+telphone+"' WHERE SSN='"+session.getAttribute("emp_ssn").toString()+"'");
                        }
                        if(!email.isEmpty())
                        {
                            stmt1.executeUpdate("UPDATE EmployeeData SET Email "
                                    + "= '"+email+"' WHERE SSN='"+session.getAttribute("emp_ssn").toString()+"'");
                        }
                        if(!request.getParameter("emp_hourlyrate").isEmpty())
                        {
                            stmt1.executeUpdate("UPDATE EmployeeData SET HourlyRate "
                                    + "= '"+request.getParameter("emp_hourlyrate")+"' WHERE SSN='"+session.getAttribute("emp_ssn").toString()+"'");
                        }
                        if(!request.getParameter("emp_zipcode").isEmpty())
                        {
                            stmt1.executeUpdate("UPDATE EmployeeData SET ZipCode "
                                    + "= '"+request.getParameter("emp_zipcode")+"' WHERE SSN='"+session.getAttribute("emp_ssn").toString()+"'");
                        }
                        %>
                        <form name="signup" action="manager_level.jsp" method="post">
                            <div  style="position: absolute;top:40%;left:50%;transform: translate(-50%, -50%);
            text-align: center">
                             <ul>
                   
                                <li style="list-style-type:none;float: top;color: cyan"><p>This Employee Information has been edited</p></li>
                                <li style="list-style-type:none;float: top;">
                                   <button  style="height: 25px;" class="button1" >Go To Manager Page</button>
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

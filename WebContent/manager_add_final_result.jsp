<%@page import="java.util.Calendar"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="css/indexStyle.css">
        <title>Login Page</title>
    </head>
    <body style="background-image: url('css/be.png')">
       
    
        
    <%
                 
                    String mysJDBCDriver = "com.mysql.jdbc.Driver";
                    String mysURL ="jdbc:mysql://127.0.0.1:3306/Mayalu";
String mysUserID = "root"; 
String mysPassword = "8812992";
                    java.sql.Connection conn=null;
                    String userDefault="User-User";
                    int threeDefault=3;
                    String currDate=new SimpleDateFormat("yyyy/MM/dd").format(Calendar.getInstance().getTime());
                    
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
//            		out.println("Connected successfully to database using JConnect");
            
            		java.sql.Statement stmt1=conn.createStatement();
                        
                       if(request.getParameter("emp_firstname").isEmpty() || 
                               request.getParameter("emp_lastname").isEmpty()||
                               request.getParameter("emp_ssn").isEmpty()
                               ||request.getParameter("emp_role").isEmpty())
                       {
                           
                           
                           %>
                           <form name="signup" action="manager_add_result.jsp" method="post">
                            <div  style="position: absolute;top:40%;left:50%;transform: translate(-50%, -50%);
            text-align: center">
                             <ul>
                   
                                <li style="list-style-type:none;float: top;color: cyan"><p>Employee' Full Name,Role and SSN Can't Be Empty</p></li>
                                <li style="list-style-type:none;float: top;">
                                   <button  style="height: 25px;" class="button1" >Go To Previous Page</button>
                                </li>
                            </ul>
                            </div>
                            </form>
                           <%
                               return;
                       
                       }
                       java.sql.ResultSet rs = stmt1.executeQuery("select * from EmployeeData where SSN='"+request.getParameter("emp_ssn")+"'");
                       
                       if (rs.next()) {
                       %>
                       <form name="signup" action="manager_add_result.jsp" method="post">
                            <div  style="position: absolute;top:40%;left:50%;transform: translate(-50%, -50%);
            text-align: center">
                             <ul>
                   
                                <li style="list-style-type:none;float: top;color: cyan"><p>We already have one same SSN employee in database,please write another one</p></li>
                                <li style="list-style-type:none;float: top;">
                                   <button  style="height: 25px;" class="button1" >Go To Previous Page</button>
                                </li>
                            </ul>
                            </div>
                            </form>
                       
                       <%
                           return;
                        }
                       int hourlydef=75;
                       int zipcodedef=10000;
                        
        stmt1.executeUpdate("INSERT INTO EmployeeData(SSN,EPassword,Role,LastName,FirstName,Address,City,State,ZipCode,Telphone,Email,StartDate,HourlyRate) VALUES("
        + "'"+request.getParameter("emp_ssn")+"','12345',"
        + "'"+request.getParameter("emp_role")+"','"+request.getParameter("emp_lastname")+"',"
        + "'"+request.getParameter("emp_firstname")+"','"+request.getParameter("emp_address")+"',"
        + "'"+request.getParameter("emp_city")+"','"+request.getParameter("emp_state")+"',"
                + "'"+zipcodedef+"','"+request.getParameter("emp_telphone")+"',"
                        + "'"+request.getParameter("emp_email")+"','"+currDate+"',"
                                + "'"+hourlydef+"')");
                       
                            %>
                            <form name="manager_add" action="manager_level.jsp" method="post">
                            <div  style="position: absolute;top:40%;left:50%;transform: translate(-50%, -50%);
            text-align: center">
                             <ul>
                   
                                <li style="list-style-type:none;float: top;color: cyan"><p>Add it successfully,and original password is 12345</p></li>
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
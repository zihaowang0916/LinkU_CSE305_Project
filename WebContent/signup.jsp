

<%@page import="java.util.Calendar"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="css/indexStyle.css">
        <title>Welcome Page</title>
    </head>
    <body style="background-image: url('css/be.png')">
       

        
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
            		//out.println("Connected successfully to database using JConnect");
            
            		java.sql.Statement stmt1=conn.createStatement();
            		
                       if(request.getParameter("Ssn").isEmpty() || 
                               request.getParameter("UserId").isEmpty() || 
                               request.getParameter("Password").isEmpty())
                       {
                           %>
                           <form name="signup" action="index.jsp" method="post">
                            <div  style="position: absolute;top:40%;left:50%;transform: translate(-50%, -50%);
            text-align: center">
                             <ul>
                   
                                <li style="list-style-type:none;float: top;color: black"><p>Your SSN number,UserId or Password can not be empty</p></li>
                                <li style="list-style-type:none;float: top;">
                                   <button  style="height: 25px;" class="button1" >Go To Previous Page</button>
                                </li>
                            </ul>
                            </div>
                            </form>
                           <%
                       
                       }
                       
                       java.sql.ResultSet rs = stmt1.executeQuery("select * from CustomerData where UserId='"+request.getParameter("UserId")+"'");
                       
                       if (rs.next()) {
                       %>
                       <form name="signup" action="index.jsp" method="post">
                            <div  style="position: absolute;top:40%;left:50%;transform: translate(-50%, -50%);
            text-align: center">
                             <ul>
                   
                                <li style="list-style-type:none;float: top;color: black"><p>This UserId has been signed up,can you use another one</p></li>
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
                                                                                + "'"+threeDefault+"','"+currDate+"')");
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

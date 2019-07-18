<%@page import="java.util.Calendar"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="css/indexStyle.css">
        <title>Customer added Page</title>
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
//            		out.println("Connected successfully to database using JConnect");
            
            		java.sql.Statement stmt1=conn.createStatement();
                        
                       if(request.getParameter("cus_userid").isEmpty() || 
                               request.getParameter("cus_password").isEmpty()||
                               request.getParameter("cus_ssn").isEmpty())
                       {
                           
                           
                           %>
                           <form name="signup" action="customer_rep_add_result.jsp" method="post">
                            <div  style="position: absolute;top:40%;left:50%;transform: translate(-50%, -50%);
            text-align: center">
                             <ul>
                   
                                <li style="list-style-type:none;float: top;color: cyan"><p>Customer' UserId, SSN and Password Can't Be Empty</p></li>
                                <li style="list-style-type:none;float: top;">
                                   <button  style="height: 25px;" class="button1" >Go To Previous Page</button>
                                </li>
                            </ul>
                            </div>
                            </form>
                           <%
                               return;
                       
                       }
                       java.sql.ResultSet rs = stmt1.executeQuery("select * from CustomerData where SSN='"+request.getParameter("cus_ssn")+"'");
                       
                       if (rs.next()) {
                       %>
                       <form name="signup" action="customer_rep_add_result.jsp" method="post">
                            <div  style="position: absolute;top:40%;left:50%;transform: translate(-50%, -50%);
            text-align: center">
                             <ul>
                   
                                <li style="list-style-type:none;float: top;color: cyan"><p>This SSN has been in our dataBase</p></li>
                                <li style="list-style-type:none;float: top;">
                                   <button  style="height: 25px;" class="button1" >Go To Previous Page</button>
                                </li>
                            </ul>
                            </div>
                            </form>
                       
                       <%
                           return;
                        }
                       int password=Integer.parseInt(request.getParameter("cus_password"));
                       int ratingdef;
                       if(request.getParameter("cus_rating").isEmpty())
                       {
                                ratingdef=1;
                       }
                       else{
                                ratingdef=Integer.parseInt(request.getParameter("cus_rating"));
                        }    
                       int zipcodedef;
                       if(request.getParameter("cus_zipcode").isEmpty())
                       {
                                zipcodedef=10000;
                       }
                       else{
                                zipcodedef=Integer.parseInt(request.getParameter("cus_zipcode"));
                        }
                        String profiledef;
                       if(request.getParameter("cus_profileplacementpriority").isEmpty())
                       {
                                profiledef="User_User";
                       }
                       else{
                                profiledef=request.getParameter("cus_profileplacementpriority");
                        }
                       
                        
        stmt1.executeUpdate("INSERT INTO CustomerData(UserId,SSN,Password,LastName,FirstName,Address,City,State,ZipCode,Telphone,Email,ProfilePlacementPriority,Rating,LastActiveTime) VALUES("
        + "'"+request.getParameter("cus_userid")+"','"+request.getParameter("cus_ssn")+"',"
        + "'"+password+"','"+request.getParameter("cus_lastname")+"',"
        + "'"+request.getParameter("cus_firstname")+"','"+request.getParameter("cus_address")+"',"
        + "'"+request.getParameter("cus_city")+"','"+request.getParameter("cus_state")+"',"
                + "'"+zipcodedef+"','"+request.getParameter("cus_telphone")+"',"
                        + "'"+request.getParameter("cus_email")+"','"+profiledef+"',"
                                + "'"+ratingdef+"','"+currDate+"')");
                       
                            %>
                            <form name="manager_add" action="customer_rep_level.jsp" method="post">
                            <div  style="position: absolute;top:40%;left:50%;transform: translate(-50%, -50%);
            text-align: center">
                             <ul>
                   
                                <li style="list-style-type:none;float: top;color: cyan"><p>Add it successfully</p></li>
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

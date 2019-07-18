<%-- 
    Document   : customer_rep_suggest
    Created on : 2018-4-29, 18:03:35
    Author     : fenglin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="css/indexStyle.css">
        
        <title>Suggestion Page</title>
    </head>
    <body>
        <div>
		<h1>Choose Your Suggested Profile Id</h1>
                <%
                    String mysJDBCDriver = "com.mysql.jdbc.Driver";
                    String mysURL = "jdbc:mysql://127.0.0.1:3306/Mayalu";
		String mysUserID = "root";
		String mysPassword = "8812992";
                    java.sql.Connection conn=null;
                    String userDefault="User-User";
                    int threeDefault=3;
                    
                %>
                <%
                    
                    try 
                    {
                        Class.forName(mysJDBCDriver).newInstance();
    			java.util.Properties sysprops=System.getProperties();
    			sysprops.put("user",mysUserID);
    			sysprops.put("password",mysPassword);
        
				//connect to the database
                        conn=java.sql.DriverManager.getConnection(mysURL,sysprops);
            
            		java.sql.Statement stmt1=conn.createStatement();
                %>
                <table border="1" align="center">
                    <tr align="center">
                        <td>ProfileId</td>
                        <td>Age</td>
                        <td>Gender</td>
                        <td>Hobby</td>
                        <td>Weight</td>
                        <td>Height</td>
                        <td>HairColor</td>
                    </tr>
                
                <%
                  
                    java.sql.ResultSet rs2=stmt1.executeQuery("SELECT * FROM ProfileData WHERE ProfileId = '"+request.getParameter("ProfileId")+"'");
                    
                    String userId;
                    if(rs2.next())
                    {
                        
                    }
                    
                    userId=rs2.getString("UserId");
                    String ProfileIdOne = request.getParameter("ProfileId");
                    %>
                    
                    <%
                    java.sql.ResultSet rs1=stmt1.executeQuery("SELECT * FROM ProfileData,CustomerData WHERE CustomerData.UserID=ProfileData.UserId AND ProfileData.Gender <> (SELECT Gender FROM ProfileData WHERE 	ProfileID='"+request.getParameter("ProfileId")+"') AND ProfileData.ProfileID NOT IN(SELECT Profile2 FROM DateData WHERE Profile1='"+request.getParameter("ProfileId")+"') AND ProfileData.ProfileID NOT IN(SELECT Profile1 FROM DateData WHERE 	Profile2='"+request.getParameter("ProfileId")+"') ORDER BY CustomerData.Rating DESC");
                        while(rs1.next())
                        {
                            if(userId.equals(rs1.getString("UserId")))
                            {
                                
                            }
                            else{
                            %>
                            <tr align="center">
                                <td>
                                    
                                        <a href="customer_rep_suggest_match.jsp?ProfileId=<%=rs1.getString("ProfileId")%>&ProfileIdOne=<%=ProfileIdOne%>">
                                               <% out.println(rs1.getString("ProfileId")); %>
                                            </a>
                                        
                                    
                                </td>
                                <td>
                                    <%
                                        out.println(rs1.getString("Age"));
                                    %>
                                </td>
                                <td>
                                    <%
                                        out.println(rs1.getString("Gender"));
                                    %>
                                </td>
                                <td>
                                    <%
                                        out.println(rs1.getString("Hobby"));
                                    %>
                                </td>
                                <td>
                                    <%
                                        out.println(rs1.getString("Weight"));
                                    %>
                                </td>
                                <td>
                                    <%
                                        out.println(rs1.getString("Height"));
                                    %>
                                </td>
                                <td>
                                    <%
                                        out.println(rs1.getString("HairColor"));
                                    %>
                                </td>
                                
                            </tr>
                
                            <%
                                }
                        }
                        %>
                </table>
                <form name="manage_add" action="customer_rep_level.jsp" method="post">
                <li style="list-style-type:none;margin-top: 10px">
                            <button  style="height: 25px;" class="button1" >Back To Previous Page</button>
                </li>
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

	</div>
    </body>
</html>

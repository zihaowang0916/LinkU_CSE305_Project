<%-- 
    Document   : cusomer_rep_addfee
    Created on : 2018-4-29, 3:05:31
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
                session.setAttribute("Profile1",request.getParameter("Profile1") );
                session.setAttribute("Profile2",request.getParameter("Profile2") );
                session.setAttribute("Time",request.getParameter("Time") );
        %>
        <form name="signup" action="customer_rep_addfee_finish.jsp" method="post">
                            <div  style="position: absolute;top:40%;left:50%;transform: translate(-50%, -50%);
            text-align: center">
                             <ul>
                   
                                <li style="list-style-type:none;float: top;margin-top: 10px"><p>Please Add The Booking Fee You Want</p></li>
                                <li style="list-style-type:none;float: top;margin-top: 10px">
                                    <input type="text" name="cus_bookingfee" placeholder="Booking Fee" style="height: 20px;">
                                </li>
                                <li style="list-style-type:none;float: top;margin-top: 10px">
                                   <button  style="height: 25px;" class="button1" >Submit</button>
                                </li>
                                
                            </ul>
                            </div>
        </form>
    </body>
</html>

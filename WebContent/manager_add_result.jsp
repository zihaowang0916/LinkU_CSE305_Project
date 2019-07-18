<%-- 
    Document   : manager_add_result
    Created on : 2018-4-27, 23:43:04
    Author     : fenglin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="css/indexStyle.css">
        <title>Add new Employee Page</title>
    </head>
    <body>
        <h1>Add New Employee Information</h1>
        <form name="manager_add" action="manager_add_final_result.jsp" method="post">
            <div>
                <ul>
                    <%String manager_ssn = session.getAttribute("finalid").toString();
                    session.setAttribute("finalid",manager_ssn); %>
                    <li style="list-style-type:none;float: top;"><p>Please Add Here</p></li>
  
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
                        <input type="text" name="emp_ssn" placeholder="SSN" style="height: 20px;">
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
    </body>
</html>

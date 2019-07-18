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
        <title>Add new Customer Page</title>
    </head>
    <body>
        <h1>Add New Customer Information</h1>
        <form name="manager_add" action="customer_rep_add_final_result.jsp" method="post">
            <div>
                <ul>
                    
                    <li style="list-style-type:none;float: top;"><p>Please Add Here</p></li>
  
                    <li style="list-style-type:none;float: top;margin-top: 10px">
                        <input type="text" name="cus_firstname" placeholder="FirstName" style="height: 20px;">
                    </li>
                    <li style="list-style-type:none;float:top;margin-top: 10px">
                        <input type="text" name="cus_lastname" placeholder="LastName" style="height: 20px;">
                    </li>
                    <li style="list-style-type:none;float: top;margin-top: 10px">
                        <input type="text" name="cus_userid" placeholder="UserId" style="height: 20px;">
                    </li>
                    <li style="list-style-type:none;float: top;margin-top: 10px">
                        <input type="text" name="cus_password" placeholder="Password" style="height: 20px;">
                    </li>
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
                        <input type="text" name="cus_ssn" placeholder="SSN" style="height: 20px;">
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
                            <button  style="height: 25px;" class="button1" >Add</button>
                    </li>
                    
                  
                      
                </ul>
            </div>
            </form>
    </body>
</html>

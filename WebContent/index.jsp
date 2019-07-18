

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="css/indexStyle.css">
        <title>Welcome Page</title>
    </head>
    <body>
        <div class="header">
            <div class="headerLeft">
                <img src="image/mayalu.png" alt=“Dating” width="200" height="100"/>

            </div>
            <form name="login" action="login.jsp" method="post">
            <div class="headerRight">
                <table cellspacing="5" >
                    <tr>
                        <td>
                            
                            <input type="text" name="firstname" placeholder="UseName" style="height: 20px;">
                            
                        </td>
                        <td>
                            <input type="text" name="Password" placeholder="Password"style="height: 20px;"  >
                        </td>
                        <td>
                            <button  style="height: 25px;" class="button1" >Login</button>
                        </td>
                        
                    </tr>
                        
                    <tr>
                        <td>
                            <input type="radio" name="role" value="Customer"  checked>Customer
                        </td>
                        <td>
                            <input type="radio" name="role" value="cus_rep" >Customer_Representative
                        </td>
                        <td>
                            <input type="radio" name="role" value="Manager" >Manager
                        </td>
                    </tr>
                </table>
                
               
                
            </div>
            </form>
        </div>
        
        
        <div class="middle">
            <div style="border-radius: 10px;width:50%;float: left;text-align: center ">
                <img src="image/lovetree.png" alt="lovetree" width="300" height="420" 
                     style='border-radius: 10px;'/>

            </div>
            <form name="signup" action="signup.jsp" method="post">
            <div class="middleRight" >
                <ul >
                    
                    <li style="list-style-type:none;float: top;"><p>Create a New Account</p></li>
                        
                    
                    <li style="list-style-type:none;float: top">It's free and always will be</li>
                  
                    
                    <li style="list-style-type:none;float: top;margin-top: 10px">
                        <input type="text" name="UserId" placeholder="UserId" style="height: 20px;">
                    </li>
                    <li style="list-style-type:none;float:top;margin-top: 10px">
                        <input type="text" name="Ssn" placeholder="SSN" style="height: 20px;">
                    </li>
                    <li style="list-style-type:none;float: top;margin-top: 10px">
                        <input type="text" name="Password" placeholder="Password" style="height: 20px;">
                    </li>
                    <li style="list-style-type:none;margin-top: 10px">
<!--                            <select id="signup-sex" class="signup-field" name="gender">
                                <option value="">Please Your Gender</option>
				<option value="male">Male</option>
                                <option value="female">Female</option>
                            </select>-->
                        <input type="text" name="Firstname" placeholder="First Name" style="height: 20px;">
                        <input type="text" name="Lastname" placeholder="Last Name" style="height: 20px;">
                    </li>
                    <li style="list-style-type:none;margin-top: 10px">
                        <input type="text" name="Address" placeholder="Address" style="height: 20px;">
                        <input type="text" name="City" placeholder="City" style="height: 20px;">
                    </li>
                    
                    <li style="list-style-type:none;margin-top: 10px">
                        
                        <input type="text" name="State" placeholder="State" style="height: 20px;">
                        <input type="text" name="Zipcode" placeholder="ZipCode" style="height: 20px;">
                    </li>
                    <li style="list-style-type:none;margin-top: 10px">
                        <input type="text" name="Telphone" placeholder="Telphone" style="height: 20px;">
                    </li>
                    <li style="list-style-type:none;margin-top: 10px">
                        <input type="text" name="Email" placeholder="Email" style="height: 20px;">
                    </li>
                    <li style="list-style-type:none;margin-top: 10px">
                            <button  style="height: 25px;" class="button1" >Sign Up</button>
                    </li>
                    
                  
                      
                </ul>
            </div>
            </form>
            
        </div>
          
            
         
    </body>
</html>

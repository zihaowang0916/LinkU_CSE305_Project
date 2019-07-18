<%@ page import="java.sql.ResultSet"%>
<%@ page import="java.sql.SQLException"%>
<%@ page import="java.sql.Statement"%>
<%@ page import="java.sql.Connection"%>
<%@ page import="java.sql.DriverManager"%>

<html>
<head>
<title>Add An New Account</title>
<style>
.buttonContainer {
	text-align: center;
}

.button {
	display: inline-block;
	border-radius: 4px;
	background-color: #f4511e;
	border: none;
	color: #FFFFFF;
	text-align: center;
	font-size: 13px;
	padding: 20px;
	width: 15%;
	transition: all 0.5s;
	cursor: pointer;
	margin: 5px;
}

.button span {
	cursor: pointer;
	display: inline-block;
	position: relative;
	transition: 0.5s;
}

.button span:after {
	content: '\00bb';
	position: absolute;
	opacity: 0;
	top: 0;
	right: -20px;
	transition: 0.5s;
}

.button:hover span {
	padding-right: 25px;
}

.button:hover span:after {
	opacity: 1;
	right: 0;
}
</style>
</head>
<body background="image/heart.png">

	<br>
	<br>
	<br>
	<br>
	<%
	/* String ID;
	if(session.getAttribute("finalid").toString().isEmpty()){
		session.setAttribute("finalid",request.getParameter("ID"));
		ID=request.getParameter("ID");
	}
	else */
	String UserIdd = session.getAttribute("finalid").toString();
	session.setAttribute("finalid",UserIdd);
		String ID=session.getAttribute("finalid").toString(); 
		
	%>
<form name="add_acc" action="user_add_acc_result.jsp" method="post">
            <div align="center" >
                <ul >
                    
                    <li style="list-style-type:none;float: top;"><p>Add a New Payment Account</p></li>
                        
                   <li style="list-style-type:none;float: top;margin-top: 10px">
                        <p>
                        User ID:<% 
                        
                        if(!ID.isEmpty())
                        	out.print(" "+ID);
                        else{
                        	String  userssn = session.getAttribute("finalid").toString(); 
                            out.println(userssn);
                        }
                        	
                        
                        %>
                        </p>
                       
                   </li>
                  
                    
                    <li style="list-style-type:none;float: top;margin-top: 10px">
                        <input type="text" name="CN" placeholder="Credit Card Number" style="height: 20px;">
                    </li>
                    <li style="list-style-type:none;float:top;margin-top: 10px">
                        <input type="text" name="AN" placeholder="Account Number" style="height: 20px;">
                    </li>

					
                    
          <div class="buttonContainer">
				<button class="button" style="vertical-align: middle">
					<span>Confirm</span>
				</button>
		  </div>
                    
                    
                  
                      
                </ul>
            </div>
            </form>
			
		<form name="add_acc1" action="user_login.jsp" method="post">
            <div align="center" >
                <ul >
         
          <div class="buttonContainer">
				<button class="button" style="vertical-align: middle">
					<span>Cancel</span>
				</button>
		  </div>
                    
                    
                  
                      
                </ul>
            </div>
            </form>	





<jsp:include flush="true" page="footer.jsp"></jsp:include>	
</body>
</html>
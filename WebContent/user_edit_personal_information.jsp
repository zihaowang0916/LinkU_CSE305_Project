<%@ page import="java.sql.ResultSet"%>
<%@ page import="java.sql.SQLException"%>
<%@ page import="java.sql.Statement"%>
<%@ page import="java.sql.Connection"%>
<%@ page import="java.sql.DriverManager"%>

<html>
<head>
<title>Edit your personal information</title>
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
	String ID = session.getAttribute("finalid").toString();;
	
	/* if(session.getAttribute("finalid").toString().isEmpty()){
		session.setAttribute("finalid",request.getParameter("ID"));
		ID=request.getParameter("ID");
	}
	else
		ID=session.getAttribute("finalid").toString();  */
	
	
	%>
<form name="add_acc" action="user_edit_pi_result.jsp" method="post">
            <div align="center" >
                <ul >
                    
                    <li style="list-style-type:none;float: top;"><p>Edit your personal information</p></li>
                        
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
                        <input type="text" name="Tel" placeholder="New telephone number" style="height: 20px;">
                    </li>
                    <li style="list-style-type:none;float:top;margin-top: 10px">
                        <input type="text" name="Email" placeholder="New email" style="height: 20px;">
                    </li>
                    <li style="list-style-type:none;float:top;margin-top: 10px">
                        <input type="text" name="Add" placeholder="New address" style="height: 20px;">
                    </li>
                    <li style="list-style-type:none;float:top;margin-top: 10px">
                        <input type="text" name="City" placeholder="New City" style="height: 20px;">
                    </li>
                    <li style="list-style-type:none;float:top;margin-top: 10px">
                        <input type="text" name="State" placeholder="New State" style="height: 20px;">
                    </li>
                    <li style="list-style-type:none;float:top;margin-top: 10px">
                        <input type="text" name="Zip" placeholder="New Zip Code" style="height: 20px;">
                    </li>

					
                    
          <div class="buttonContainer">
				<button class="button" style="vertical-align: middle">
					<span>Confirm</span>
				</button>
		  </div>
                    
                    
                  
                      
                </ul>
            </div>
            </form>
			
		<form name="add_acc1" action="user_login.jsp#acc" method="post">
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
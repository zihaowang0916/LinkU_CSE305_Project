<%@ page import="java.sql.ResultSet"%>
<%@ page import="java.sql.SQLException"%>
<%@ page import="java.sql.Statement"%>
<%@ page import="java.sql.Connection"%>
<%@ page import="java.sql.DriverManager"%>

<html>
<head>
<title>Edit your profile information</title>
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
	String PF;
	String UserIdd = session.getAttribute("finalid").toString();
	session.setAttribute("finalid",UserIdd);
	PF= request.getParameter("PF");
	session.setAttribute("PF",PF);
	/* if(session.getAttribute("finalid").toString().isEmpty()){
		session.setAttribute("finalid",request.getParameter("PF"));
		PF=request.getParameter("PF");
	}
	else
		PF=session.getAttribute("finalid").toString();  */
	%>
<form action="user_edit_pf_result.jsp" method="post">
            <div align="center" >
                <ul >
                    
                    <li style="list-style-type:none;float: top;"><p>Edit your profile</p></li>
                        
                   <li style="list-style-type:none;float: top;margin-top: 10px">
                        <p>
                        Profile ID:<% 
                        
                        if(!PF.isEmpty())
                        	out.print(" "+PF);
                        else{
                        	String  userssn = session.getAttribute("PF").toString(); 
                            out.println(userssn);
                        }
                        	
                        
                        %>
                        </p>
                       
                   </li>
                  
                    
                   
                    <li style="list-style-type:none;float:top;margin-top: 10px">
                        <input type="text" name="pfname" placeholder="New Profile Name" style="height: 20px;">
                    </li>
                    <li style="list-style-type:none;float:top;margin-top: 10px">
                        <input type="text" name="age" placeholder="Age" style="height: 20px;">
                    </li>
                    <li style="list-style-type:none;float:top;margin-top: 10px">
                        <input type="text" name="sage" placeholder="date age start from" style="height: 20px;">
                     
                        <input type="text" name="eage" placeholder="date aga end in" style="height: 20px;">
                    </li>
					<li style="list-style-type:none;float:top;margin-top: 10px">
                        <input type="text" name="geo" placeholder="dating location range" style="height: 20px;">
                    </li>
                    <li>
                    <select name="gender">
      					 <option value="F">Female</option>
       					 <option value="M">Male</option>
					</select>
					</li>
					<li style="list-style-type:none;float:top;margin-top: 10px">
                        <input type="text" name="hobby" placeholder="Hobby" style="height: 20px;">
                    </li>
                    <li style="list-style-type:none;float:top;margin-top: 10px">
                        <input type="text" name="height" placeholder="Height" style="height: 20px;">
                   
                        <input type="text" name="weight" placeholder="Weight" style="height: 20px;">
                    
                        <input type="text" name="hair" placeholder="Hair Color" style="height: 20px;">
                    </li>
                     <li style="list-style-type:none;float:top;margin-top: 10px">
                        <input type="text" name="city" placeholder="Your City" style="height: 20px;">
                    
                        <input type="text" name="state" placeholder="State" style="height: 20px;">
                    </li>

					
                    
          <div class="buttonContainer">
				<button class="button" style="vertical-align: middle">
					<span>Confirm</span>
				</button>
		  </div>
                    
                    
                  
                      
                </ul>
            </div>
            </form>
			
		<form action="user_login.jsp" method="post">
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
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
 <h3 class="title">Welcome To Project Management tool</h3>
<style>
.errorblock {
	color: #ff0000;
	background-color: #ffEEEE;
	border: 3px solid #ff0000;
	padding: 8px;
	margin: 16px;
}
</style>

<script src="<c:url value="/resources/js/jquery-1.10.2.min.js"/>"></script>
<link rel="stylesheet" href="<c:url value="/resources/css/pam.css" />"  type="text/css"/>
<script src="<c:url value="/resources/js/jquery-ui-1.10.3.custom.js"/>"></script>
<link rel="stylesheet" href="<c:url value="/resources/css/jquery-ui.css"/>"/>
<link rel="stylesheet" href="<c:url value="/resources/css/jquery.ui.theme.css"/>"/>
<link rel="stylesheet" href="<c:url value="/resources/css/bootstrap.css"/>"/>
<script src="<c:url value="/resources/js//bootstrap.js"/>"></script>
</head>
<body onload='document.f.j_username.focus();'>
  <hr>
	 <div class="row" id="LoginRow">
	 <c:if test="${not empty error}">
		<div class="errorblock">
			Your login attempt was not successful, try again.<br /> Caused :
			${sessionScope["SPRING_SECURITY_LAST_EXCEPTION"].message}
		</div>
	  </c:if>
	  <div class="span7" id="loginid">
	   <form name='f' action="<c:url value='j_spring_security_check' />"
		method='POST'>
	   <table>
	    <tr><td> Username</td><td><input type="text" id="corpid" placeholder="Enter your Corp ID " name='j_username' value=''/> </td></tr>
	    <tr><td> Password</td><td><input type="password" id="password" placeholder="Enter your password" name='j_password' /> </td></tr>
	    <tr>
		  <td><button type="submit" class="btn btn-medium btn-success">Login<i class="icon-circle-arrow-right"></i></button></td>
			</tr>
		</table>
		</form>
	  </div>
	  
	  <div class="span6" id="toolinfo">
	   <p>
	   The Project Management Tool provides the functionality to add the Projects, Tasks ,Resources allocated to each task by the manager,
	   the user will be able to edit task for which he is working on.
	   The tool also provides the status of each task for a particular project.The tool can be used to generate the report in the form of pdf
	   for a particular project
	   
	   </p>
	  </div>
	 </div>
	 <hr>
	 <div class="footer">
<p>&copy; 2013,Fidelity Investments</p>
</div>
</body>
</html>

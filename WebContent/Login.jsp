<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv=Content-Type content="text/html; charset=ISO-8859-1">
<title>Login</title>
</head>
<body>
<script type="text/javascript">
function LowerCase(x){
	var t = document.getElementById('1').value;
	document.getElementById('1').value = t.toLowerCase();
}
</script>
please login  
	
    <form id="login" name="login" method=post>  
        Email:<input type=text id=1 name=email maxlength=10 required=required onkeyup="LowerCase(this.id)">@stevens.edu<br/>  
        Password:<input type=password name=password required=required><br/>  
        <input type=submit name="btnSubmit" id="btnSubmit" value="Login" onClick="document.login.action = '/MyWeb/LoginCL';" /> 
        <input type=submit name="btnSubmit" id="btnSubmit" value="Activate your account" onClick="document.login.action = '/RegisterServlet';" /> 
    </form>   
    <a href="http://localhost:8080/MyWeb/Register.jsp" target=_self >Register here</a>
</body>
</html>
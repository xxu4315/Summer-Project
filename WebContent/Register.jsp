<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Register</title>
</head>
<script type="text/javascript">
function LowerCase(x){
	var t = document.getElementById('1').value;
	document.getElementById('1').value = t.toLowerCase();
}
function dosubmit(){
	var a = document.getElementById('1').value;
	var b = document.getElementById('2').value;
	var c = document.getElementById('3').value;
	var d = document.getElementById('4').value;
	//alert("dosumit()");
	if(a==""){
		alert("Eamil address couldn't be null!");
		return false;
	}
	if(b==""){
		alert("Username couldn't be null!");
		return false;
	}
	if(c==""){
		alert("password couldn't be null!");
		return false;
	}
	if(d==""){
		alert("password couldn't be null!");
		return false;
	}
	if(c!==d){
		alert("Inconsistency of password!")
		return false;
	}
	//th.action="";
	else{
		document.forms[0].submit();
	}
	
}
</script>
<body>
<script>
var temp = request.getAttribut("error");
document.write(temp);
</script>
<form action=RegisterCL id=0 name=registerform method=post>
		stevens-email:<input type=text id=1 maxlength=20 name=userid onkeyup="LowerCase(this.id)" required=required/><span style=color:red>*</span><br/>  
        username:<input type=text id=2 maxlength=20 name=username required=required><span style=color:red>*</span><br/>  
        password:<input type=password id=3 maxlength=20 name=password required=required><span style=color:red>*</span><br/>
        password again:<input type=password id=4 maxlength=20 name=password required=required><span style=color:red>*</span><br/>  
        <input type=button value=register onclick="dosubmit();"/>  <input type=reset value=reset> 
    </form>  
    <a href="http://localhost:8080/MyWeb/Login.jsp" target=_self >Already have a account? Login in here</a>
</body>
</html>
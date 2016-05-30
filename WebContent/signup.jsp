<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
  <head>
    <title>SignUp</title>
	<link href="http://getbootstrap.com/dist/css/bootstrap.min.css" rel="stylesheet">

    <link href="http://getbootstrap.com/examples/jumbotron-narrow/jumbotron-narrow.css" rel="stylesheet">
    <link href="../static/css/signup.css" rel="stylesheet">
    <link rel="stylesheet" type="text/css" href="assets/css/bootstrap.css">

		<!-- Website CSS style -->
    <link rel="stylesheet" type="text/css" href="assets/css/main.css">

		<!-- Website Font style -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.6.1/css/font-awesome.min.css">
		
		<!-- Google Fonts -->
	<link href='https://fonts.googleapis.com/css?family=Passion+One' rel='stylesheet' type='text/css'>
	<!--<link href='https://fonts.googleapis.com/css?family=Oxygen' rel='stylesheet' type='text/css'>-->


    <script src="../static/js/jquery-1.11.2.js"></script>
    <script src="../static/js/signUp.js"></script>
   
    
   <script type="text/javascript">
		function LowerCase(x){
		var t = document.getElementById('email').value;
		document.getElementById('email').value = t.toLowerCase();
	}
		function LowerCase(x){
			var t = document.getElementById('email').value;
			document.getElementById('email').value = t.toLowerCase();
		}
		function dosubmit(){
			var a = document.getElementById('username').value;
			var b = document.getElementById('email').value;
			var c = document.getElementById('password').value;
			var d = document.getElementById('confirm').value;
			//alert("dosumit()");
			if(a==""){
				alert("Username couldn't be null!");
				return false;
			if(b==""){
				alert("Eamil address couldn't be null!");
				return false;
			}
			
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
				    
				
				document.forms[0].submit();}
			}
			
		
</script>

<script>
var xmlHttp;  
function createXMLHttpRequest()  
{  
 if(window.ActiveXObject)  
 {  
  xmlHttp=new ActiveXObject("Microsoft.XMLHTTP");  
 }  
 else if(window.XMLHttpRequest)  
 {  
  xmlHttp=new XMLHttpRequest();  
 }  
}  
  
function createQueryString()  
{  
 var username=document.getElementById("username").value;  
 var email=document.getElementById("email").value;  
 var password=document.getElementById("password").value;  
    
 var queryString="username=" + username + "&email=" + email + "&password=" + password;  
 return queryString;  
}  
  
function doRequestUsingGET()  
{  
 createXMLHttpRequest();  
 var queryString="./RegisterCL?";  
 queryString=queryString+createQueryString() + "&timeStamp=" + new Date().getTime();  
 xmlHttp.onreadystatechange=handleStateChange;  
 xmlHttp.open("GET",queryString,true);  
 xmlHttp.send(null);  
}  
  
function doRequestUsingPost()  
{ 
 createXMLHttpRequest();  
 var url="./RegisterCL?timeStamp=" + new Date().getTime();  
 var queryString=createQueryString();  
 xmlHttp.open("POST",url,true);  
 xmlHttp.onreadystatechange=handleStateChange;  
 xmlHttp.setRequestHeader("Content-Type","application/x-www-form-urlencoded");  
 xmlHttp.send(queryString);  
}  
  
  
function handleStateChange()  
{  
 if(xmlHttp.readyState==4)  
 {  
  if(xmlHttp.status==200)  
  {  
   parseResults();  
  }  
 }  
}  
  
function parseResults()  
{  
 var responseDiv=document.getElementById("serverResponse");
 var status = xmlHttp.responseText.length;
 var Email = document.getElementById("serverResponse")
 if(responseDiv.hasChildNodes())  
 {  
  responseDiv.removeChild(responseDiv.childNodes[0]);  
 }
 if(status == 1){
	 var Email = document.getElementById('email').value;
	 window.location="/Success.jsp?Email="+Email;
 }
 else{
 var responseText=document.createTextNode(xmlHttp.responseText);  
  alert("ERROR： "+xmlHttp.responseText);  
 responseDiv.appendChild(responseText);  
  }  
}
</script>

<style>
	          .form-group{
	margin-bottom: 15px;
}

label{
	margin-bottom: 15px;
}

input,
input::-webkit-input-placeholder {
    font-size: 11px;
    padding-top: 3px;
}

.main-login{
 	background-color: #fff;
    /* shadows and rounded borders */
    -moz-border-radius: 2px;
    -webkit-border-radius: 2px;
    border-radius: 2px;
    -moz-box-shadow: 0px 2px 2px rgba(0, 0, 0, 0.3);
    -webkit-box-shadow: 0px 2px 2px rgba(0, 0, 0, 0.3);
    box-shadow: 0px 2px 2px rgba(0, 0, 0, 0.3);

}

.main-center{
 	margin-top: 30px;
 	margin: 0 auto;
 	max-width: 330px;
    padding: 40px 40px;

}

.login-button{
	margin-top: 5px;
}

.login-register{
	font-size: 11px;
	text-align: center;
}
	
</style>
  </head>

  <body>
<script>
var temp = request.getAttribute("error");
document.write(temp);
</script>
    <div class="container-fluid">
      <div class="header">
        <nav>
          <ul class="nav nav-pills pull-right">
            <li role="presentation"><a style="color:#A52A2A" target="_blank" href="https://shibboleth.stevens.edu/idp/Authn/UserPassword">MyStevens</a></li>
            <li role="presentation" ><a href="/">Home</a></li>
            <li role="presentation"><a href="/signin.jsp">Sign In</a></li>
            <li role="presentation" class="active"><a href="#">Sign Up</a></li>
          </ul>
        </nav>
        <h3 class="text-muted">Stevens Duck Life</h3>
      </div>

      <div class="jumbotron" style="background-image:url(/static/Uploads/Stevens.jpg)">
        <h1 style="color: white">Join us now</h1>
       <!--<form class="form-signin" action=RegisterCL id=0 name=registerform method="post">
        <label for="inputName" class="sr-only">User name</label>
        <input type="username" name=username id="inputName" maxlength=20 class="form-control" placeholder="Name" required autofocus>
        <label for="inputEmail" class="sr-only">Stevens email address</label>
        <input type="email" name=userid id="inputEmail" maxlength=20 class="form-control" onkeyup="LowerCase(this.id)" placeholder="Email address" required autofocus>
        <label for="inputPassword" class="sr-only">Password</label>
        <input type="password" name=password id="inputPassword" maxlength=20 class="form-control" placeholder="Password" required>
        <label for="inputPasswordAgain" class="sr-only">Password again</label>
        <input type="password" id="inputPasswordAgain" maxlength="20" name="password" required="required" class="form-control" placeholder="Password again">
        <button id="btnSignUp" class="btn btn-lg btn-primary btn-block" type="button" onclick="dosubmit();"">Sign up</button>
      
        <p role="presentation" style="font-size:100%" class="pull-left">Already have an account? <a href="http://localhost:9090/Login.jsp" target=_self><strong>Login in</strong></a> here</p>
        <span><input type="button" onclick="Reset()" value="Reset"></span>
        
    
      </form>-->  
      	<div class="main-login main-center" style="border-radius:9px">
					<form class="form-horizontal" method="post" action="#" id="registerform" name="registerform">
						
						<div class="form-group">
							<label for="name" class="cols-sm-2 control-label">User name</label>
							<div class="cols-sm-10">
								<div class="input-group">
									<span class="input-group-addon"><i class="fa fa-user fa" aria-hidden="true"></i></span>
									<input type="username" class="form-control" name="username" id="username"  placeholder="Enter user name" maxlength=20 required/>
								</div>
							</div>
						</div>

						<div class="form-group">
							<label for="inputEmail" class="cols-sm-2 control-label">Stevens email address</label>
							<div class="cols-sm-10">
								<div class="input-group">
									<span class="input-group-addon"><i class="fa fa-envelope fa" aria-hidden="true"></i></span>
									<input type="email" class="form-control" name="email" id="email" maxlength=20 onkeyup="LowerCase(this.id)" placeholder="@stevens.edu"/>
								</div>
							</div>
						</div>

						<!--<div class="form-group">
							<label for="username" class="cols-sm-2 control-label">Username</label>
							<div class="cols-sm-10">
								<div class="input-group">
									<span class="input-group-addon"><i class="fa fa-users fa" aria-hidden="true"></i></span>
									<input type="text" class="form-control" name="username" id="username"  placeholder="Enter your Username"/>
								</div>
							</div>
						</div>-->

						<div class="form-group">
							<label for="password" class="cols-sm-2 control-label">Password</label>
							<div class="cols-sm-10">
								<div class="input-group">
									<span class="input-group-addon"><i class="fa fa-lock fa-lg" aria-hidden="true"></i></span>
									<input type="password" class="form-control" name="password" id="password"  placeholder="Enter your Password"/>
								</div>
							</div>
						</div>

						<div class="form-group">
							<label for="confirm" class="cols-sm-2 control-label">Confirm Password</label>
							<div class="cols-sm-10">
								<div class="input-group">
									<span class="input-group-addon"><i class="fa fa-lock fa-lg" aria-hidden="true"></i></span>
									<input type="password" class="form-control" name="confirm" id="confirm"  placeholder="Confirm your Password"/>
								</div>
							</div>
						</div>
                        <br>

						<div class="form-group ">
							<button type="button" id="btnSignUp" class="btn btn-primary btn-lg btn-block login-button" value="POST" onclick="doRequestUsingPost();">Register</button>
						</div>
						<div class="login-register">
				            <a href="/signin.jsp">Login</a>
				         </div>
				         <div id="serverResponse"></div> 
					</form>
				</div>    
      </div>

      <script>
      	function Reset() {
    	    document.getElementById("registerform").reset();
      	}
      </script>

      <footer class="footer">
        <p>&copy; Yaoshuai 2016</p>
      </footer>

    </div>
  </body>
</html>


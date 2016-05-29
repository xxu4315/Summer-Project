<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
  <head>
    <title>SignIn</title>

   
    <link href="http://getbootstrap.com/dist/css/bootstrap.min.css" rel="stylesheet">

    <link href="http://getbootstrap.com/examples/jumbotron-narrow/jumbotron-narrow.css" rel="stylesheet">
    <link href="../static/css/signup.css" rel="stylesheet">
    <script src="../static/js/jquery-1.11.2.js"></script>
    <script src="../static/js/signIn.js"></script>
   
  </head>

  <body>
<script type="text/javascript">
function LowerCase(x){
	var t = document.getElementById('inputEmail').value;
	document.getElementById('inputEmail').value = t.toLowerCase();
}
</script>
    <div class="container">
      <div class="header">
        <nav>
          <ul class="nav nav-pills pull-right">
            <li role="presentation"><a style="color:#A52A2A" target="_blank" href="https://shibboleth.stevens.edu/idp/Authn/UserPassword">MyStevens</a></li>
            <li role="presentation" ><a href="/">Home</a></li>
            <li role="presentation" class="active"><a href="#">Sign In</a></li>
            <li role="presentation" ><a href="/signup.jsp">Sign Up</a></li>
          </ul>
        </nav>
        <h3 class="text-muted">Stevens Duck Life</h3>
      </div>

      <div class="jumbotron" style="background-image:url(/static/Uploads/Stevens.jpg)">
        <h1 style="color: white">Welcome back</h1>
        <form class="form-signin" name="login" method="post">
       
        <p style="text-align:center">Please login here</p>
       
        <label for="inputEmail" class="sr-only">Email address</label>
        <input type="email" name=email id=inputEmail maxlength=50 class="form-control" onkeyup="LowerCase(this.id)" placeholder="@stevens.edu" required autofocus>
        <label for="inputPassword" class="sr-only">Password</label>
        <input type="password" name="password" id="inputPassword" class="form-control" placeholder="Password" required>
        
        <button id="btnSignIn" class="btn btn-lg btn-primary btn-block" type="submit" onClick="document.login.action = '/LoginCL';">Sign in</button>
        <br>
        <button type=submit name="btnSubmit" id="btnSubmit" class="btn btn-info" style="font-size:80%" onClick="document.login.action = '/RegisterServlet';"><span style="font-size:100%">Activate your account</span></button>     
    </form>  
      </div>

      

      <footer class="footer">
        <p>&copy; Yaoshuai 2016</p>
      </footer>

    </div>
  </body>
</html>


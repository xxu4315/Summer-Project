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
    <script src="../MyWeb/static/js/signIn.js"></script>
   
  </head>

  <body>
<script type="text/javascript">
function LowerCase(x){
	var t = document.getElementById('1').value;
	document.getElementById('1').value = t.toLowerCase();
}
</script>
    <div class="container-fluid">
      <div class="header">
        <nav>
          <ul class="nav nav-pills pull-right">
            <li role="presentation"><a style="color:#A52A2A" target="_blank" href="https://shibboleth.stevens.edu/idp/Authn/UserPassword">MyStevens</a></li>
            <li role="presentation" ><a href="/MyWeb/">Home</a></li>
            <li role="presentation" class="active"><a href="#">Sign In</a></li>
            <li role="presentation" ><a href="/MyWeb/signup.jsp">Sign Up</a></li>
          </ul>
        </nav>
        <h3 class="text-muted">Stevens Duck Life</h3>
      </div>

      <div class="jumbotron" style="background-image:url(/static/Uploads/Stevens.jpg)">
        <h1 style="color: white">Welcome back</h1>
        <form class="login" name="login" method="post">
        <label for="inputEmail" class="sr-only">Email address</label>
        <input type="email" name=email id=1 maxlength=10 class="form-control" onkeyup="LowerCase(this.id)" placeholder="Email address" required autofocus>
        <label for="inputPassword" class="sr-only">Password</label>
        <input type="password" name="password" id="inputPassword" class="form-control" placeholder="Password" required>
        
        <button id="btnSignIn" class="btn btn-lg btn-primary btn-block" type="submit" onClick="document.login.action = '/MyWeb/LoginCL';">Sign in</button>
        <input type=submit name="btnSubmit" id="btnSubmit" value="Have accout not active? Activate your account" onClick="document.login.action = '/MyWeb/RegisterServlet';" /> 
    </form>  
      </div>

      

      <footer class="footer">
        <p>&copy; Yaoshuai 2016</p>
      </footer>

    </div>
  </body>
</html>


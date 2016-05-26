<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
  <head>
    <title>SignUp</title>

   
    <link href="http://getbootstrap.com/dist/css/bootstrap.min.css" rel="stylesheet">

    <link href="http://getbootstrap.com/examples/jumbotron-narrow/jumbotron-narrow.css" rel="stylesheet">
    <link href="../static/css/signup.css" rel="stylesheet">
    <script src="../static/js/jquery-1.11.2.js"></script>
    <script src="../static/js/signUp.js"></script>
   <script type="text/javascript">
function LowerCase(x){
	var t = document.getElementById('1').value;
	document.getElementById('1').value = t.toLowerCase();
}
</script>

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
            <li role="presentation"><a href="/MyWeb/signin.jsp">Sign In</a></li>
            <li role="presentation" class="active"><a href="#">Sign Up</a></li>
          </ul>
        </nav>
        <h3 class="text-muted">Stevens Duck Life</h3>
      </div>

      <div class="jumbotron" style="background-image:url(/MyWeb/static/Uploads/Stevens.jpg)">
        <h1 style="color: white">Join us now</h1>
        <form class="form-signin" action=RegisterCL id=0 name=registerform method=post>
        <label for="inputName" class="sr-only">Name</label>
        <input type="name" name=username id="inputName" maxlength=20 class="form-control" placeholder="Name" required autofocus>
        <label for="inputEmail" class="sr-only">Email address</label>
        <input type="email" name=userid id="inputEmail" maxlength=20 class="form-control" onkeyup="LowerCase(this.id)" placeholder="Email address" required autofocus>
        <label for="inputPassword" class="sr-only">Password</label>
        <input type="password" name=password id="inputPassword" maxlength=20 class="form-control" placeholder="Password" required>
        
        <button id="btnSignUp" class="btn btn-lg btn-primary btn-block" type="button" onclick="document.forms[0].submit();">Sign up</button>
      </form>	      
      </div>

      

      <footer class="footer">
        <p>&copy; Yaoshuai 2016</p>
      </footer>

    </div>
  </body>
</html>


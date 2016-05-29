<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
  <head>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>HomePage</title>
	<link href="http://getbootstrap.com/dist/css/bootstrap.min.css" rel="stylesheet">
    
    <link href="http://getbootstrap.com/examples/jumbotron-narrow/jumbotron-narrow.css" rel="stylesheet">
    <link rel="icon" type="image/png" href="/static/Uploads/Duck.ico">
    <!--<link rel="stylesheet" href="http://static.parastorage.com/services/santa-editor/1.887.6/cssCache/packages/rEditor/src/main/editor.css" type="text/css">-->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
    <script src="../static/js/jquery-1.11.2.js"></script>
    <script src="../static/js/signIn.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.2/jquery.min.js"></script>
    <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
    <script type="text/javascript">
    	function LowerCase(x){
    		var t = document.getElementById('inputEmail').value;
    		document.getElementById('inputEmail').value = t.toLowerCase();
    	}</script>
    <script type="text/javascript">
    	$(document).ready(function () {
    	    var elements = document.getElementsByTagName("input");
    	    for (var i = 0; i < elements.length; i++) {
    	        elements[i].oninvalid = function (e) {
    	            e.target.setCustomValidity("");
    	            if (!e.target.validity.valid) {
    	                switch (e.srcElement.id) {
    	                    case "inputEmail":
    	                        e.target.setCustomValidity("Email cannot be blank");
    	                        break;
    	                    case "inputPassword":
    	                        e.target.setCustomValidity("Password cannot be blank");
    	                        break;
    	                }
    	            }
    	        };
    	        elements[i].oninput = function (e) {
    	            e.target.setCustomValidity("");
    	        };
    	    }
    	})
    	</script>
    	<script>
// Variable to count number of attempts.
// Below function Executes on click of login button.
function validate(){
var username = document.getElementById("inputEmail").value;
var password = document.getElementById("inputPassword").value;
if ( username != null && password != null){
//alert ("Login successfully");
document.login.action = '/LoginCL'; // Redirecting to other page.
return false;
}
else{
// Decrementing by one.
// Disabling fields after 3 attempts.
document.getElementById("inputEmail").disabled = true;
document.getElementById("inputPassword").disabled = true;
document.getElementById("btnSignIn").disabled = true;
return false;

}
}
    </script>

      <style>
      	#login-dp{
    		min-width: 250px;
    		padding: 14px 14px 0;
    		overflow:hidden;
    		background-color:rgba(255,255,255,.8);
		}
		#login-dp .help-block{
    		font-size:12px    
		}
		#login-dp .bottom{
    		background-color:rgba(255,255,255,.8);
    		border-top:1px solid #ddd;
    		clear:both;
    		padding:14px;
		}
		#login-dp .social-buttons{
    		margin:12px 0    
		}
		#login-dp .social-buttons a{
    		width: 49%;
		}
		#login-dp .form-group {
    		margin-bottom: 10px;
		}
		.btn-fb{
    		color: #fff;
   			background-color:#3b5998;
		}
		.btn-fb:hover{
    		color: #fff;
    		background-color:#496ebc 
		}
		.btn-tw{
    		color: #fff;
    		background-color:#55acee;
		}
		.btn-tw:hover{
    		color: #fff;
    		background-color:#59b5fa;
		}

    	#login-dp .bottom{
        	background-color: inherit;
        	border-top:0 none;
    	}
          .carousel-inner > .item > img,
          .carousel-inner > .item > a > img {
          max-width: 100%;
          max-height: 100%;
          width:auto;
          height: auto;
          margin: auto;
          }
      

          
          img {
              max-width:100%;
              max-height:100%;
              position:relative;             
              display:block;
              border-radius: 9px;
              
          }
          .container-outer {overflow: scroll;}
          .container-inner {}
          .well {
              border-radius: 9px;
          }
          .jumbotron {
              border-radius: 9px;
          }
      </style>
  </head>

  <body>

    <div class="container-fluid">
      <div class="header">
        <nav>
          <ul class="nav nav-pills pull-right">
            <li role="presentation"><a style="color:#A52A2A" target="_blank" href="https://shibboleth.stevens.edu/idp/Authn/UserPassword">MyStevens</a></li>
            
            <li role="presentation" class="active"><a href="#">Home</a></li>
               
            <li role="presentation" class="dropdown nav navbar-nav navbar-right">
          	<a href="#" class="dropdown-toggle" data-toggle="dropdown"><strong><b>Login</b></strong><span class="caret"></span></a>
			<ul id="login-dp" class="dropdown-menu">
				<li>
					 <div class="row">
							<div class="col-md-12">
								Login via
								<div class="social-buttons">
									<a href="#" class="btn btn-fb"><i class="fa fa-facebook"></i> Facebook</a>
									<a href="#" class="btn btn-tw"><i class="fa fa-twitter"></i> Twitter</a>
								</div>
                                or
								 <form class="form-signin" role="form" name="login" method="post" accept-charset="UTF-8" id="login-nav">
										<div class="form-group">
											 <label class="sr-only" for="inputEmail">Email address</label>
											 <input type="email" name="email" class="form-control" id="inputEmail" placeholder="Email address" required>
										</div>
										<div class="form-group">
											 <label class="sr-only" for="inputPassword">Password</label>
											 <input type="password" name="password" class="form-control" id="inputPassword" placeholder="Password" required>
                                             <div class="help-block text-right"><a href="">Forget the password ?</a></div>
										</div>
										<div class="form-group">
											 <button id="btnSignIn" type="submit" class="btn btn-primary btn-block" onclick="validate();">Sign in</button>
										</div>
										<div class="checkbox">
											 <label>
											 <input type="checkbox"> keep me logged-in
											 </label>
										</div>
								 </form>
							</div>
							<div class="bottom text-center">
								New here ? <a href="/signup.jsp"><b>Join Us</b></a>
							</div>
					 </div>
				</li>
			</ul>
        </li>
   
          </ul>
        </nav>
        <h3 style="color:#A52A2A" class="text-muted">Stevens Duck Life</h3>
      </div>

  
      <div class="jumbotron" style="background-image:url(/static/Uploads/Stevens.jpg)">
          <h1 style="color: white">Start your fun here</h1>
          
        <p class="lead"></p>
        <p><a class="btn btn-lg btn-success" href="/signup.jsp" role="button">Sign up today</a></p>
      </div>
      
<div class="container-fluid text-center">
    
  <div class="row">
    <div class="col-sm-6 well">
   <div id="myCarousel" class="carousel slide" data-ride="carousel">
    <!-- Indicators -->
    <ol class="carousel-indicators">
      <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
      <li data-target="#myCarousel" data-slide-to="1"></li>
      <li data-target="#myCarousel" data-slide-to="2"></li>
      <li data-target="#myCarousel" data-slide-to="3"></li>
    </ol>

    <!-- Wrapper for slides -->
    <div class="carousel-inner" role="listbox">

      <div class="item active">
        <img src="/static/Uploads/image.jpg" alt="Chania">
        <div class="carousel-caption">
          <h3>Chania</h3>
          <p>The atmosphere in Chania has a touch of Florence and Venice.</p>
        </div>
      </div>

      <div class="item">
        <img src="/static/Uploads/image2.jpg" alt="Chania">
        <div class="carousel-caption">
          <h3>Chania</h3>
          <p>The atmosphere in Chania has a touch of Florence and Venice.</p>
        </div>
      </div>
    
      <div class="item">
        <img src="/static/Uploads/image3.jpg" alt="Flower">
        <div class="carousel-caption">
          <h3>Flowers</h3>
          <p>Beatiful flowers in Kolymbari, Crete.</p>
        </div>
      </div>

      <div class="item">
        <img src="/static/Uploads/image4.jpg" alt="Flower">
        <div class="carousel-caption">
          <h3>Flowers</h3>
          <p>Beatiful flowers in Kolymbari, Crete.</p>
        </div>
      </div>
  
    </div>

    <!-- Left and right controls -->
    <a class="left carousel-control" href="#myCarousel" role="button" data-slide="prev">
      <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
      <span class="sr-only">Previous</span>
    </a>
    <a class="right carousel-control" href="#myCarousel" role="button" data-slide="next">
      <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
      <span class="sr-only">Next</span>
    </a>
  </div>
</div>
        
    <div class="col-sm-6 well" style="height:auto">
        <h3>Hello!</h3>
        <p>It's me!</p>
    </div>
        </div>
        </div>
<div class="container-fluid text-center">  
    
               
        <div class="row">
            <div class="col-sm-4 col-md-4 well">
                        <img class="img-rounded" alt="100%x200" src="static/Uploads/image.jpg"/>
                <div class="caption">
                    <h3>Did you know?</h3>
                    <p>Hoboken's best apartment.</p>
                </div>
            </div>
            <div class="col-sm-4 col-md-4 well">
                        <img class="img-rounded" alt="100%x200" src="static/Uploads/image3.jpg"/>
                 <div class="caption">
                    <h3>Did you know?</h3>
                    <p>Hoboken's best apartment.</p>
                </div>
            </div>
            <div class="col-sm-4 col-md-4 well">
                        <img class="img-rounded" alt="100%x200" src="static/Uploads/image2.jpg"/>
                 <div class="caption">
                    <h3>Did you know?</h3>
                    <p>Hoboken's best apartment.</p>
                </div>
                        
            </div>
        </div>
    </div>

      <footer class="footer">
        <p>&copy; Yaoshuai 2016</p>
      </footer>
      </div>
      
  </body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>Findhouse</title>
  
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
    <link rel="stylesheet" href="//netdna.bootstrapcdn.com/font-awesome/3.2.1/css/font-awesome.min.css">
    <link href="http://getbootstrap.com/examples/jumbotron-narrow/jumbotron-narrow.css" rel="stylesheet">

    <link href="../static/css/sb-admin-2.css" rel="stylesheet">

    <link href="../font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">
    <script src="../static/js/jquery-1.11.2.js"></script>
    <script type="text/javascript" src="http://ajax.aspnetcdn.com/ajax/jquery.templates/beta1/jquery.tmpl.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>

    <style>
	.btn-file {
    position: relative;
    overflow: hidden;
          }
          .btn-file input[type=file] {
    position: absolute;
    top: 0;
    right: 0;
    min-width: 100%;
    min-height: 100%;
    font-size: 100px;
    text-align: right;
    filter: alpha(opacity=0);
    opacity: 0;
    outline: none;
    background: white;
    cursor: inherit;
    display: block;
}
          body {
    padding-top: 50px;
}
.dropdown.dropdown-lg .dropdown-menu {
    margin-top: -1px;
    padding: 10px 10px;
}

.input-group-btn .btn-group {
    display: flex !important;
}
.btn-group .btn {
    border-radius: 0;
    margin-left: -1px;
}
.btn-group .btn:last-child {
    border-top-right-radius: 4px;
    border-bottom-right-radius: 4px;
}
.btn-group .form-horizontal .btn[type="submit"] {
  border-top-left-radius: 4px;
  border-bottom-left-radius: 4px;
}
.form-horizontal .form-group {
    margin-left: 0;
    margin-right: 0;
}
.form-group .form-control:last-child {
    border-top-left-radius: 4px;
    border-bottom-left-radius: 4px;
}

@media screen and () {
    #adv-search {
        width: auto;
        max-width: 100%;
        margin: 0 auto;
    }
    .dropdown.dropdown-lg {
        position: static !important;
    }
    .dropdown.dropdown-lg .dropdown-menu {
        min-width: 200px;
        width:auto;
        max-width: 100%;
    }
}
	#iframe1 {
		width:600px;
		height:600px;
	}
	#iframe2 {
		width:300px;
		height:600px;
	}
</style>

</head>
<body>
<%
//get userid from previous page
String useremail = request.getParameter("email");
//System.out.println(useremail+"  PH");
if(session.getAttribute(useremail)==null){
//user did not login
response.sendRedirect("signin.jsp");
}
System.out.println(request.getParameter("error"));
if(request.getParameter("error")!=null){
	out.println("<span style=coclor:red>"+request.getParameter("error")+"</span>");
}
%>
<div class="container-fluid">
      <div class="header">
        <nav>
          <ul class="nav nav-pills pull-right">
            <li><a href="#"><span class="glyphicon glyphicon-user"></span> My Account</a></li>
             <li role="presentation"><a style="color:#A52A2A" target="_blank" href="https://shibboleth.stevens.edu/idp/Authn/UserPassword">MyStevens</a></li>
	           <li role="presentation"><a href="/userHome.jsp">Home</a></li>
             <li role="presentation">
                   <div class="dropdown">
  					<button class="btn btn-default dropdown-toggle" style="height:40px" type="button" data-toggle="dropdown">Add Post
  					<span class="caret"></span></button>
  					<ul class="dropdown-menu">
    					<li>
    					<form action="/addWish.jsp" method="post">
    					<input type="hidden" id="hidden 1" name=email value="<%=request.getParameter("Email") %>">
    					<button type="submit" class="btn btn-link">Housing</button>
    					</form>
    					</li>
    					<li><form action="/" method="post">
    					<input type="hidden" id="hidden 1" name=email value="<%=request.getParameter("Email") %>">
    					<button type="submit" class="btn btn-link">Academics</button>
    					</form></li>
    					<li><form action="/" method="post">
    					<input type="hidden" id="hidden 1" name=email value="<%=request.getParameter("Email") %>">
    					<button type="submit" class="btn btn-link">Dining</button>
    					</form></li>
  					</ul>
					</div>
              </li>
        
               
	           
               <li role="presentation" ><a href="/index.jsp">Logout</a></li>
          </ul>
        </nav>
          <h3 class="text-muted">Duck Life</h3>
      </div>
<form action="/FindAllHouseCL"  method="post">
<input type=hidden id=email name=email value="<%=request.getParameter("email") %>">       
<nav class="navbar navbar-default" role="navigation">
  <!-- Brand and toggle get grouped for better mobile display -->
  <div class="navbar-header">
    <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
      <span class="sr-only">Toggle navigation</span>
      <span class="icon-bar"></span>
      <span class="icon-bar"></span>
      <span class="icon-bar"></span>
    </button>
    
  </div>

  <!-- Collect the nav links, forms, and other content for toggling -->
  
    <ul class="nav navbar-nav">
     <li class="dropdown">
        <select class="form-control" id="h_area" name="h_area" style="margin-top:0.2cm">
         <option selected="true" disabled="disabled">Area</option>
  		 <option value="Jersey City">Jersey City</option>
  		 <option value="Union City">Union City</option>
  		 <option value="Hoboken">Hoboken</option>
  		 <option value="Weehawken">Weehawken</option>
  		 <option value="New Port">New Port</option>
         <option value="Jersey City">Other</option>
		 </select>
      </li>
        <li class="dropdown">
        	 <select class="form-control" id="house_type" required="required" style="margin-top:0.2cm" name="housetype">
    <option selected="true" disabled="disabled">House type</option>
  <optgroup label="1Bed">
    <option value="1B/1B">1B/1B</option>
  </optgroup>
  <optgroup label="2Bed">
    <option value="2B/1B">2B/1B</option>
    <option value="2B/1.5B">2B/1.5B</option>
    <option value="2B/2B">2B/2B</option>
  </optgroup>
  <optgroup label="3Bed">
    <option value="3B/1B">3B/1B</option>
    <option value="3B/1.5B">3B/1.5B</option>
    <option value="3B/2B">3B/2B</option>
    <option value="3B/2.5B">3B/2.5B</option>
    <option value="3B/3B">3B/3B</option>
  </optgroup>
  <optgroup label="4Bed">
    <option value="4B/2B">4B/2B</option>
    <option value="4B/2.5B">4B/2.5B</option>
    <option value="4B/3B">4B/3B</option>
  </optgroup>
  <optgroup label="5Bed">
  	<option value="5B/2B">5B/2B</option>
  	<option value="5B/2.5B">5B/2.5B</option>
  	<option value="5B/3B">5B/3B</option>
  	<option value="5B/4B">5B/4B</option>
  	<option value="Other">Other</option>
    </optgroup>
   </select> 
      </li>
        <li class="dropdown">
       <select class="form-control" id="room_type" name="roomtype" style="margin-top:0.2cm" required>
		<option selected="true" disabled="disabled">Room type</option>
		<option value="Bedroom">Bedroom</option>
		<option value="Living room">Living room</option>
		<option value="Other">Other</option>
		</select>
      </li>
      <li class="dropdown">  
       <select class="form-control" id="gender" name="gender" style="margin-top:0.2cm" required>
		<option selected="true" disabled="disabled">Gender</option>
		<option value="male">Male</option>
		<option value="female">Female</option>
		</select>           
      </li>
      </ul>
      <button type="submit" class="btn btn-success" style="margin-top:0.2cm">Search</button>   
    <ul class="nav navbar-nav">
     <li class="dropdown">
      <ul class="dropdown-menu">
      <li>
      <!--<form class="form-group" role="form" name="price" method="post" accept-charset="UTF-8" id="login-nav">
      <div class="form-group">
											 <label class="control-label" for="min">Minimum</label>
											 <input type="text" name="minimum" class="form-control" id="minimum" placeholder="$" style="width:2.0cm" required>
										</div>
										<div class="form-group">
											 <label class="control-label" for="max">Maximum</label>
											 <input type="text" name="maximum" class="form-control" id="maximum" placeholder="$" style="width:2.0cm" required>
                                             
										</div>
										</form>-->
										</li>
										
      </ul>
      </li>
      </ul>
      
      
    
      

   

</nav>
</form>

        <div class="well">
            <iframe id="iframe1"></iframe>
            <iframe id="iframe2"></iframe>
        </div>

	
 <footer class="footer">
                <p>&copy; Yaoshuai 2016</p>
            </footer>
     
      </div>
</body>
</html>
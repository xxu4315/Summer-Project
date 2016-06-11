<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
<jsp:include page="CookieCheck.jsp"/> 
<%
String useremail = request.getParameter("Email");

if(session.getAttribute(useremail)==null || session.getAttribute("email") == null){
//user did not login
response.sendRedirect("signin.jsp");
}else{
%>
<h1> 您登录le！</h1>
<%  
}
%>  


  <head>
    <title>userHome</title>

  
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
    </style>

   
   
  </head>

  <body>

    <div class="container-fluid">
      <div class="header">
        <nav>
          <ul class="nav nav-pills pull-right">
            <li><a href="#"><span class="glyphicon glyphicon-user"></span> My Account</a></li>
             <li role="presentation"><a style="color:#A52A2A" target="_blank" href="https://shibboleth.stevens.edu/idp/Authn/UserPassword">MyStevens</a></li>
	           <li role="presentation"><a href=#>Home</a></li>
                             
	           <li role="presentation">
                   <div class="dropdown">
                    <button class="btn btn-default dropdown-toggle" type="button" data-toggle="dropdown" style="height:40px">Add Post<span class="caret"></span></button>            
                    <ul class="dropdown-menu">
                        <li><form action="/addWish.jsp" method="post"><input type=hidden id="hidden 1" name=email value="<%=request.getParameter("Email") %>"><button type="submit" class="btn btn-link">Housing</button></form></li>
                        <li><form action="/" method="post"><input type=hidden id="hidden 1" name=email value="<%=request.getParameter("Email") %>"><button type="submit" class="btn btn-link">Academics</button></form></li>
                        <li><form action="/" method="post"><input type=hidden id="hidden 1" name=email value="<%=request.getParameter("Email") %>"><button type="submit" class="btn btn-link">Dining</button></form></li>
                    </ul>
                    </div>
              </li>
               <li role="presentation" ><a href="/index">Logout</a></li>
          </ul>
        </nav>
          <h3 class="text-muted">Duck Life</h3>
      </div>
<div class="container-fluid text-center">    
  <div class="row">
    <div class="col-sm-2 well">
      <div class="well">
        <p><a href="#">My Profile</a></p>
        <img src="/static/Uploads/Profile.jpg" class="img-circle" height="65" width="65" alt="Eric">
      </div>
      <div class="well">
       
      </div>
    
    </div>
    <div class="col-sm-8">
            <!-- /.row -->
            <div class="row">
                <div class="col-lg-3 col-md-6">
                    <div class="panel panel-primary">
                        <div class="panel-heading">
                            <div class="row">
                                <div class="col-xs-3">
                                    <i class="fa fa-h-square fa-5x"></i>
                                </div>
                                <div class="col-xs-9 text-right">
                                    <div class="huge">26</div>
                                    <div>New Rentals!</div>
                                </div>
                            </div>
                        </div>
                        
                            <a href=#>              
                            <div class="panel-footer">
                                <span class="pull-left"><button type="button" class="btn btn-link" data-toggle="modal" data-target="#ModalHousing">Housing</button></span>
                                <span class="pull-right"><i class="fa fa-arrow-circle-right"></i></span>
                                <div class="clearfix"></div>
                            </div>
                            <div class="modal fade" id="ModalHousing" role="dialog">
    							<div class="modal-dialog modal-sm">
      								<div class="modal-content">
        								<div class="modal-header">
          									<button type="button" class="close" data-dismiss="modal">&times;</button>
          									<h4 class="modal-title" style="text-align:left">Housing</h4>
        									</div>
        									<div class="modal-body">
        									<form action="/addFindWish.jsp" method="post">                      
                        					<input type=hidden id="hidden 1" name=email value="<%=request.getParameter("Email") %>"> 
          									<button type="submit" class="btn btn-link" style="font-size:150%">Find</button>
          									</form>
          									<form action="/addWish.jsp" method="post">
          									<input type=hidden id="hidden 1" name=email value="<%=request.getParameter("Email") %>">
          									<button type="submit" class="btn btn-link" style="font-size:150%">Post</button>
          									</form>
        									</div>
        									
        								<div class="modal-footer">
         							 <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
        							</div>
      							</div>
    							</div>
  							</div>
                            </a>
                        
                        
                    </div>
                </div>
                <div class="col-lg-3 col-md-6">
                    <div class="panel panel-red">
                        <div class="panel-heading">
                            <div class="row">
                                <div class="col-xs-3">
                                    <i class="fa fa-graduation-cap fa-5x"></i>
                                </div>
                                <div class="col-xs-9 text-right">
                                    <div class="huge">12</div>
                                    <div>New Topics</div>
                                </div>
                            </div>
                        </div>
                        <a href="#">
                            <div class="panel-footer">
                                <span class="pull-left"><button type="submit" class="btn btn-link" style="color:red">Academics</button></span>
                                <span class="pull-right"><i class="fa fa-arrow-circle-right"></i></span>
                                <div class="clearfix"></div>
                            </div>
                        </a>
                    </div>
                </div>
                <div class="col-lg-3 col-md-6">
                    <div class="panel panel-yellow">
                        <div class="panel-heading">
                            <div class="row">
                                <div class="col-xs-3">
                                    <i class="fa fa-cutlery fa-5x"></i>
                                </div>
                                <div class="col-xs-9 text-right">
                                    <div class="huge">124</div>
                                    <div>New Specials!</div>
                                </div>
                            </div>
                        </div>
                        <a href="#">
                            <div class="panel-footer">
                                <span class="pull-left"><button type="submit" class="btn btn-link" style="color:orange">Dining</button></span>
                                <span class="pull-right"><i class="fa fa-arrow-circle-right"></i></span>
                                <div class="clearfix"></div>
                            </div>
                        </a>
                    </div>
                </div>
                <div class="col-lg-3 col-md-6">
                    <div class="panel panel-green">
                        <div class="panel-heading">
                            <div class="row">
                                <div class="col-xs-3">
                                    <i class="fa fa-comments-o fa-5x"></i>
                                </div>
                                <div class="col-xs-9 text-right">
                                    <div class="huge">13</div>
                                    <div>New Messages</div>
                                </div>
                            </div>
                        </div>
                        <a href="#">
                            <div class="panel-footer">
                                <span class="pull-left"><button type="submit" class="btn btn-link" style="color:green">View Details</button></span>
                                <span class="pull-right"><i class="fa fa-arrow-circle-right"></i></span>
                                <div class="clearfix"></div>
                            </div>
                        </a>
                    </div>
                </div>
            </div>
    
     
        
    </div>
    <div class="col-sm-2 well">
     
    </div>
  </div>
</div>

 <footer class="footer">
                <p>&copy; Yaoshuai 2016</p>
            </footer>
     
      </div>
   

  </body>
    
</html>


<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
 <%
String useremail = request.getParameter("email");
//System.out.println(useremail+"  Wel");
if(session.getAttribute(useremail)==null){
//user did not login
response.sendRedirect("signin.jsp");
}
%>
<head>
    <title>Dashboard</title>
 
 
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
 
    <link href="http://getbootstrap.com/examples/jumbotron-narrow/jumbotron-narrow.css" rel="stylesheet">
 
   
 
</head>
 
<body>
 
    <div class="container-fluid">
        <div class="header">
            <nav>
                <ul class="nav nav-pills pull-right">
                    <li role="presentation"><a style="color:#A52A2A" target="_blank" href="https://shibboleth.stevens.edu/idp/Authn/UserPassword">MyStevens</a></li>
                    <li role="presentation" class="active"><a href="/dashboard.jsp">Dashboard</a></li>
                    <li role="presentation"><a href="/userHome.jsp">My List</a></li>
                    <li role="presentation"><a href="/addWish.jsp">Add Post</a></li>
                    <li role="presentation"><a href="/index.jsp">Logout</a></li>
                </ul>
            </nav>
            <h3 class="text-muted">Stevens Duck Life</h3>
        </div>
        </div>
 
                 <form action=addFindWish.jsp method=post >  
                 <input type=hidden id="hidden 1" name=email value="<%=request.getParameter("email") %>">
                 <input type=submit value=Find class="col-sm-4 col-md-6">
                 </form>
                 <form action=addWish.jsp method=post >  
                 <input type=hidden id="hidden 1" name=email value="<%=request.getParameter("email") %>">
                 <input type=submit value=Post class="col-sm-4 col-md-6">
                 </form>
                            
                            <!--<p>
                                <button type="button" class="btn btn-danger btn-sm">
                                    <span class="glyphicon glyphicon-thumbs-up" aria-hidden="true"></span>
                                </button>
                            </p>-->
                    </div>
                </div>
                <!--<div class="col-sm-4 col-md-4">
                    <div class="thumbnail">
                        <img alt="100%x200" src="static/Uploads/bucketList.jpg" data-holder-rendered="true" style="height: 200px; width: 300px; display: block;">
                        <div class="caption">
                            <h3></h3>
                            <p style="font-size:200%">Sell items</p>
                            <!--<p>
                                <button type="button" class="btn btn-danger btn-sm">
                                    <span class="glyphicon glyphicon-thumbs-up" aria-hidden="true"></span>
                                </button>
                            </p>
                        </div>
                    </div>
                </div>-->
 
 
                <!--<div class="row">
                    <div class="col-sm-4 col-md-4">
                        <div class="thumbnail">
                            <img alt="100%x200" src="static/Uploads/bucketList.jpg" data-holder-rendered="true" style="height: 150px; width: 150px; display: block;">
                            <div class="caption">
                                <h3>Bungee Jumping</h3>
                                <p>vehicula ut id elit.</p>
                                <p>
                                    <button type="button" class="btn btn-danger btn-sm">
                                        <span class="glyphicon glyphicon-thumbs-up" aria-hidden="true"></span>
                                    </button>
                                </p>
                            </div>
                        </div>
                    </div>
                    <div class="col-sm-4 col-md-4">
                        <div class="thumbnail">
                            <img alt="100%x200" src="static/Uploads/bucketList.jpg" data-holder-rendered="true" style="height: 150px; width: 150px; display: block;">
                            <div class="caption">
                                <h3>Bungee Jumping</h3>
                                <p>vehicula ut id elit.</p>
                                <p>
                                    <button type="button" class="btn btn-danger btn-sm">
                                        <span class="glyphicon glyphicon-thumbs-up" aria-hidden="true"></span>
                                    </button>
                                </p>
                            </div>
                        </div>
                    </div>
                    <div class="col-sm-4 col-md-4">
                        <div class="thumbnail">
                            <img alt="100%x200" src="static/Uploads/bucketList.jpg" data-holder-rendered="true" style="height: 150px; width: 150px; display: block;">
                            <div class="caption">
                                <h3>Bungee Jumping</h3>
                                <p>vehicula ut id elit.</p>
                                <p>
                                    <button type="button" class="btn btn-danger btn-sm">
                                        <span class="glyphicon glyphicon-thumbs-up" aria-hidden="true"></span>
                                    </button>
                                </p>
                            </div>
                        </div>
                    </div>
                </div>
 
            </div>-->
 
            <footer class="footer">
                <p>&copy; Yaoshuai 2016</p>
            </footer>
            </div>
        </div>
</body>
 
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
  <head>
    <title>Add Post</title>

   
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">

    <link href="http://getbootstrap.com/examples/jumbotron-narrow/jumbotron-narrow.css" rel="stylesheet">
    
    <script src="../static/js/jquery-1.11.2.js"></script>

	<script src="../static/js/jquery.ui.widget.js"></script>
	
	<script type="text/javascript" src="../static/js/jquery.fileupload.js"></script>
	<script type="text/javascript" src="../static/js/jquery.fileupload-process.js"></script>
	<script type="text/javascript" src="../static/js/jquery.fileupload-ui.js"></script>
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
    label {
            color:black
        }
    span.Star {
            font-size:200%;
            color:red;
        }
    </style>
    
   
  </head>

<body>

    <div class="container">
    
      <div class="header">
        <nav>
          <ul class="nav nav-pills pull-right">
              <li role="presentation"><a style="color:#A52A2A" target="_blank" href="https://shibboleth.stevens.edu/idp/Authn/UserPassword">MyStevens</a></li>
	           <li role="presentation"><a href="/MyWeb/userHome.jsp">Home</a></li>
               <li role="presentation"><a href="/MyWeb/dashboard.jsp">Dashboard</a></li>
               <li role="presentation"><a href="/MyWeb/userHome.jsp">My List</a></li>
	           <li role="presentation" class="active"><a href="#">Add Post</a></li>
               <li role="presentation" ><a href="/MyWeb/signin.jsp">Logout</a></li>
          </ul>
        </nav>
        <h3 class="text-muted">Duck Life</h3>
      </div>
     
<form role="form" method="post" action="/MyWeb/addWish.jsp">
<div class="well">
    



<!-- Form Name -->
<legend>Create Your Post</legend>
<form class="form-horizontal" role="form">
<!-- Text input-->
<div class="form-group">
  <label  class="control-label col-md-2" for="txtTitle">Title</label>
  <div class="col-md-9">
      <input type="text" id="title" name="title" maxlength="50" required="required" placeholder="Title" class="form-control input-md">
    </div><span class="Star">*</span>
  </div>
<br>
<div class="form-group">
    <label class="control-label col-md-2" for="Address">Address</label>
    <div class="col-md-9">
        <input placeholder="Address" id="h_location" type="text" name="h_location" maxlength="20" required="required" class="form-control input-md">
        <select name="h_area" style="font-size:200%">
         <option selected="true" disabled="disabled">Select Area</option>
  		 <option value="Jersey City">Jersey City</option>
  		 <option value="Union City">Union City</option>
  		 <option value="Hoboken">Hoboken</option>
  		 <option value="Weehawken">Weehawken</option>
  		 <option value="New Port">New Port</option>
         <option value="Jersey City">Other</option>
		 </select>
        </div><span class="Star">*</span>
    </div> 
<br>
<!-- Textarea -->
<div class="form-group">
  <label class="control-label col-md-2" for="txtPost">House type</label>
    <div class="col-md-9">
    <input required="required" class="form-control" id="txtPost" name="housetype" placeholder="Describe your house">
    <select required="required" style="font-size:200%" name="housetype">
    <option selected="true" disabled="disabled">Select Bed/Bath</option>
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
        </select>
    </div><span class="Star">*</span>
</div>
<br>
<div class="form-group">
  <label class="control-label col-sm-2" for="RoomType">Room type</label>
    <div class="col-sm-9">
    <input class="form-control" id="RoomType" name="roomtype" placeholder="Your room type">
    <select style="font-size:200%" name="roomtype">
         <option selected="true" disabled="disabled">Room type</option>
  		 <option value="bedroom">bedroom</option>
  		 <option value="livingroom">livingroom</option>
         
    </select>
    </div><span class="Star">*</span>
    </div>
    <br>
<div class="form-group">
    <label class="control-label col-sm-2" for="Gender">Gender</label>
    <div class="col-sm-9">
        <select style="font-size:200%" name="sex">
         <option selected="true" disabled="disabled">Select gender</option>
  		 <option value="Male">Male</option>
  		 <option value="Female">Female</option>
  		 <option value="Unlimited">Unlimited</option>
		 </select>
        </div>
        
    </div>
    <br>
    <br>
<div class="form-group">
  <label class="control-label col-sm-2" for="Description">Description</label>
    <div class="col-md-9">
  <textarea class="form-control" rows="5" id="description" placeholder="Describe your house here..."></textarea>
    </div>
</div>
    <legend></legend>
<!--<div class="form-group">
  <label class="control-label col-sm-2" for="txtPost">Photos</label>
                     div class="input-group">
                <span class="input-group-btn">
                    <span class="btn btn-primary btn-file">
                        Browse&hellip; <input type="file" id="fileupload" name="file" multiple>
                    </span>
                </span>
		<div class="pull-right">
            <img  id="imgUpload" style="width: 140px; height: 140px;" class="img-thumbnail"><input type="hidden" name="filePath" id="filePath"></div>
		</div>
    </div>-->



<!--<div class="form-group">
<label>Mark this as private and not visible to others.</label><br/>
<input name="private" type="checkbox"> Mark as Private <span class="glyphicon glyphicon-lock" aria-hidden="true"></span>
</div>

<div class="form-group">
<label>Have you already accomplished this?</label><br/>
<input name="done" type="checkbox"> Mark as Done <span class="glyphicon glyphicon-ok" aria-hidden="true"></span>
</div>-->
<!-- Button -->
    </form>
    </div>
<div class="form-group">
  
    <p class="text-center">
    <input id="singlebutton" name="singlebutton" class="btn btn-primary" type="submit" value="Publish" onclick="window.location.href='/MyWeb/Housing.jsp'"/>
  	</p>
</div>
        </form>
      <footer class="footer">
        <p>&copy; Yaoshuai 2016</p>
      </footer>
    </div>
  </body>
</html>


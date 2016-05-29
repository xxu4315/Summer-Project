<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<!DOCTYPE html>
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
    <script>
        $(function() {
            $('#fileupload').fileupload({
            url: 'upload',
            dataType: 'json',
            add: function(e, data) {
                data.submit();
            },
            success: function(response, status) {
                $('#imgUpload').attr('src','static/Uploads/'+response.filename);
                console.log(response);
            },
            error: function(error) {
                console.log(error);
            }
        });
        })
      </script>
      
    <style>
        .well {
            background-image:url(/static/Uploads/Stevens.jpg);
        }
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
        div {
            max-height:100%;
            max-width:100%;
        }
        span.S_Star {
            font-size:150%;
            color:red;
        }
        select {
           width:200px;
           box-sizing:border-box;
        }
        img {
            max-height: 160px;
            max-width: 160px;
            min-height: 120px;
            min-width: 120px;
            height: auto;
            width: auto;
            margin-bottom: 1.0cm;
        }
    </style>
    
   
  </head>

<body>
    <div class="container">    
      <div class="header">
        <nav>
          <ul class="nav nav-pills pull-right">
              <li role="presentation"><a style="color:#A52A2A" target="_blank" href="https://shibboleth.stevens.edu/idp/Authn/UserPassword">MyStevens</a></li>
	           <li role="presentation"><a href="/userHome.jsp">Home</a></li>
               <li role="presentation"><a href="/dashboard.jsp">Dashboard</a></li>
               <li role="presentation"><a href="/userHome.jsp">My List</a></li>
	           <li role="presentation" class="active"><a href="#">Add Post</a></li>
               <li role="presentation" ><a href="/signin.jsp">Logout</a></li>
          </ul>
        </nav>
        <h3 class="text-muted">Duck Life</h3>
      </div>
     
<div class="well">
<legend>Create Your Post</legend>

<form action="PostHouseCL" class="form-horizontal" role="form" method="post">
<input type=hidden id=email name=email value="<%=request.getParameter("email") %>"> 
<div class="form-group">
  <label  class="control-label col-md-2" for="title">Title</label>
  <div class="col-md-9">
      <input type="text" id="title" name="title" maxlength="50" required autofocus placeholder="Title" class="form-control input-md">
    </div><span class="Star">*</span>
  </div>
<br>

<div class="form-group">
    <label class="control-label col-md-2" for="address">Address</label>
    <div class="col-md-9">
        <input placeholder="Address" id="h_location" type="text" name="h_location" maxlength="20" required autofocus class="form-control input-md">
        <select id="h_area" name="h_area" style="font-size:200%">
         <option selected="true" disabled="disabled">Select Area</option>
  		 <option value="Jersey City">Jersey City</option>
  		 <option value="Union City">Union City</option>
  		 <option value="Hoboken">Hoboken</option>
  		 <option value="Weehawken">Weehawken</option>
  		 <option value="New Port">New Port</option>
         <option value="Jersey City">Other</option>
		 </select><span class="S_Star">*</span>
        </div><span class="Star">*</span>
    </div> 
<br>
<!-- Textarea -->

<div class="form-group">
  <label class="control-label col-md-2" for="housetype">House type</label>
    <div class="col-md-9">
    <select id="house_type" required="required" style="font-size:200%" name="housetype">
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
    <optgroup lable="Other">
        <optipn value="Other type"></optipn>
    </optgroup>
        </select><span class="S_Star">*</span>
    </div><span class="Star">*</span>
</div>
<br>

<div class="form-group">
  <label class="control-label col-sm-2" for="roomType">Room type</label>
    <div class="col-sm-9">
    <select id="room_type" style="font-size:200%" name="roomtype">
         <option selected="true" disabled="disabled">Room type</option>
  		 <option value="bedroom">Bedroom</option>
  		 <option value="livingroom">Livingroom</option>
        <option value="Other">Other</option>
         
    </select><span class="S_Star">*</span>
    </div><span class="Star">*</span>
    </div>
    <br>
<div class="form-group">
    <label class="control-label col-sm-2" for="gender">Your gender</label>
    <div class="col-sm-9">
        <select id="gender" style="font-size:200%" name="gender" required="required">
         <option selected="true" disabled="disabled">Select gender</option>
  		 <option value="Male">Male</option>
  		 <option value="Female">Female</option>
  		 <option value="Other">Other</option>
		 </select><span class="S_Star">*</span>
        </div>
        
    </div>
    <br>
    <br>
    <div class="form-group">
    <label class="control-label col-sm-2" for="gender">Required gender</label>
    <div class="col-sm-9">
        <select id="req_gender" style="font-size:200%" name="req_gender" required="required">
         <option selected="true" disabled="disabled">Required gender</option>
  		 <option value="Male">Male</option>
  		 <option value="Female">Female</option>
  		 <option value="Other">Unlimited</option>
		 </select>
        </div>
        
    </div>
    <br>
    
Your contact information:<br/>
WechatID:<input type="text" id="wechatid" maxlength="20" name="wechatid" required="required" /><br/>
QQ:<input type=text id=QQ maxlength=12 name=qq pattern="[1-9][0-9]{5,}" placeholder="xxx-xxx.xxxx" title="invalid QQ number, please input again" ><br/>
PhoneNumber:<input type=text id=phonenumber maxlength=12 name=phonenumber pattern=".{3}[-].{3}[.].{4}" placeholder="xxx-xxx.xxxx" title="Please input your phone number using correct format as xxx-xxx.xxxx" > eg:xxx-xxx.xxxx<br/>
Price:<input type="number" id="price" min="0" max="999999" name="price"  />$/month <span style=color:red>*</span><br/>
    <br>
<div class="form-group">
  <label class="control-label col-sm-2" for="description">Description</label>
    <div class="col-md-9">
  <textarea class="form-control" rows="5" id="houseinfo" name="houseinfo" placeholder="Describe your house here..."></textarea>
        <br>
        <br>
    </div>
</div>
  <br> 
<br>
<div class="form-group">
  <label class="control-label col-sm-2" for="photos">Photos</label>
    <div class="control-label col-md-2 col-sm-2">
                <span class="input-group-btn">
                    <span class="btn btn-primary btn-file">
                        Browse&hellip; <input type="file" id="fileupload" name="file" multiple>
                    </span>
                </span>
    </div>
                     
    <div class="control-label col-sm-3 col-md-3 pull-right">
        <img id="imgUpload" class="img-thumbnail"><input type="hidden" name="filePath" id="filePath">
        
    </div>
</div>

<!--<div class="form-group">
<label>Mark this as private and not visible to others.</label><br/>
<input name="private" type="checkbox"> Mark as Private <span class="glyphicon glyphicon-lock" aria-hidden="true"></span>
</div>

<div class="form-group">
<label>Have you already accomplished this?</label><br/>
<input name="done" type="checkbox"> Mark as Done <span class="glyphicon glyphicon-ok" aria-hidden="true"></span>
</div>-->
<!-- Button -->

   
  <div class="form-group">
  
    <p class="text-center">
        <button style="font-size:150%" id="publish" name="publish" class="btn btn-primary" type="submit" >Publish</button>
  	</p>
  </div>
</form>
      <footer class="footer">
        <p>&copy; Yaoshuai 2016</p>
      </footer>
    </div>
    <script type="text/javascript">
    
          function validateForm() {
              try{
                  
                var x1 = 
                document.getElementById('title').value;
                var x2 = document.getElementById('h_location').value;
                var e3 = document.getElementById('h_area');
                var x3 = e3.options[e3.selectedIndex].value;
                var s3 = e3.selectedIndex;
                var x4 = document.getElementById('housetype').value;
                var x6 = document.getElementById('roomtype').value;
                var e8 = document.getElementById('gender');
                
                var x8 = e8.options[e8.selectedIndex].value;
                var s8 = e8.selectedIndex;
               /* var e9 = document.getElementById('req_gender');
                var x9 = e9.options[e9.selectedIndex].value;
                var s9 = e9.selectedIndex;*/
            
    
                if (x1 == "" || x2 == "" || x3 == "" || x4 == "" || x6 == "" || x8 == "" || (s3&&s5&&s7&&s8) == 0) {
                  alert("Required fields must be filled out!");
                }
              
                else{
              
                  window.location.href="/Housing.jsp";
                }
              }
              catch(err){
                  alert("Empty field must be filled out!");
              }
          }
      </script>
  </body>
</html>


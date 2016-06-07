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
            
        }
        .well {
        	
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
               
               <li role="presentation"><a href="/userHome.jsp">My DuckLife</a></li>
	           <li role="presentation" class="active"><a href="#">Add Post</a></li>
               <li role="presentation" ><a href="/signin.jsp">Logout</a></li>
          </ul>
        </nav>
        <h3 class="text-muted">Duck Life</h3>
      </div>
  
     
<div class="well">
<legend>Create Your Post</legend>

<form name="form1" class="form-horizontal" role="form" method="post">
<input type=hidden id=email name=email value="<%=request.getParameter("email") %>">

  <fieldset class="form-group">
    <label for="title">Title</label>
    <input type="text" class="form-control" id="title" name="title" placeholder="Title">
    <!--<small class="text-muted">We'll never share your email with anyone else.</small>-->
  </fieldset>
  <fieldset class="form-group">
    <label for="address">Address</label>
    <input type="text" class="form-control" id="h_location" name="h_location" placeholder="Apt No. Street">
  </fieldset>
  <fieldset class="form-group">
  <label for="area">Area</label>
  <div>
  <select class="form-control pull-left" id="h_area" name="h_area" style="width:300px">
         <option selected="true" disabled="disabled">Select Area</option>
  		 <option value="Jersey City">Jersey City</option>
  		 <option value="Union City">Union City</option>
  		 <option value="Hoboken">Hoboken</option>
  		 <option value="Weehawken">Weehawken</option>
  		 <option value="New Port">New Port</option>
         <option value="Jersey City">Other</option>
		 </select>
	</div>
		 <span><input type="number" id="zipcode" name="zipcode" placeholder="ZIP Code"></span>
		 
	</fieldset>
	<fieldset class="form-group">
	<label for="housetype">House Type</label>
    <select class="form-control" id="house_type" required="required" style="width:300px" name="housetype">
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
  <optgroup label="5Bed">
  	<option value="5B/2B">5B/2B</option>
  	<option value="5B/2.5B">5B/2.5B</option>
  	<option value="5B/3B">5B/3B</option>
  	<option value="5B/4B">5B/4B</option>
  	<option value="Other">Other</option>
    </optgroup>
   </select> 
	</fieldset>
	<fieldset class="form-group">
		<label for="roomtype">Room Type</label>
		<select class="form-control" id="room_type" name="roomtype" style="width:300px" required>
		<option selected="true" disabled="disabled">Room Type</option>
		<option value="Bedroom">Bedroom</option>
		<option value="Living room">Living room</option>
		<option value="Other">Other</option>
		</select>
	</fieldset>
	<fieldset class="form-group">
		<label for="sex">Gender</label>
		<select class="form-control" id="sex" name="sex" style="width:300px" required>
		<option selected="true" disabled="disabled">Your Gender</option>
		<option value="Male">Male</option>
		<option value="Female">Female</option>
		</select>
	</fieldset>
	<fieldset class="form-group">
		<label for="req_gender">Required Gender</label>
		<select class="form-control" id="req_gender" name="req_gender" style="width:300px" required>
		<option selected="true" disabled="disabled">Required Gender</option>
		<option value="Male">Male</option>
		<option value="Female">Female</option>
		<option value="unlimited">Unlimited</option>
		</select>
	</fieldset>
  <fieldset class="form-group">
    <label for="houseinfo">House Info</label>
    <textarea class="form-control" id="houseinfo" name="houseinfo" row="5"></textarea>
  </fieldset>
  <fieldset class="form-group">
  	<label for="price">Price</label>
  	<div>
  	<input type="number" class="form-control" id="price" min="0" max="999999" name="price" style="width:200px"/>
  	</div>
  	<span>$/month</span><span style=color:red>*</span><br/>
  </fieldset>
  <fieldset class="form-group">
  <label for="phoneNumber">Your Phone Number</label>
  <input type="text" id="phonenumber" name="phonenumber" class="form-control" maxlength="12" pattern=".{3}[-].{3}[.].{4}" placeholder="xxx-xxx.xxxx" style="width:300px" >
  </fieldset>
  <fieldset class="form-group">
 	<label for="wechatid">WechatID</label>
  <input type="text" id="wechatid" name="wechatid" class="form-control" maxlength="20" style="width:300px" >
  </fieldset>
  <fieldset class="form-group">
 	<label for="QQ">QQ</label>
  <input type="number" id="QQ" name="qq" class="form-control" maxlength="12" style="width:300px" >
  </fieldset>
  

 <fieldset class="form-group">
 	<label for="photos">Photos</label>
 	<span>
 	<div class="pull-right">
 		<img id="imgUpload" class="img-thumbnail"><input type="hidden" name="filePath" id="filePath">
 	</div>
 	</span>
 	<div>
    	<span class="input-group-btn">
        	<span class="btn btn-primary btn-file">
            	Browse&hellip; <input class="pull-left" type="file" id="fileupload" name="file" multiple>
            </span>
        </span>
    </div>
 </fieldset>
  

<fieldset class="form-group">
  
    <p class="text-center">
        <button style="font-size:150%" id="publish" name="publish" class="btn btn-primary" type="submit" onclick="validateForm()">Publish</button>
  	</p>
</fieldset>
        </form>

</div>
      <footer class="footer">
        <p>&copy; Yaoshuai 2016</p>
      </footer>
    </div>
 
    <script type="text/javascript">
    
          function validateForm() {
              try{
                  
                var x1 = document.getElementById('title').value;
                var x2 = document.getElementById('h_location').value;
                var e3 = document.getElementById('h_area');
                var x3 = e3.options[e3.selectedIndex].value;
                var s3 = e3.selectedIndex;
                var e4 = document.getElementById('house_type');
                var x4 = e4.options[e4.selectedIndex].value;
                var s4 = e4.selectedIndex;
                var e6 = document.getElementById('room_type');
                var x6 = e6.options[e6.selectedIndex].value;
                var s6 = e6.selectedIndex;
                var e8 = document.getElementById('sex');                
                var x8 = e8.options[e8.selectedIndex].value;
                var s8 = e8.selectedIndex;
                var x9 = document.getElementById('price').value;                
               /* var e9 = document.getElementById('req_gender');
                var x9 = e9.options[e9.selectedIndex].value;
                var s9 = e9.selectedIndex;*/
            
    
                if (x1 == "" || x2 == "" || x9 == "" || (s3&&s4&&s6&&s8) == 0) {
                  alert("Required fields must be filled out!");
                }
      
              
                else{
             	
              		
                    document.form1.action="/PostHouseCL";
                }
              }
              catch(err){
                  alert("Empty field must be filled out!");
              }
          }
      </script>
  </body>
</html>


    



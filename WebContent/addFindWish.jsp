<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib  uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page import="java.io.*"%>
<%@ page import="java.util.*"%>
<jsp:include page="CookieCheck.jsp"/> 
<%
//get userid from previous page
String useremail = request.getParameter("email");
//System.out.println(useremail+"  PH");
if(session.getAttribute(useremail)==null && session.getAttribute("email") == null){
//user did not login
response.sendRedirect("signin.jsp");
}
if(request.getParameter("error")!=null){
	out.println("<span style=coclor:red>"+request.getParameter("error")+"</span>");
}
%>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Findhouse</title>
  
    <link rel="stylesheet" href="//netdna.bootstrapcdn.com/font-awesome/3.2.1/css/font-awesome.min.css">
    <link href="http://getbootstrap.com/examples/jumbotron-narrow/jumbotron-narrow.css" rel="stylesheet">

    <link href="../static/css/sb-admin-2.css" rel="stylesheet">

    <link href="../font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">
    <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.2/jquery.min.js"></script>
    <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
    <script src="../static/js/jquery-1.11.2.js"></script>
    <script type="text/javascript" src="http://ajax.aspnetcdn.com/ajax/jquery.templates/beta1/jquery.tmpl.js"></script>
    <script type="text/javascript" src="../static/js/jquery.dynatable.js"></script>
    <script src="http://maps.googleapis.com/maps/api/js?key=AIzaSyC9RiLfbcMSmMZr3b2Yum9XHGmXKKw2TOg"></script>
   
    <script>
      document.addEventListener('DOMContentLoaded', function() {
        doRequestUsingPost();  
      }, false);
    </script>
    <script>
    function doAjax() {
    $.ajax({
        type: "POST",
        url: "/FindAllHouseCL",
        data: 'housetype='+document.getElementById("house_type").value+'&sex='+document.getElementById("sex").value
        +'&roomtype='+document.getElementById("room_type").value+'&h_area='+document.getElementById("h_area").value,
        dataType: 'json',
        beforeSend: function(xhr){
            if (xhr.overrideMimeType)
            {
              xhr.overrideMimeType("application/json");
            }
          },
        success: function(msg){
        	console.log(msg);
        	var data = msg.table;
        	 $.each(data, function(i, n){
        		   var row = $("#template").clone();
                   row.find("#OrderID").text(n.id);
                   row.find("#CustomerID").text(n.sex);
                   row.find("#EmployeeID").text(n.housetype);
                   row.find("#OrderDate").text(ChangeDate(n.roomtype));
                   row.attr("id","ready");
                   row.appendTo("#datas");
        	 })
        },
        error: function(msg){
        	alert("error:"+msg.status + ' ' + msg.statusText);
        	console.log(msg);
        //	$('#MyDiv').load('/FindAllHouseCL',document.getElementById("jsonArray").value);
        }
    });
    }
    </script> 
    
  <script>
  function IsValidJSON(test) {
	    try {
	        var obj = JSON.parse(test);
	        if (obj && typeof obj === "object" && obj !== null) {
	            return true;
	        }
	    } catch (e) {

	    }
	    return false;
	}  

var xmlHttp;  
function createXMLHttpRequest()  
{  
	
 if(window.ActiveXObject)  
 {  
  xmlHttp=new ActiveXObject("Microsoft.XMLHTTP");  
 }  
 else if(window.XMLHttpRequest)  
 {  
  xmlHttp=new XMLHttpRequest();  
 }  
}  
  
function createQueryString()  
{  
 var housetype=document.getElementById("house_type").value;  
 var h_area=document.getElementById("h_area").value;  
 var roomtype=document.getElementById("room_type").value; 
 var sex=document.getElementById("sex").value;  
 var queryString="housetype=" + housetype + "&h_area=" + h_area + "&roomtype=" + roomtype + "&sex=" + sex ;  
 return queryString;  
}  
  
function doRequestUsingGET()  
{  
 createXMLHttpRequest();  
 var queryString="./FindAllHouseCL?";  
 queryString=queryString+createQueryString() + "&timeStamp=" + new Date().getTime();  
 xmlHttp.onreadystatechange=handleStateChange;  
 xmlHttp.open("GET",queryString,true);  
 xmlHttp.send(null);  
}  
  
function doRequestUsingPost()  
{ 
 $('#demo').empty();
 createXMLHttpRequest();  
 var url="./FindAllHouseCL?timeStamp=" + new Date().getTime();  
 var queryString=createQueryString();  
 xmlHttp.open("POST",url,true);  
 xmlHttp.onreadystatechange=handleStateChange;  
 xmlHttp.setRequestHeader("Content-Type","application/x-www-form-urlencoded");  
 xmlHttp.send(queryString);  
}  

  
  
function handleStateChange()  
{  
 if(xmlHttp.readyState==4)  
 {  
  if(xmlHttp.status==200)  
  {  
   parseResults(); 

  }  
 }  
}  
  
function parseResults()  
{  

	var text = '{"housing":'+xmlHttp.responseText.toString()+"}";

	var response = JSON.parse(text);
	var Info = [];
	var address = [];
	//var image = "/static/Uploads/image2";
	
	for (var x in response.housing)
	{
	//image.push(response.housing[x].uimgpath);
	Info.push('<div id="image">'+'<div class="list-group-item list-group-item-info" style="border-radius:6px">'+"<strong>"+"$"+" "+response.housing[x].price + "</strong>" +"</div>"+"<br>"+'<p style="margin-left:20px">'+response.housing[x].title +'<img id="image" style="text-aligh:right; width:80px; height:80px" class="pull-right">'+"<br>" + response.housing[x].h_area
	+"<br>" + response.housing[x].housetype+"<br>" + response.housing[x].roomtype+"<br>" + response.housing[x].h_location
	+"<br>" + response.housing[x].sex+"<br>" + response.housing[x].phonenumber+"<br>"+ response.housing[x].id
	+"<br>" + response.housing[x].houseinfo +"</p>"+"</div>");
  //if (image[x] != null){
  //$("#image").attr("src", image);}
	address.push(response.housing[x].h_location+" "+response.housing[x].h_area+","+"NJ");
	
	}
	Info.reverse();
	address.reverse();


	var Results ='<div>'+'<div class="list-group-item list-group-item-success" style="border-radius:6px">'+"<strong>"+"Rental Listings"+'</strong>'+'<span class="pull-right">'+Info.length+" "+"results"+'</span>'+'</div>'+'</div>'+'<br>';

	for (i=0; i<Info.length; i++){
		//frameCon += Info[i];
    Results += Info[i];

	}
	document.getElementById("Results").innerHTML = Results;

	var map = new google.maps.Map(document.getElementById('map'), {
        zoom: 14,
        center: {lat: -34.397, lng: 150.644}
	});
  google.maps.event.addDomListener(window, "resize", function() {
    
     google.maps.event.trigger(map, "resize");
  
    });
	var geocoder = new google.maps.Geocoder();
	var infowindow = new google.maps.InfoWindow({  	    
    	  	maxWidth: 350,
    	  	maxHeight: 250    	  	
        });
	geocoder.geocode({'address':"1"+" "+"Castle"+" "+"Point"+" "+"Terrace"+","+" "+"Hoboken"+" "+"NJ"}, function(results, status) {
        if (status === google.maps.GeocoderStatus.OK) {
          map.setCenter(results[0].geometry.location);       
        } else {
          alert('Geocode was not successful for the following reason: ' + status);
        }
      });
	for (var e=0; e<Info.length; e++)
		{		
		(function (e) {
			geocoder.geocode({'address': address[e]}, function(results, status) {
	        if (status === google.maps.GeocoderStatus.OK) {
	        	
	          //map.setCenter(results[0].geometry.location);
	          	marker = new google.maps.Marker({
	            map: map,
	            position: results[0].geometry.location,
	            dataId:e
	            
	          });
	          
	          
	            google.maps.event.addListener(marker,'click', function() {
	            	infowindow.close();
	            	infowindow.setContent('<div id="iw-container">'+'<div class="iw-content">'+'<div class="iw-subTtile"></div>'+'<p>'+Info[e]+'</p>'+'<div class="iw-subTtile">Contacts</div>'+'<p>'+'<br>Phone. +551 254 4727<br>E-mail:yzhan65@stevens.edu<br>'+'</p>'+'</div>'+'<div class="iw-bottom-gradiant"></div>'+'</div>');
	          	   	infowindow.open(map, this);
	          	   console.log(e);
	            });
            
	        }
	      });
		}).call(this, e);
  }
  	
}
</script>
<script type="text/javascript">
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
          body {
    padding-top:10px;
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
	
	#ResultContainer {
		width:40%;
    height:90%;
		max-height:500px;
    margin-right:15px;
    margin-left: 15px;
    overflow-y:scroll;
    position:relative;
	}
  #Results {
    width:100%
    height: 100%
    min-height: 200px;
    min-width: 100px;
    margin-left: 40px;
    position:absolute;
  }
	
	#map {
    width:100%;
    height:100%;
    max-height: 500px;
    min-width: 120px;
    min-height: 100px;
    border-radius: 6px;
    position: absolute;
	}
  #map_container {
    height:90%;
    width:55%;
    position:relative;
  }
  #image {

  }

  li {
    padding:5px;
    margin-top: 0;
    
  }

  
  body, html {
  height: 100%;
}

  div#content {
    height: 100%;
}
  #footer {
    height:auto;
    width:auto;
    position:relative;
  }
  #iw-container {
	margin-bottom: 10px;
}
#iw-container .iw-content {
	font-size: 13px;
	line-height: 18px;
	font-weight: 200;
	margin-right: 1px;
	padding: 15px 5px 20px 15px;
	max-height: 140px;
	overflow-y: auto;
	overflow-x: hidden;
}
.iw-subTitle {
	font-size: 16px;
	font-weight: 700;
	padding: 5px 0;
}
   
</style>

</head>
<body>

<div class="container-fluid" style="height:100%; margin-top:5px">
      <div class="header" style="margin-top:5px">
        <nav style="height:40%; margin-top:5px; margin-bottom:5px">
          <ul class="nav nav-pills pull-right">
            <li style="margin-left:0"><a href="#"><span class="glyphicon glyphicon-user"></span> My Account</a></li>
             <li role="presentation" style="margin-left:0"><a style="color:#A52A2A" target="_blank" href="https://shibboleth.stevens.edu/idp/Authn/UserPassword">MyStevens</a></li>
	           <li role="presentation" style="margin-left:0"><a href="/userHome.jsp" >Home</a></li>
             <!--<li role="presentation" style="margin-left:0">
                   <div class="dropdown">
  					<button class="btn btn-default dropdown-toggle" style="height:40px" type="button" data-toggle="dropdown">Add Post
  					<span class="caret"></span></button>
  					<ul class="dropdown-menu pull-left">
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
              </li>-->
        
               
	           
               <li role="presentation" style="margin-left:0"><a href="/index.jsp">Logout</a></li>
          </ul>
        </nav>
          <h3 style="color:brown">Duckmates</h3>
      </div>
<form  method="post" action="#" id="searchform" name="searchform">
<input type=hidden id=email name=email value="<%=request.getParameter("email") %>">       
<nav class="navbar navbar-inverse" role="navigation" style="margin-top:5px; height:75%">
  <!-- Brand and toggle get grouped for better mobile display -->
  <div class="navbar-header">
    <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
      <span class="icon-bar"></span>
      <span class="icon-bar"></span>
      <span class="icon-bar"></span>
    </button>
    <a class="navbar-brand" href="#">Explore</a>
  </div>

  <!-- Collect the nav links, forms, and other content for toggling -->
  <div class="collapse navbar-collapse" id="myNavbar" style="border-radius:6px">
    <ul class="nav navbar-nav">
     <li class="dropdown">
        <select class="form-control" id="h_area" name="h_area" style="margin-top: 5px" onchange="doRequestUsingPost()">
         <option selected="true" value="'Jersey City' OR h_area='Union City' OR h_area='Hoboken' OR h_area='Weehawken' OR h_area='New Port' OR h_area='Other'">Area</option>
         
  		 <option value="'Jersey City'">Jersey City</option>
  		 <option value="'Union City'">Union City</option>
  		 <option value="'Hoboken'">Hoboken</option>
  		 <option value="'Weehawken'">Weehawken</option>
  		 <option value="'New Port'">New Port</option>
         <option value="'Other'">Other</option>
		 </select>
      </li>
        <li class="dropdown">
        	 <select class="form-control" id="house_type" required="required" style="margin-top:5px" name="housetype" onchange="doRequestUsingPost()">
    <option selected="true" value="'1B/1B' OR housetype = '2B/1B' OR housetype = '2B/1.5B' OR housetype = '2B/2B' OR housetype = '3B/1B'
    OR housetype = '3B/1.5B' OR housetype = '3B/2B' OR housetype = '3B/2.5B' OR housetype = '3B/3B' OR housetype = '4B/2B'
    OR housetype = '4B/2.5B' OR housetype = '4B/3B' OR housetype = '5B/2B' OR housetype = '5B/2.5B' OR housetype = '5B/3B'
    OR housetype = '5B/4B' OR housetype = 'Other'">House type</option>

  <optgroup label="1Bed">
    <option value="'1B/1B'">1B/1B</option>
  </optgroup>
  <optgroup label="2Bed">
    <option value="'2B/1B'">2B/1B</option>
    <option value="'2B/1.5B'">2B/1.5B</option>
    <option value="'2B/2B'">2B/2B</option>
  </optgroup>
  <optgroup label="3Bed">
    <option value="'3B/1B'">3B/1B</option>
    <option value="'3B/1.5B'">3B/1.5B</option>
    <option value="'3B/2B'">3B/2B</option>
    <option value="'3B/2.5B'">3B/2.5B</option>
    <option value="'3B/3B'">3B/3B</option>
  </optgroup>
  <optgroup label="4Bed">
    <option value="'4B/2B'">4B/2B</option>
    <option value="'4B/2.5B'">4B/2.5B</option>
    <option value="'4B/3B'">4B/3B</option>
  </optgroup>
  <optgroup label="5Bed">
  	<option value="'5B/2B'">5B/2B</option>
  	<option value="'5B/2.5B'">5B/2.5B</option>
  	<option value="'5B/3B'">5B/3B</option>
  	<option value="'5B/4B'">5B/4B</option>
  	<option value="'Other'">Other</option>
    </optgroup>
   </select> 
      </li>
        <li class="dropdown">
       <select class="form-control" id="room_type" name="roomtype" style="margin-top:5px" required="required" onchange="doRequestUsingPost()">
		<option selected="true" value="'Bedroom' OR roomtype='Living room' OR roomtype='Other'">Room type</option>
		
		<option value="'Bedroom'">Bedroom</option>
		<option value="'Living room'">Living room</option>
		<option value="'Other'">Other</option>
		</select>
      </li>
      <li class="dropdown">  
       <select class="form-control" id="sex" name="sex" style="margin-top:5px" required onchange="doRequestUsingPost()">
		<option selected="true" value="'Male' OR sex='Female'">Gender</option>
		
		<option value="'Male'">Male</option>
		<option value="'Female'">Female</option>
		</select>           
      </li>
      <li>
     <!--   <button type="submit" class="btn btn-success" style="margin-top:0.2cm">Search</button> onclick="doRequestUsingPost();" doAjax();-->
	<button type="button" id="btnSelect" class="btn btn-success" style="margin-top:5px"  value="POST"  onclick="doRequestUsingPost();">Search</button>
    </li>
    </ul>
    <ul class="nav navbar-nav navbar-right">
    <li></li>
    <li></li>
    </ul>
    </div>
</nav>
</form>

<div class="container-fluid" style="height:100%">

	<div class="col-sm-8 col-md-8" id="map_container">
   <div id="map"> </div>
  </div>
  
	<div class="col-sm-4-col-md-4" id="ResultContainer">
  <div id="Results"></div>
  <!--<iframe frameborder="0" id="Results" name="Results">
	</iframe>-->
	</div>
  </div>


<!--<div id="footer">	
 <footer class="footer">
                <p>&copy; Yaoshuai 2016</p>
            </footer>
            </div>
      </div>-->
      
      
</body>
</html>
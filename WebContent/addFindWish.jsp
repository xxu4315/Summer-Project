<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib  uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Findhouse</title>
  
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
    <link rel="stylesheet" href="//netdna.bootstrapcdn.com/font-awesome/3.2.1/css/font-awesome.min.css">
    <link href="http://getbootstrap.com/examples/jumbotron-narrow/jumbotron-narrow.css" rel="stylesheet">

    <link href="../static/css/sb-admin-2.css" rel="stylesheet">

    <link href="../font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">
    <script src="../static/js/jquery-1.11.2.js"></script>
    <script type="text/javascript" src="http://ajax.aspnetcdn.com/ajax/jquery.templates/beta1/jquery.tmpl.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
    <script type="text/javascript" src="../static/js/jquery.dynatable.js"></script>
    <script src="http://maps.googleapis.com/maps/api/js"></script> 
   
    <script>
    function initialize() {
    	  var map = new google.maps.Map(document.getElementById('map'), {
    	    center: {lat: -34.397, lng: 150.644},
    	    zoom: 15
    	  });
    	  

    	  // Try HTML5 geolocation.
    	  if (navigator.geolocation) {
    	    navigator.geolocation.getCurrentPosition(function(position) {
    	      var pos = {
    	        lat: position.coords.latitude,
    	        lng: position.coords.longitude
    	      };
    	      var marker=new google.maps.Marker({
    	    	  position:pos,    	      	
    	    	  });
    	    	marker.setMap(map); 
    	      var infowindow = new google.maps.InfoWindow({
    	      	content:"Your location!"});
    	      map.setCenter(pos);
    	    }, function() {
    	      handleLocationError(true, infoWindow, map.getCenter());
    	    });
    	  } else {
    	    // Browser doesn't support Geolocation
    	    handleLocationError(false, infoWindow, map.getCenter());
    	  }
    	}

    	function handleLocationError(browserHasGeolocation, infoWindow, pos) {
    	  infoWindow.setPosition(pos);
    	  infoWindow.setContent(browserHasGeolocation ?
    	                        'Error: The Geolocation service failed.' :
    	                        'Error: Your browser doesn\'t support geolocation.');
    	}
    	google.maps.event.addDomListener(window, 'load', initialize);
    
  
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

	/*var text = '{"employees":[' +
	'{"firstName":"John","lastName":"Doe" },' +
	'{"firstName":"Anna","lastName":"Smith" },' +
	'{"firstName":"Peter","lastName":"Jones" }]}';*/
	var response = JSON.parse(text);
	var x;
	var i;
	var Info = [];
	var address = [];
	var frameCon = "";
	
	for (x in response.housing)
	{
	
	Info.push(response.housing[x].title + "<br>" + response.housing[x].housetype +"<br>" + response.housing[x].roomtype
	+"<br>" + response.housing[x].houseinfo+"<br>" + response.housing[x].sex+"<br>" + response.housing[x].phonenumber
	+"<br>" + "$" + response.housing[x].price+"<br>" + response.housing[x].h_location+"<br>"+ response.housing[x].id
	+"<br>" + response.housing[x].h_area +"<br>"+"--------------------------------"+"<br>");
	address.push(response.housing[x].h_location+" "+response.housing[x].h_area+","+"NJ");
	}
	Info.reverse();
	address.reverse();
	
	var frame = document.getElementById("frame02"),
	frameDoc = frame.contentDocument || frame.contentWindow.document;
	for (i=0; i<Info.length; i++){
		frameCon += Info[i];
	}
	
		
	frameDoc.documentElement.innerHTML = frameCon;
	var map = new google.maps.Map(document.getElementById('map'), {
        zoom: 15,
        center: {lat: -34.397, lng: 150.644}
	});
	var geocoder = new google.maps.Geocoder();
	
	var j;
	var contentString = [];
	for (j=0; j<Info.length; j++){
		contentString.push('<div class="container" style="border-radius:9px">'+'<div class="well">'+Info[j]+'</div>'+'</div>');
	}

	 var infowindow = null;
	 infowindow = new google.maps.InfoWindow({
    	    //content: contentString,
    	  	maxWidth: 250,
    	  	maxHeight: 250,     	  	
        });
	geocoder.geocode({'address': address[0]}, function(results, status) {
        if (status === google.maps.GeocoderStatus.OK) {
          map.setCenter(results[0].geometry.location);
         /* marker = new google.maps.Marker({
            map: map,
            position: results[0].geometry.location
          });
         
          
          google.maps.event.addListener(marker,'click', function() {
        	  infowindow.setContent(contentString[0]);
              infowindow.open(map,this);
        	  
        	  
          });*/
        } else {
          alert('Geocode was not successful for the following reason: ' + status);
        }
      });
	
      //infoWindow.setPosition(pos);
      //google.maps.event.addListener(marker, 'click', function() {
  	  	//infowindow.open(map,marker);
  	  	//});
    
   
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
	            	infowindow.setContent('<div class="container" style="border-radius:9px">'+'<div class="well">'+Info[e]+'</div>'+'</div>');
	          	   	infowindow.open(map, this);
	          	   console.log(e);
	            });
	        }
	      });
		}).call(this, e);
		
		}

}
function myFunction(response) {
	alert(typeof (response));
    var arr = response;
    var i;
    var out = "<table>";

    for(i = 0; i < arr.length; i++) {
        out += "<tr><td>" +
        arr[i].sex +
        "</td><td>" +
        arr[i].housetype +
        "</td><td>" +
        arr[i].roomtype +
        "</td></tr>";
    }
    out += "</table>";
    document.getElementById("id01").innerHTML = out;
}

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
	#frame01 {
		width:600px;
		height:500px;
	}
	#frame02 {
		width:300px;
		height:500px;
	}
	iframe {
		
		border:"0";
	}
	#map {
	height:500px;
	width:600px;
	background-color: #CCC;
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
<form  method="post" action="#" id="searchform" name="searchform">
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
         <option value="'Jersey City' OR h_area='Union City' OR h_area='Hoboken' OR h_area='Weehawken'
         OR h_area='New Port' OR h_area='Other'">All</option>
  		 <option value="'Jersey City'">Jersey City</option>
  		 <option value="'Union City'">Union City</option>
  		 <option value="'Hoboken'">Hoboken</option>
  		 <option value="'Weehawken'">Weehawken</option>
  		 <option value="'New Port'">New Port</option>
         <option value="'Other'">Other</option>
		 </select>
      </li>
        <li class="dropdown">
        	 <select class="form-control" id="house_type" required="required" style="margin-top:0.2cm" name="housetype">
    <option selected="true" disabled="disabled">House type</option>
  <optgroup label="All">
    <option value="'1B/1B' OR housetype = '2B/1B' OR housetype = '2B/1.5B' OR housetype = '2B/2B' OR housetype = '3B/1B'
    OR housetype = '3B/1.5B' OR housetype = '3B/2B' OR housetype = '3B/2.5B' OR housetype = '3B/3B' OR housetype = '4B/2B'
    OR housetype = '4B/2.5B' OR housetype = '4B/3B' OR housetype = '5B/2B' OR housetype = '5B/2.5B' OR housetype = '5B/3B'
    OR housetype = '5B/4B' OR housetype = 'Other'">All</option>
  </optgroup>  
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
       <select class="form-control" id="room_type" name="roomtype" style="margin-top:0.2cm" required>
		<option selected="true" disabled="disabled">Room type</option>
		<option value="'Bedroom' OR roomtype='Living room' OR roomtype='Other'">All</option>
		<option value="'Bedroom'">Bedroom</option>
		<option value="'Living room'">Living room</option>
		<option value="'Other'">Other</option>
		</select>
      </li>
      <li class="dropdown">  
       <select class="form-control" id="sex" name="sex" style="margin-top:0.2cm" required>
		<option selected="true" disabled="disabled">Gender</option>
		<option value="'Male' OR sex='Female'">All</option>
		<option value="'Male'">Male</option>
		<option value="'Female'">Female</option>
		</select>           
      </li>
      </ul>
     <!--   <button type="submit" class="btn btn-success" style="margin-top:0.2cm">Search</button> onclick="doRequestUsingPost();" doAjax();-->
	<button type="button" id="btnSelect" class="btn btn-success" style="margin-top:0.2cm"  value="POST"  onclick="doRequestUsingPost();">Search</button>
    <ul class="nav navbar-nav">
     <li class="dropdown">
      <ul class="dropdown-menu">
      <li>
     
	 </li>
										
      </ul>
      </li>
      </ul>
</nav>

<div class="well">
	<div class="row">
	<div class="col-sm-6 col-md-6" id="map" height="500px" width="600px">
	</div>
	<div class="col-sm-3-col-md-3">
	<!--<iframe frameborder="0" id="frame01" name="frame01" src="https://www.google.com/maps/embed/v1/search?key=AIzaSyA7nNdnh5sv5jtdj2mYq9XSicBMqM_OpGE &q=1102+Garden+Street,Hoboken,New+Jersey"></iframe>-->
	<iframe frameborder="0" id="frame02" name="frame02"></iframe>
	</div>
	</div>
</div>
</form>
	
 <footer class="footer">
                <p>&copy; Yaoshuai 2016</p>
            </footer>
      </div>
      
      
</body>
</html>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Post House</title>
</head>
<body>
<%
//get userid from previous page
String useremail = request.getParameter("email");
//System.out.println(useremail+"  PH");
if(session.getAttribute(useremail)==null){
//user did not login
response.sendRedirect("Login.jsp");
}
System.out.println(request.getParameter("error"));
if(request.getParameter("error")!=null){
	out.println("<span style=coclor:red>"+request.getParameter("error")+"</span>");
}
%>
<p>Please fill the form below so as to post your house information:</p>
<form action="PostHouseCL"  method="post">
	<input type=hidden id=email name=email value="<%=request.getParameter("email") %>"> 
Title:<input type=text id=title name=title maxlength=50 required=required><span style=color:red>*</span><br/> 	
<!-- House Location -->
Address:<input type="text" id=h_location name="h_location" maxlength="20" required="required"><span style=color:red>*</span>
<!-- House Area -->
<select name="h_area">
  		 <option value="Jersey City">Jersey City</option>
  		 <option value="Union City">Union City</option>
  		 <option value="Hoboken">Hoboken</option>
  		 <option value="Weehawken">Weehawken</option>
  		 <option value="New Port">New Port</option>
		 </select><span style=color:red>*</span><br/>
Housetype:<select name="housetype">
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
		 </select><span style=color:red>*</span>Bedroom/Bathroom<br/>
Roomtype:<select name="roomtype">
  		 <option value="bedroom">bedroom</option>
  		 <option value="livingroom">livingroom</option>
		 </select><span style=color:red>*</span><br/>
RoommateSexRequire:<select name="sex">
  		 <option value="Male">Male</option>
  		 <option value="Female">Female</option>
  		 <option value="Unlimit">Unlimit</option>
		 </select><span style=color:red>*</span><br/>
Your contact information:<br/>
WechatID:<input type="text" id="wechatid" maxlength="20" name="wechatid" required="required" /><br/>
QQ:<input type=text id=QQ maxlength=12 name=qq pattern="[1-9][0-9]{5,}" placeholder="xxx-xxx.xxxx" title="invalid QQ number, please input again" ><br/>
PhoneNumber:<input type=text id=phonenumber maxlength=12 name=phonenumber pattern=".{3}[-].{3}[.].{4}" placeholder="xxx-xxx.xxxx" title="Please input your phone number using correct format as xxx-xxx.xxxx" > eg:xxx-xxx.xxxx<br/>
Price:<input type="number" id="price" min="0" max="999999" name="price"  />$/month <span style=color:red>*</span><br/>
HouseInfo:<textarea rows="10" cols="50" id="houseinfo" name="houseinfo" ></textarea><br/>
<input type="submit" value="submit">          <input type=reset value=reset><br/>
</form>
<form action="StevensHousing.jsp" method="post">
<input type=hidden id="hidden 1" name="email" value="<%=request.getParameter("email") %>">
<input type=submit value="go back">
</form>
</body>
</html>
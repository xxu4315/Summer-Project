<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
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
<form action=FindAllHouseCL  method="post">
	<input type=hidden id=email name=email value="<%=request.getParameter("email") %>"> 
<select name="h_area">
         <option value="all">All</option>
  		 <option value="Jersey City">Jersey City</option>
  		 <option value="Union City">Union City</option>
  		 <option value="Hoboken">Hoboken</option>
  		 <option value="Weehawken">Weehawken</option>
  		 <option value="New Port">New Port</option>
		 </select><span style=color:red>*</span><br/>

<input type="submit" value="submit">          <input type=reset value=reset><br/>
</form>
<form action="Housing.jsp" method="post">
<input type=hidden id="hidden 1" name="email" value="<%=request.getParameter("email") %>">
<input type=submit value="go back">
</form>
</body>
</html>
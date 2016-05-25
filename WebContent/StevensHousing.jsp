<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>StevensHousing</title>
</head>
<body>
<%
String useremail = request.getParameter("email");

//System.out.println(useremail+"  SH");
if(session.getAttribute(useremail)==null){
//user did not login
response.sendRedirect("Login.jsp");

}
if(request.getParameter("success")!=null){
	out.println("<span style=coclor:red>"+request.getParameter("success")+"</span>");
}
%>

  <!--      go to PostHouse page                   -->
  <form action=PostHouse.jsp method=post>   
  <input type=hidden id="hidden 1" name="email" value="<%=request.getParameter("email") %>"><br/> 
  <input type=submit value="Post a new housing info here"><br/>
    </form>  
  <!--      go to FindHouse page                   -->   
<form action=FindHouse.jsp  method=post>
<input type=hidden id="hidden 2" name="email" value="<%=request.getParameter("email") %>">
<input type=submit value="Find a new house here"><br/>
</form>
<form action="Welcome.jsp" method="post">
<input type=hidden id="hidden 1" name="Email" value="<%=request.getParameter("email") %>">
<input type=submit value="personal page">
</form>
</body>
</html>
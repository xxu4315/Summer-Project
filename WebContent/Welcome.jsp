<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
String useremail = request.getParameter("Email");
//System.out.println(useremail+"  Wel");
if(session.getAttribute(useremail)==null){
//user did not login
response.sendRedirect("Login.jsp");
}
%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Welcome</title>
</head>
<body>
Welcome!
<br/>
<form action=StevensHousing.jsp method=post>  
<!-- transfer email address to StevensHousing page -->
<input type=hidden id="hidden 1" name="email" value="<%=request.getParameter("Email") %>">
<!-- jump into StevensHousing page -->
<input type=submit value=StevensHousing>
</form>

</body>
</html>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
		<title>Favorite programming language response</title>
	</head>
	
	<body>
		<%
			// read the form data
			String favLang = request.getParameter("favLang");
		
			// create the cookie
			Cookie cookie = new Cookie("fala", favLang);
			
			// set the cookie's lifespan, measured in seconds
			cookie.setMaxAge(60 * 60 * 24 * 365);
			
			// send the cookie to the browser
			response.addCookie(cookie);
		%>
		
		<br>
		
		Thanks! We set your favorite language to <%= request.getParameter("favLang") %> <br><br>
		
		<a href="FavProLangInfo.jsp"> Display <%= favLang %>-related info </a>
	</body>
</html>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
		<title>STUDENT CONFIRMATION PAGE</title>
	</head>
		
	<body>
	
		The student's name: <%= request.getParameter("firstName") %> <%= request.getParameter("lastName") %> <br><br>
		
		The student's from: <%= request.getParameter("country") %> <br><br>
		
		The student's favorite IDE: <%= request.getParameter("favIDE") %> <br><br>
		
		The student's favorite programming languages: 
		
		<ul>
			<% 
				for(String lang : request.getParameterValues("favLanguage")) {
					out.print("<li>" + lang + "</li>");
				}
			%>
		</ul>
		
	</body>
</html>
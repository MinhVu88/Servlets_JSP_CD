<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
		<title>JSP EXPRESSIONS DEMO 2</title>
	</head>
	
	<body>
		converting a string to all upper-case: <%= new String("hello world").toUpperCase() %>
		<br>
		25.6 * 7.8 = <%= 25.6 * 7.8 %>
		<br>
		69 is less than 23? (true/false) -> <%= 69 < 23 %>
	</body>
</html>
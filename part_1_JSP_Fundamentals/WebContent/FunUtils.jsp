<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<%@ page import="jsp.*" %>

<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
		<title>USE JSP TO CALL A JAVA CLASS'S METHOD</title>
	</head>
	
	<body>
		call the FunUtils class's getLowerCase() to turn 'LEONARD DE VINCI' to be lower-case -> <%=FunUtils.getLowerCase("LEONARD DE VINCI")%>
	</body>
</html>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<!-- setting up a reference to the core tag library -->
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
		<title>forEach tag - loop</title>
	</head>
	
	<body>
		<%
			String[] cityList = {"Tokyo", "Munich", "London", "Sydney", "New York"};
		
			pageContext.setAttribute("cities", cityList);
		%>
		
		<ul>
			<c:forEach var="city" items="${cities}">
				<li> <b> ${city} </b> </li> <br>
			</c:forEach>
		</ul>
		
	</body>
</html>
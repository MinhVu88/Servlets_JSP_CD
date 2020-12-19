<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<!-- setting up a reference to the core tag & function tag library -->
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
		<title>testing functions tags</title>
	</head>
	
	<body>
		<c:set var="string" value="novus ordo seclorum"></c:set>
		
		The length of the string <b> '${string}' </b> is ${fn:length(string)}
		
		<br><br>
		
		<b> ${string} </b> in upper-case is <b> ${fn:toUpperCase(string)} </b>
		
		<br><br>
		
		Does the string <b> '${string}' </b> start with <b>nov</b>? -> ${fn:startsWith(string, "nov")}
	</body>
</html>
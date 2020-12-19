<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<!-- setting up a reference to the core tag & function tag library -->
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
		<title>demonstrations of slit and join tags</title>
	</head>
	
	<body>
		<c:set var="cityString" value="Tokyo, Munich, New York, Toronto, Manchester, Sydney"></c:set>
		
		<h3> split demo </h3>
		
		<c:set var="cityArray" value="${fn:split(cityString, ',')}"></c:set>
		
		<ul>
			<c:forEach var="city" items="${cityArray}">
				<li> <b> ${city} </b> </li> <br>
			</c:forEach>
		</ul>
		
		<h3> join demo </h3>
		
		<c:set var="join" value="${fn:join(cityArray, ' | ')}"></c:set>
		
		The result of joining the cityArray's elements together with the delimiter '|' in between: <b> ${join} </b> 
	</body>
</html>
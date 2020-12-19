<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<!-- setting up a reference to the core tag library -->
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
		<title>Student View 2</title>
	</head>
	
	<body>
		<h2> Student View 2 </h2>
		
		<hr><br>
		
		<table border="1">
			<!-- create the table headings -->
			<tr>
				<th> First Name </th>
				<th> Last Name </th>
				<th> Email </th>
			</tr>
			
			<!-- create the table rows & add data to each cell of the rows -->
			<c:forEach var="stu" items="${student_list}">
				<tr>
					<td>${stu.firstName}</td>
					<td>${stu.lastName}</td>
					<td>${stu.email}</td>
				</tr>
			</c:forEach>
		</table>
	</body>
</html>
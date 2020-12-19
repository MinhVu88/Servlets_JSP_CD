<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<%@ page import="java.util.*, controller_servlets.*, model.*" %>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
		<title>Student List</title>
		<link type="text/css" rel="stylesheet" href="css/style.css">
	</head>
	
	<body>
		<hr>
	
		<%
			List<Student> students = (List<Student>) request.getAttribute("stu_list");
		%>
		
		<ul>
			<c:forEach var="stu" items="${stu_list}">
				<li> ${stu} </li>
			</c:forEach>
		</ul>
		
		<hr><br>
		
		<div id="wrapper">
			<div id="header">
				<h2 align="center"> Tool University </h2>
			</div>
		</div>
		
		<div id="container">
		
			<div id="content">
			
				<input type="hidden" name="command" value="LIST"/>
				
				<input type="button" 
					   value="Add student" 
					   onclick="window.location.href='addStudent.jsp'; return false;" 
					   class="add-student-button"/>
				
				<table>
					<tr>
						<th> Id </th>
						<th> First Name </th>
						<th> Last Name </th>
						<th> Email </th>
						<th> Action </th>
					</tr>
					
					<c:forEach var="stu" items="${stu_list}">
					
						<!-- set up update student links -->
						<c:url var="update" value="StudentController">
							<c:param name="command" value="LOAD"/>
							
							<c:param name="stuId" value="${stu.id}"/>
						</c:url>
						
						<!-- set up delete student links -->
						<c:url var="delete" value="StudentController">
							<c:param name="command" value="DELETE"/>
							
							<c:param name="stuId" value="${stu.id}"/>
						</c:url>
						
						<tr>
							<td> ${ stu.getId() } </td>
							<td> ${ stu.getFirstName() } </td>
							<td> ${ stu.getLastName() } </td>
							<td> ${ stu.getEmail() } </td>
							<td> 
								<a href="${update}"> Update </a> 
								| 
								<a href="${delete}" onclick="if(!(confirm('Sure?'))) return false;"> Delete </a> 
							</td>
						</tr>
						
					</c:forEach>
					
				</table>
				
			</div>
			
		</div>
	</body>
</html>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<!-- setting up a reference to the core tag library -->
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!-- importing classes -->
<%@ page import="java.util.*, forEachTag.*" %>

<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
		<title>Customer table</title>
	</head>
	
	<body>
		<%
			List<Customer> custList = new ArrayList<>();
		
			custList.add(new Customer("john", "doe", false));
			
			custList.add(new Customer("jane", "doe", false));
			
			custList.add(new Customer("kurt", "meyer", true));
			
			pageContext.setAttribute("customers", custList);
		%>
		
		<!-- setting up a html table -->
		<table border="1">
			<!-- table headings -->
			<tr>
				<th> first name </th>
				<th> last name </th>
				<th> VIP </th>
			</tr>
			
			<!-- table cells -->
			<c:forEach var="cust" items="${customers}">
				<tr>
					<td> ${cust.firstName} </td>
					<td> ${cust.lastName} </td>
					<td> ${cust.vip} </td>
				</tr>
			</c:forEach>
		</table>
		
	</body>
</html>
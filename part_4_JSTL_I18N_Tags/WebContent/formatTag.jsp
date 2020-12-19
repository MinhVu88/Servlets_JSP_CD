<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<!-- setting up a reference to the core tag & function tag library -->
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
		<title>using labels defined in the properties files</title>
	</head>
	
	<body>
		<c:set var="locale" value="${not empty param.locale ? param.locale : pageContext.request.locale}" scope="session"/>
			   
		<fmt:setLocale value="${locale}"/>
		
		<fmt:setBundle basename="locales.locale_default"/>
		
		<a href="formatTag.jsp?locale=en_US"> English (US) </a> <b> | </b>
		
		<a href="formatTag.jsp?locale=es_ES"> Spanish (ES) </a> <b> | </b>
		
		<a href="formatTag.jsp?locale=de_DE"> German (DE) </a> <br><br>
		
		<fmt:message key="label.greeting"/> <br>
		
		<fmt:message key="label.firstName"/>: <b> John </b> <br>
		
		<fmt:message key="label.lastName"/>: <b> Doe </b> <br><br>
		
		<fmt:message key="label.welcome"/> <br><br>
		
		Selected locale: ${locale}
	</body>
</html>
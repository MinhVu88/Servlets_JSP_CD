<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
		<title>Favorite programming language homepage</title>
	</head>
	
	<body>
		<%
			String userFavLang = "";
		
			Cookie[] cookies = request.getCookies();
			
			if(cookies != null) {
				for(Cookie c : cookies) {
					userFavLang = c.getValue();
					
					break;
				}
			}
		%>
		
		<h2> <%= userFavLang %>-related info </h2>
		
		<h4> * New books for <%= userFavLang %> </h4>
		
		<ul>
			<li> <%= userFavLang %> book 1 </li>
			<li> <%= userFavLang %> book 2 </li>
			<li> <%= userFavLang %> book 3 </li>
		</ul>
		
		<h4> * Latest news for <%= userFavLang %> </h4>
		
		<ul>
			<li> <%= userFavLang %> news 1 </li>
			<li> <%= userFavLang %> news 2 </li>
			<li> <%= userFavLang %> news 3 </li>
		</ul>
		
		<h4> * Hot jobs for <%= userFavLang %> </h4>
		
		<ul>
			<li> <%= userFavLang %> job 1 </li>
			<li> <%= userFavLang %> job 2 </li>
			<li> <%= userFavLang %> job 3 </li>
		</ul>
		
		<hr>
		
		<a href="FavProLangForm.html"> Select another programming language </a>
	</body>
</html>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<!-- import the java package util -->
<%@ page import="java.util.*" %>

<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
		<title>JSP TO-DO LIST</title>
	</head>
	
	<body>
	
		<!-- create a html form -->
		<form action="ToDoList.jsp">
			Add a new item to the to-do list: <input type="text" name="item"/>
			
			<input type="submit" value="Submit"/>
		</form>
		
		<br>
		
		<!-- read data entered into the form -->
		The newly added item: <%= request.getParameter("item") %>
		
		<br><br>
		
		<!-- add new items to the list -->
		<%
			// retrieve the list's data from the session object & assign it to items, using session.getAttribute()
			List<String> items = (List<String>) session.getAttribute("todolist");
			
			// check whether the list contains any data
			// if not, then instantiate it & add the data to the session object, using session.setAttribute()
			if(items == null) {
				items = new ArrayList<String>();
				
				session.setAttribute("todolist", items);
			}
			
			// check whether individual values are null
			// if not, add them to the list
			if(request.getParameter("item") != null) {
				items.add(request.getParameter("item"));
			}
		%>
		
		<hr>
		
		<!-- display the to-do list's items from session -->
		<p><b>The To-do list items:</b></p>
		
		<ol>
			<%
				for(String i : items) {
					out.println("<li>" + i + "</li>");
				}
			%>
		</ol>
		
	</body>
</html>
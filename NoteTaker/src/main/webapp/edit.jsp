<%@page import="com.todo.Note"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="org.hibernate.Session"%>
<%@page import="com.helper.FactoryProvider"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Edit Page</title>
<%@ include file="all_css_js.jsp"%>
</head>
<body>
	<div class="container">

		<%@ include file="navbar.jsp"%>
		<h2>Please fill your Updated Details</h2>
		<br>
		<br>
		<%
		int note_id = Integer.parseInt(request.getParameter("note_id").trim());

		Session session2 = FactoryProvider.getFactory().openSession();

		Note note = (Note) session2.get(Note.class, note_id);
		%>

		<form method="post" action="UpdateNoteServlet">
		<input value=<%= note.getId() %> name="note_id" type="hidden"/>
			<div class="form-group">
				<label for="title">Note Title:</label> <input type="text"
					name="title" required class="form-control" id="title"
					aria-describedby="title" value="<%=note.getTitle() %>" placeholder="Enter title">
			</div>
			<div class="form-group">
				<label for="content">Note Content:</label>
				<textarea name="content" required class="form-control" id="content"
					rows="5"><%= note.getContent() %></textarea>
			</div>
			<div class="container text-center">
				<button type="submit" class="btn btn-primary">Update</button>
			</div>
		</form>
	</div>
</body>
</html>
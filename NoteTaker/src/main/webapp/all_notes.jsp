<%@page import="com.todo.Note"%>
<%@page import="java.util.List"%>
<%@page import="org.hibernate.Query"%>
<%@page import="org.hibernate.Session"%>
<%@page import="com.helper.FactoryProvider"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<%@ include file="all_css_js.jsp"%>
<meta charset="ISO-8859-1">
<title>All Notes: NoteTaker</title>
</head>
<body>

	<div class="container">

		<%@ include file="navbar.jsp"%>
		<br>
		<h2>All Notes:</h2>
		<div class="row">
			<div class="col-12">
				<%
			Session session2	=FactoryProvider.getFactory().openSession();
			Query query	=session2.createQuery("from Note");
		List<Note> list1	=query.list();
				for (Note note : list1) {
				%>
				<div class="card mt-3">
					<img class="card-img-top m-4 mx-auto" style='max-width: 100px;'
						src="img/notepad.png" alt="Card image cap">
					<div class="card-body px-5">
						<h5 class="card-title"><%=note.getTitle()%></h5>
						<p class="card-text"><%=note.getContent()%></p>
						<p><b class="text-primary"><%= note.getAddedDate() %></b></p>
						<div class="container text-center">

							<a href="DeleteServlet?note_id=<%=note.getId() %>" class="btn btn-danger">Delete</a> 
							<a href="edit.jsp?note_id=<%=note.getId() %>" class="btn btn-primary">Update</a>
						</div>
					</div>
				</div>

				<%
				}
				session2.close();
				%>


			</div>


		</div>
	</div>
</body>
</html>
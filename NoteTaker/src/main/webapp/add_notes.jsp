<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Add Notes Page</title>
<%@ include file="all_css_js.jsp"%>
</head>
<body>

	<div class="container">

		<%@ include file="navbar.jsp"%>
		<h2>Please fill your Details</h2>
		<!-- Forms  -->
		<form method="post" action="SaveNoteServlet">
			<div class="form-group">
				<label for="title">Note Title:</label> <input type="text"
					name="title" required class="form-control" id="title"
					aria-describedby="title" placeholder="Enter title">
			</div>
			<div class="form-group">
				<label for="content">Note Content</label>
				<textarea name="content" required class="form-control" id="content" rows="5"></textarea>
			</div>
			<div class="container text-center">
				<button type="submit" class="btn btn-primary">Add</button>

			</div>
		</form>
	</div>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="org.hibernate.*,com.entities.*,com.helper.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@include file="all_js_css.jsp"%>
</head>
<body>
	<div class="container">
		<%@include file="Navbar.jsp"%>
		<h3>Edit your note</h3>
		<br>
		<%
		
		int noteId = Integer.parseInt(request.getParameter("note_id").trim());
		Session s = FactoryProvider.getFactory().openSession();
		Transaction tx = s.beginTransaction();
		Note note = (Note) s.get(Note.class, noteId);
		%>
		<form action="UpdateServlet" method="post">
		
		<input value="<%=note.getId() %>" name="noteId" type = "hidden"/>
		
			<div class="form-group">
				<label for="title">Note title</label> <input name="title" required
					type="text" class="form-control" id="title"
					aria-describedby="emailHelp" placeholder="Enter here.."
					value="<%=note.getTitle()%>" />
			</div>

			<div class="form-group">
				<label for="content">Content</label>
				<textarea name="content" required id="content"
					placeholder="Enter your content here.." class="form-control"
					style="height: 300px;"><%=note.getContent()%></textarea>
			</div>

			<div class="container text-center">
				<button type="submit" class="btn btn-success">Save your note</button>
			</div>

		</form>

	</div>
</body>
</html>
<%@page import="javax.persistence.EntityTransaction"%>
<%@page import="javax.persistence.Persistence"%>
<%@page import="com.notes.Note" %>
<%@page import="javax.persistence.EntityManagerFactory"%>
<%@page import="javax.persistence.EntityManager"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">

<title>To Do : edit</title>
<%@ include file="all_js_css.jsp"%>
</head>
<body>

<%@include file="navigation.jsp" %>
<h1>Edit Your Note</h1>
<%
int noteID=Integer.parseInt(request.getParameter("n_id").trim());
EntityManagerFactory emf=Persistence.createEntityManagerFactory("java");
EntityManager em=emf.createEntityManager();
EntityTransaction et=em.getTransaction();

Note n=(Note)em.find( Note.class, noteID);
%>

<!--  This is add form  -->

<form action="UpdateServelet" method="post">

	<input value="<%= n.getId()%>" name="noteID" type="hidden">

  <div class="form-group">
    <label for="title">Note Title</label>
    <input type="text" class="form-control" id="title" placeholder="Enter here " name="title" required value="<%= n.getTitle()%>">
  </div>
  
  <div class="form-group">
    <label for="content">Note Content</label>
    <textarea required value="<%= n.getContent()%>" id="content" placeholder="Enter your content here" name="content"class="form-control" style="height:300px"></textarea>
  </div>
  <div class="container text-center">
      <button type="submit" class="btn btn-success">Save Note</button>
  </div>
</form>


</body>
</html>
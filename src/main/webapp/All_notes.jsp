<%@page import="org.hibernate.Session"%>
<%@page import="org.hibernate.SessionFactory"%>
<%@page import="org.hibernate.cfg.Configuration"%>
<%@page import="org.hibernate.boot.SessionFactoryBuilder"%>
<%@page import="java.util.List"%>
<%@page import="javax.persistence.Query"%>
<%@page import="com.notes.Note"%>
<%@page import="javax.persistence.EntityTransaction"%>
<%@page import="javax.persistence.EntityManager"%>
<%@page import="javax.persistence.Persistence"%>
<%@page import="javax.persistence.EntityManagerFactory"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>All Notes : Note Taker</title>
<%@ include file="all_js_css.jsp" %>
</head>
<body>

<div class="container">
	
	<%@ include file="navigation.jsp" %>
	<br>
	<h1 class="text-uppercase">All Notes</h1>
	
	<div class="row">
	
	<div class="col">
	
	<!-- To fetch data -->
	<%
	EntityManagerFactory emf=Persistence.createEntityManagerFactory("java");
	EntityManager em=emf.createEntityManager();
	Query q=em.createQuery("select n from Note n");
	 List<Note>l=q.getResultList();
	 
	 // print note one by one
	 for(Note n:l)
	 {
		 %>
		 
		 <div class="card mt-3" >
  <img class="card-img-top pl-4 pt-4" style="max-width: 80px"src="image/post-it.png" alt="Card image cap">
  <div class="card-body">
    <h5 class="card-title"><%= n.getTitle() %></h5>
    <p class="card-text"><%= n.getContent() %></p>
    <p><b><%= n.getDate() %></b></p>
    <a href="DeleteServelet?n_id=<%= n.getId() %>" class="btn btn-danger">Delete</a>
        <a href="edit.jsp?n_id=<%=n.getId() %>" class="btn btn-primary">Update</a>
    
  </div>
</div>		 
		 <%
		 
	 }
	 
	%>
	
	</div>
	
	</div>


</div>



</body>
</html>
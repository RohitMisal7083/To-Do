<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Add notes here</title>
    <%@ include file="all_js_css.jsp" %>
</head>
<body>

<div>
<%@ include file="navigation.jsp" %>

<h1>Please fill your notes</h1>
<br>
</div>

<!--  This is add form  -->

<form action="SaveNoteServelet" method="post">

  <div class="form-group">
    <label for="title">Note Title</label>
    <input type="text" class="form-control" id="title" placeholder="Enter here " name="title" required>
  </div>
  
  <div class="form-group">
    <label for="content">Note Content</label>
    <textarea required id="content" placeholder="Enter your content here" name="content"class="form-control" style="height:300px"></textarea>
  </div>
  <div class="container text-center">
      <button type="submit" class="btn btn-primary">Add</button>
  </div>
</form>


</body>
</html>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="Job Search">
    <meta name="author" content="Haofeng Liang">

    <title>Job list</title>
    <!-- Bootstrap core CSS -->
    <link href="css/bootstrap.min.css" rel="stylesheet">

    <!-- Custom styles for this template -->
    <link href="css/register_form.css" rel="stylesheet">
</head>
<body>

<!-- Side Nav Bar -->
<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
  <a class="navbar-brand brand right-space" href="#">Logo goes here</a>
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>

  <div class="collapse navbar-collapse" id="navbarSupportedContent">
    <ul class="navbar-nav mr-auto">
      
    </ul>
  </div>
</nav>

<!-- Body -->
<div class="container">
	<p>Delete id is <%= request.getParameter("delete-id")%></p>
  <form action="add-job.jsp"><button style="width: 100%; margin: 10px 0;"class="btn btn-primary" type="submit" name="employer-id" value="112">+</button></form>
  <div>
    <table class="table">
      <thead>
        <tr>
          <th scope="col">#</th>
          <th scope="col">Title</th>
          <th scope="col">Employer</th>
          <th scope="col">Salary</th>
          <th scope="col">Working Type</th>
          <th scope="col"></th>
        </tr>
      </thead>
      <tbody>
        <tr>
          <th scope="row">1</th>
          <td>Test Job Title</td>
          <td>Google</td>
          <td>1000,000</td>
          <td>Full Time</td>
          <td><form action="list-job.jsp" method="post"><button class="btn btn-secondary" name="delete-id" type="submit" value="111">Delete</button></form></td>
        </tr>
        <tr>
          <th scope="row">2</th>
          <td>Test Job Title</td>
          <td>Google</td>
          <td>1000,000</td>
          <td>Full Time</td>
          <td><form><button class="btn btn-secondary" name="delete-id" type="submit" value="112">Delete</button></form></td>
        </tr>
        <tr>
          <th scope="row">3</th>
          <td>Test Job Title</td>
          <td>Google</td>
          <td>1000,000</td>
          <td>Full Time</td>
          <td><form><button class="btn btn-secondary" name="delete-id" type="submit" value="113">Delete</button></form></td>
        </tr>
      </tbody>
    </table>
  </div>
</div>




<script src="js/bootstrap.min.js"></script>

     
</body>
</html> 
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="Job Search">
    <meta name="author" content="Haofeng Liang">

    <title>Job Search-Adding Job</title>
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
  <form class="form-inline my-3 search-bar">
      <input name="search-content" class="form-control mr-sm-2" type="search" placeholder="Search content" aria-label="Search" required>

      <select name="search-as" class="form-control mr-sm-2" id="search-as">
      <option>Job title</option>
      <option>Employer</option>
      </select>

      <button class="btn btn-outline-success my-3 my-sm-0" type="submit">Search</button>
  </form>

  <div>
    <table class="table">
      <thead>
        <tr>
          <th scope="col">#</th>
          <th scope="col">Title</th>
          <th scope="col">Employer</th>
          <th scope="col">Salary</th>
          <th scope="col">Working Type</th>
        </tr>
      </thead>
      <tbody>
        <tr>
          <th scope="row">1</th>
          <td>Test Job Title</td>
          <td>Google</td>
          <td>1000,000</td>
          <td>Full Time</td>
        </tr>
        <tr>
          <th scope="row">2</th>
          <td>Test Job Title</td>
          <td>Google</td>
          <td>1000,000</td>
          <td>Full Time</td>
        </tr>
        <tr>
          <th scope="row">3</th>
          <td>Test Job Title</td>
          <td>Google</td>
          <td>1000,000</td>
          <td>Full Time</td>
        </tr>
      </tbody>
    </table>
  </div>
</div>




<script src="js/bootstrap.min.js"></script>

     
</body>
</html> 
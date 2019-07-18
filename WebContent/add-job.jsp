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
<div class="container register-form">
  <form>
    <div class="form-group">
      <label for="job-title">Job title</label>
      <input name="job-title" type="text" class="form-control" id="job-title" 
      placeholder="Job Title" required>
    </div>
    <div class="form-group">
      <label for="salary">Salary</label>
      <input name="salary" type="text" class="form-control" id="salary" 
      placeholder="Salary (Optional)">
    </div>
    <div class="form-group">
      <label for="work-type">Working Type</label>
      <select name="work-type" class="form-control" id="work-type">
        <option>Any</option>
        <option>Full Time</option>
        <option>Part Time</option>
        <option>Internship</option>
        <option>Co-Op</option>
      </select>
    </div>
    <div class="form-group">
      <label for="job-description">Description</label>
      <textarea name="job-description" class="form-control" id="job-description" rows="5"></textarea>
    </div>
    <button class="btn btn-primary" type="submit">Add</button>
    <a href="index.jp" class="btn btn-danger">Cancel</a>
  </form>
</div>




<script src="js/bootstrap.min.js"></script>

     
</body>
</html> 

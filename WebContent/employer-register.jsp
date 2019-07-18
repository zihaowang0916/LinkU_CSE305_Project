<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="Job Search">
    <meta name="author" content="Haofeng Liang">

    <title>Job Search-Employer Registration</title>
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
      <label for="comp-name">Company name</label>
      <input name="comp-name" type="text" class="form-control" id="comp-name" 
      placeholder="Company Name" required>
    </div>
    <div class="form-group">
      <label for="ceo">CEO</label>
      <input name="ceo" type="text" class="form-control" id="ceo" 
      placeholder="CEO name" required>
    </div>
    <div class="form-group">
      <label for="comp-email">Email address</label>
      <input name="comp-email" type="email" class="form-control" id="comp-email" 
      placeholder="name@example.com" required>
    </div>
    <div class="form-group">
      <label for="comp-password">Password</label>
      <input name="comp-password" type="password" class="form-control" id="comp-password" 
      placeholder="Enter your password" required>
    </div>
    <div class="form-group">
      <label for="comp-phone">Phone number</label>
      <input name="comp-phone" type="text" class="form-control" id="comp-phone" 
      placeholder="Enter your phone number">
    </div>
    <div class="form-group">
      <label for="about">About</label>
      <textarea name="about" class="form-control" id="about" rows="5"></textarea>
    </div>
    <button class="btn btn-primary" type="submit">Sign up</button>
    <a href="index.jp" class="btn btn-danger">Cancel</a>
  </form>
</div>





<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
<script src="js/bootstrap.min.js"></script>
<script src="js/ticketsite.js"></script>
     
</body>
</html> 

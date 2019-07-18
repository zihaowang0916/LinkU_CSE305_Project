<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="Job Search">
    <meta name="author" content="Haofeng Liang">

    <title>Job Search-Candidate Registration</title>
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
      <!-- <li class="nav-item active">
        <a class="nav-link fas fa-home" href="index.html">Home <span class="sr-only">(current)</span></a>
      </li>
      <li class="nav-item">
        <a class="nav-link fas fa-ticket-alt" href="ticket.html">Tickets</a>
      </li>
      <li class="nav-item">
        <a class="nav-link fas fa-shopping-cart" href="#">Cart</a>
      </li> -->
    </ul>
  </div>
</nav>

<!-- Body -->
<div class="container register-form">
  <form action="candidate-signup.jsp" method="post">
    <div class="form-row">
      <div class="col-md-6 mb-3">
        <label for="firstname">First name</label>
        <input type="text" name="firstname" class="form-control" id="firstname" placeholder="First name" required>
      </div>
      <div class="col-md-6 mb-3">
        <label for="lastname">Last name</label>
        <input type="text" name="lastname" class="form-control" id="lastname" placeholder="Last name" required>
      </div>
    </div>
    <div class="form-group">
      <label for="cand-email">Email address</label>
      <input name="cand-email" type="email" class="form-control" id="cand-email" 
      placeholder="name@example.com" required>
    </div>
    <div class="form-group">
      <label for="cand-password">Password</label>
      <input name="cand-password" type="password" class="form-control" id="cand-password" 
      placeholder="Enter your password" required>
    </div>
    <div class="form-group">
      <label for="cand-address">Address</label>
      <input name="cand-address" type="text" class="form-control" id="cand-address" 
      placeholder="Enter your address">
    </div>
    <div class="form-group">
      <label for="cand-phone">Phone number</label>
      <input name="cand-phone" type="text" class="form-control" id="cand-phone" 
      placeholder="Enter your phone number">
    </div>
    <div class="form-group">
      <label for="cand-about">About</label>
      <textarea name="cand-about" class="form-control" id="cand-about" rows="5"></textarea>
    </div>
    <button class="btn btn-primary" type="submit">Sign up</button>
    <a href="index.jsp" class="btn btn-danger">Cancel</a>
  </form>
</div>





<script src="js/bootstrap.min.js"></script>
     
</body>
</html> 

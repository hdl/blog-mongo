<!DOCTYPE html>
<html>
<head>
<title>北美蹭饭网 - {{html_title}}</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
</head>
<body>

%if (username != None):
<nav class="navbar navbar-inverse">
  <div class="container-fluid">
    <div class="navbar-header">
      <a class="navbar-brand" href="/">北美蹭饭网</a>
    </div>
    <div>
      <ul class="nav navbar-nav">
      	<li><a href="/userhome">{{username}}</a></li>
        <li><a href="/newpost">我想蹭饭</a></li>
        <li><a href="/newpost">我能做饭</a></li>
      </ul>
      <ul class="nav navbar-nav navbar-right">
        <li><a href="/signup"><span class="glyphicon glyphicon-user"></span> Sign Up</a></li>
        <li><a href="/login"><span class="glyphicon glyphicon-log-in"></span> Login</a></li>
      </ul>
    </div>
  </div>
</nav>
%else :
<nav class="navbar navbar-inverse">
  <div class="container-fluid">
    <div class="navbar-header">
      <a class="navbar-brand" href="#">北美蹭饭网</a>
    </div>
    <div>
      <ul class="nav navbar-nav">
        <li><a href="/newpost">我想蹭饭</a></li>
        <li><a href="/newpost">我能做饭</a></li>
      </ul>
      <ul class="nav navbar-nav navbar-right">
        <li><a href="/signup"><span class="glyphicon glyphicon-user"></span> Sign Up</a></li>
        <li><a href="/login"><span class="glyphicon glyphicon-log-in"></span> Login</a></li>
      </ul>
    </div>
  </div>
</nav>
%end


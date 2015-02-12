%include('header.tpl', html_title='发布')
<link href="/static/css/signin.css" rel="stylesheet">

<body>
<div class="container">
  <form class="form-signin" role="form" method="post">
    <h2 class="form-signin-heading">Sign Up</h2>
    <div class="form-group">
      <label for="email">Email:</label>
      <input type="email" class="form-control" id="email" placeholder="Enter email" name="email" value="{{email}}">
    </div>
    <div class="form-group">
      <label for="usr">User Name:</label>
      <input type="text" class="form-control" id="usr" name="username" placeholder="User Name" value="{{username}}">
    </div>
    <div class="form-group">
      <label for="pwd">Password:</label>
      <input type="password" class="form-control" id="pwd" placeholder="Enter password" name="password" value="">
    </div>
    <div class="form-group">
      <label for="pwd">Password:</label>
      <input type="password" class="form-control" placeholder="Re-type password" name="verify" value="">
    </div>
    <div class="checkbox">
      <label><input type="checkbox"> Remember me</label>
    </div>
    %if (errors != ""):
    <div class="alert alert-danger" role="alert">{{errors}}</div>
    %end
    <button type="submit" class="btn btn-lg btn-primary btn-block">Submit</button>
  </form>
</div>

</body>
    
%include('footer.tpl')

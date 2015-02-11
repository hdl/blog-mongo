%include('header.tpl', html_title='发布')


<div class="container">
  <h2>Sign Up</h2>
  <form role="form" method="post">
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

    <p class="bg-danger">{{errors}}</p>
    <button type="submit" class="btn btn-default">Submit</button>
  </form>
</div>




    
%include('footer.tpl')

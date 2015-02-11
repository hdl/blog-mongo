%include('header.tpl', html_title='发布')

<div class="container">
  <h2>Login</h2>
  <form role="form" method="post">
    <div class="form-group">
      <label for="email">Email:</label>
      <input type="email" class="form-control" id="email" placeholder="Enter email" name="email" value="{{email}}">
    </div>
    <div class="form-group">
      <label for="pwd">Password:</label>
      <input type="password" class="form-control" id="pwd" placeholder="Enter password" name="password" value="">
    </div>
    <div class="checkbox">
      <label><input type="checkbox"> Remember me</label>
    </div>
    <p class="bg-danger">{{login_error}}</p>
    <button type="submit" class="btn btn-default">Submit</button>
  </form>
</div>


    <h2>Login</h2>
    <form method="post">
      <table>
        <tr>
          <td class="label">
            Username
          </td>
          <td>
            <input type="text" name="username" value="{{username}}">
          </td>
          <td class="error">
          </td>
        </tr>

        <tr>
          <td class="label">
            Password
          </td>
          <td>
            <input type="password" name="password" value="">
          </td>
          <td class="error">
	    {{login_error}}
            
          </td>
        </tr>

      </table>

      <input type="submit">
    </form>

%include('footer.tpl')

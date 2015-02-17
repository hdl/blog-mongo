%include('header.tpl', html_title='User Profile')
%include('nav.tpl')

<body>

  <div class="container">
    <div class="row">
      <div class="col-md-3">
        %include('userhome_sidenavbar_template.tpl')
      </div>
      <div class="col-md-9">
        <div class="panel panel-default">
          <div class="panel-heading">Change Password</div>
          <div class="panel-body">

            <form>
              <div class="form-group">
                <label for="password">Old Password</label>
                <input type="password" class="form-control" name="old_password" placeholder="Password">
              </div>

              <div class="form-group">
                <label for="password">New Password</label>
                <input type="password" class="form-control" name="new_password" placeholder="Password">
              </div>

              <div class="form-group">
                <label for="password">Confirm new password</label>
                <input type="password" class="form-control" name="confirm_password" placeholder="Password">
              </div>
              <button type="submit" class="btn btn-primary">Update Password</button>
            </form>

          </div>
        </div>

        <div class="panel panel-default">
          <div class="panel-heading">Delete Account</div>
          <div class="panel-body">
            Your account is currently an admin on these organizations: cengfanUS
            <p>
            You must transfer ownership or delete these organizations before you can delete your user.
            <p>
            <form>
              <button type="submit" class="btn btn-danger">Delete your account</button>
            </form>

          </div>
        </div>

      </div>
    </div>
  </div>


</body>

%include('footer.tpl')



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
          <div class="panel-heading">Profile</div>
          <div class="panel-body">
            User Name: {{username}} <br>
            %if user['status'] == 0:
            <small>Email Verification Required.</small>
            %else:
            <small>Email Verification Done</small>
            %end
          </div>
        </div>
      </div>
    </div>
  </div>


</body>

%include('footer.tpl')



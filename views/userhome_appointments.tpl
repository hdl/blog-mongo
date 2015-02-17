%include('header.tpl', html_title='Profile')
%include('nav.tpl')


<body>

  <div class="container">
    <div class="row">
      <div class="col-md-3">
        %include('userhome_sidenavbar_template.tpl')
      </div>
      <div class="col-md-9 well">

        <h3>{{username}}
          %if user['status'] == 0:
          <small>Email Verification Required.</small>
          %else:
          <small>Email Verification Done</small>
          %end
        </h3>

        %include('userhistory_template.tpl')

      </div>
    </div>
  </div>


</body>


%include('footer.tpl')

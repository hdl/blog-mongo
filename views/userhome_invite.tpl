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
          <div class="panel-heading">邀请小伙伴</div>
          <div class="panel-body">

            <form method="post">
              <div class="form-group">
                <label for="exampleInputEmail1">Email address</label>
                <input type="email" class="form-control" id="exampleInputEmail1" name="invited_email" placeholder="Enter email">
              </div>
              <div class="form-group">
              <textarea class="form-control" rows="4" name="invite_message">快来北美蹭饭网蹭饭/做饭吧 http://www.cengfan.us</textarea>
              </div>
               %if (result != ""):
              <div class="alert alert-success" role="alert">{{result}}</div>
              %end
              <button type="submit" class="btn btn-success"> 邀请! </button>
            </form>

          </div>
        </div>
      </div>
    </div>
  </div>


</body>

%include('footer.tpl')



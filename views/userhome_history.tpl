%include('header.tpl', html_title='User History')
%include('nav.tpl')


<body>

  <div class="container">
    <div class="row">
      <div class="col-md-3">
        %include('userhome_sidenavbar_template.tpl')
      </div>
      <div class="col-md-9">
        <div class="panel panel-default">
          <div class="panel-heading">History</div>
          <div class="panel-body">
            %include('userhistory_template.tpl')
          </div>
        </div>
      </div>
    </div>
  </div>


</body>

%include('footer.tpl')

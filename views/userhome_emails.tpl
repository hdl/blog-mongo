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
          <div class="panel-heading">Email</div>
          <div class="panel-body">

            Your primary Cengfan.us email address will be used for account-related notifications (e.g. account changes and billing receipts) as well as any web-based Cengfan.us operations (e.g. edits and merges).<p>
            <table class="table table-hover">
              <tr>
                <td>327490952@qq.com</td>
                <td>
                  <div class="text-right">
                    <button type="submit" class="btn btn-default btn-xs">Set as primary</button> <span class="glyphicon glyphicon-trash" aria-hidden="true"></span>
                  </div>
                </td>
              </tr>

              <tr>
                <td>zemao@usc.edu (<a href="http://usc.edu">University of Southern California)</a></td>
                <td>
                  <div class="text-right">
                    <button type="submit" class="btn btn-default btn-xs">Set as primary</button> <span class="glyphicon glyphicon-trash" aria-hidden="true"></span>
                  </div>
                </td>
              </tr>

              <tr>
                <td>{{user['_id']}} <span class="label label-success">Primary</span> <span class="label label-default">Public</span></td>
                <td>
                  <div class="text-right">
                    <span class="glyphicon glyphicon-trash" aria-hidden="true"></span>
                  </div>
                </td>
              </tr>

            </table>

          </div>
        </div>
      </div>
    </div>
  </div>


</body>

%include('footer.tpl')



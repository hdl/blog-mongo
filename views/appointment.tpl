%include('header.tpl', html_title='appointment')
%include('nav.tpl')


<body>

  <div class="container">
    <div class="row">
      <div class="col-md-3">
        %include('userhome_sidenavbar_template.tpl')
      </div>
      <div class="col-md-9">
        <div class="panel panel-default">
          <div class="panel-heading">Appointment</div>
          <div class="panel-body">


            <div >
              <div class="comments-list">
                %for appointment in appointment_list:
                <div class="media">
                %if appointment["from"] != username:
                 <div class="pull-right">
                  %if appointment["status"] == 0:
                  <form action="/appointment/confirm" method="post">
                    <input type="text" class="form-control sr-only" name="_id" value="{{appointment["_id"]}}">
                    <button type="submit" class="btn btn-success">Confirm</button>
                  </form>
                  %elif appointment["status"] == 1:
                  <form action="/appointment/cancel" method="post">
                    <input type="text" class="form-control sr-only" name="_id" value="{{appointment["_id"]}}">
                    <button type="submit" class="btn btn-success">Cancel</button>
                  </form>
                  %else:
                    <h3><span class="label label-default">Canceled</span></h3>
                  %end
                </div>
                %end
                <div class="media-body">
                  %if appointment["from"]==username:
                  <h4 class="media-heading user_name">发送给 <a href="/user/profile/{{appointment["to"]}}">{{appointment["to"]}}</a></h4>
                  %else:
                  <h4 class="media-heading user_name">来自 {{appointment["from"]}}</h4>
                  %end
                  <a href="/post/{{appointment["post_id"]}}">{{appointment["post_title"]}}</a><p>
                  %if appointment["status"] == 0:
                  状态: 等待对方确认
                  %elif appointment["status"] == 1:
                  状态: 已确认
                  %else:
                  状态: 已取消
                  %end
                  <p>
                    留言: {{appointment["msg"]}}
                  </div>
                </div>
                %end
              </div>
            </div>




          </div>
        </div>
      </div>
    </div>
  </div>


</body>

%include('footer.tpl')

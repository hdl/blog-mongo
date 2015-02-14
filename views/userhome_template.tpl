%include('header.tpl', html_title='Home')
%include('nav.tpl')
<body>
  <div class="container">

    <ul class="nav nav-pills" style="margin-left:40%" align="center">
      <li id="guest_li" class="active"><a href="#" onclick="guestFunction();">蹭饭史</a></li>
      <li id="host_li" ><a href="#" onclick="hostFunction();" >做饭史</a></li>
    </ul>

    <h3>{{username}}
    %if user['status'] == 0:
    <small>Email Verification Required.</small>
    %else:
    <small>Email Verification Done</small>
    %end
    </h3>
    <hr>
    <div id="guest">
      <table class="table table-striped">
        <thead>
          <tr>
            <th class="col-md-3">Title</th>
            <th class="col-md-2">价格</th>
            <th class="col-md-3">时间</th>
            <th class="col-md-2">Deliver方式</th>
          </tr>
        </thead>
        <tbody>
          %for post in guest_posts:
          <tr>
            <td><a href="/post/{{post['permalink']}}">{{post['title']}}</a></td>
            <td>{{post['price']}}</td>
            <td>{{post['date']}}</td>
            <td>{{post['deliver_method']}}</td>
          </tr>
          %end
        </tbody>
      </table>
    </div>


    <div id="host" style="display: none">
      <table class="table table-striped">
        <thead>
          <tr>
            <th class="col-md-3">Title</th>
            <th class="col-md-2">价格</th>
            <th class="col-md-3">时间</th>
            <th class="col-md-2">Deliver方式</th>
          </tr>
        </thead>
        <tbody>
          %for post in host_posts:
          <tr>
            <td><a href="/post/{{post['permalink']}}">{{post['title']}}</a></td>
            <td>{{post['price']}}</td>
            <td>{{post['date']}}</td>
            <td>{{post['deliver_method']}}</td>
          </tr>
          %end
        </tbody>
      </table>
    </div>

</div>
</body>
<script>
function guestFunction() {
  document.getElementById('host').style.display = "none";
  document.getElementById('guest').style.display = "block";
  document.getElementById("host_li").className = "";
  document.getElementById("guest_li").className = "active";

};
function hostFunction() {
  document.getElementById('host').style.display = "block";
  document.getElementById('guest').style.display = "none";
  document.getElementById("host_li").className = "active";
  document.getElementById("guest_li").className = "";
};

</script>

%include('footer.tpl')




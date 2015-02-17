 <div>
 <!-- Nav tabs -->
 <div class="span12 centered-pills">
  <ul class="nav nav-pills center-pills" role="tablist">
    <li role="presentation" class="active"><a href="#home" aria-controls="home" role="tab" data-toggle="tab">蹭饭史</a></li>
    <li role="presentation"><a href="#profile" aria-controls="profile" role="tab" data-toggle="tab">做饭史</a></li>
  </ul>
</div>

<!-- Tab panes -->
<div class="tab-content">
  <div role="tabpanel" class="tab-pane fade in active" id="home">
    <table class="table">
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
  <div role="tabpanel" class="tab-pane fade" id="profile">
    <table class="table">
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
</div>

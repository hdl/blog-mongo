
%include('header.tpl', html_title='编辑Post')
<!-- include summernote css/js-->
<link href="/static/summernote/summernote.css" rel="stylesheet">
<script src="/static/summernote/summernote.js"></script>

<body>
  %include('nav.tpl')

  <div class="container" >
    <form role="form" method="POST">

      %if (type == "newpost"):
      <h2>填写以下信息吧 <button type="submit" class="btn pull-right btn-success"> 发布 </button></h2>
      %else:
      <h2>更新以下信息吧 <button type="submit" class="btn pull-right btn-success"> 更新 </button></h2>
      %end

      %if (errors != ""):
      <div class="alert alert-danger" role="alert">{{errors}}</div>
      %end


      <div class="form-group">
        <label for="role"><code>*</code> 选择角色 </label>
        %if defined('role_from_get'):
          %if role_from_get == "guest":
          <div class="radio"><label><input type="radio" name="role" id="role1" value="guest" checked>我想蹭饭</label></div>
          <div class="radio"><label><input type="radio" name="role" id="role2" value="host">我能做饭</label></div>
          %else:
          <div class="radio"><label><input type="radio" name="role" id="role1" value="guest">我想蹭饭</label></div>
          <div class="radio"><label><input type="radio" name="role" id="role2" value="host" checked>我能做饭</label></div>
          %end
        %else:
          %if post==None or post['role'] == "guest":
          <div class="radio"><label><input type="radio" name="role" id="role1" value="guest" checked>我想蹭饭</label></div>
          <div class="radio"><label><input type="radio" name="role" id="role2" value="host">我能做饭</label></div>
          %else:
          <div class="radio"><label><input type="radio" name="role" id="role1" value="guest">我想蹭饭</label></div>
          <div class="radio"><label><input type="radio" name="role" id="role2" value="host" checked>我能做饭</label></div>
          %end
        %end
      </div>

      <div class="form-group">
        <label for="title"><code>*</code> 标题</label>
        <input type="text" class="form-control" id="title" placeholder="快取一个吸引眼球的标题吧！" name="title" value="{{post["title"] if post else ""}}">
      </div>
      <div class="form-group">
        <label for="price"><code>*</code> 期望价格</label>
        <input type="text" class="form-control" id="price" placeholder="可以是区间哦" name="price" value="{{post["price"] if post else ""}}">
      </div>
      <div class="form-group">
        <label for="deliver_time"><code>*</code> 吃饭时间</label>
        <input type="text" class="form-control" id="eat_time" placeholder="你想什么时候吃到饭？5PM-7PM?" name="deliver_time" value="{{post["deliver_time"] if post else ""}}">
      </div>
      <div class="form-group">
        <label for="payment_method">支付方式</label>
        <input type="text" class="form-control" id="payment_method" placeholder="Square是一个很方便的转钱方式。。" name="payment_method" value="{{post["payment_method"] if post else ""}}">
      </div>
      <div class="form-group">
        <label for="deliver_method">Deliver方式</label>
        <input type="text" class="form-control" id="deliver_method" placeholder="自取/运送/来家蹭!" name="deliver_method" value="{{post["deliver_method"] if post else ""}}">
      </div>
      <div class="form-group">
        <label for="category">类型</label>
        <select class="form-control" id="category" name="category">
          <option value="中餐">中餐</option>
          <option value="西餐">西餐</option>
        </select>
      </div>
      <div class="form-group">
        <label for="phone">Phone Number</label>
        <input type="text" class="form-control" id="phone" placeholder="写下电话号码比较方便联系" name="phone" value="{{post["phone"] if post else ""}}">
      </div>
      <div class="form-group">
        <label for="wechat">微信</label>
        <input type="text" class="form-control" id="wechat" placeholder="微信~~" name="wechat" value="{{post["wechat"] if post else ""}}">
      </div>
      <div class="form-group">
        <label for="">特殊要求</label>
        <input type="text" class="form-control" id="requirements" placeholder="不吃辣 bulabula" name="requirements" value="{{post["requirements"] if post else ""}}">
      </div>

      <div class="form-group">
        <label for="body">还想说</label>
        <textarea class="form-control" rows="5" id="body" name="body" placeholder="还有什么想说的，写在这里吧！">{{post["body"] if post else ""}}</textarea>
      </div>

    </form>
    <form action="/upload" method="post" enctype="multipart/form-data">
      Category:      <input type="text" name="category" />
      Select a file: <input type="file" name="upload" />
      <input type="submit" value="Start upload" />
    </form>
  </div>
  <p>
  </p>
</body>

<script type="text/javascript">
$(document).ready(function() {
  $('#body').summernote({height: 150});
});
</script>

%include('footer.tpl')


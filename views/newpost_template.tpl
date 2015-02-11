%include('header.tpl', html_title='发布')


<!-- include summernote css/js-->
<link href="/static/summernote/summernote.css" rel="stylesheet">
<script src="/static/summernote/summernote.js"></script>

<div class="container" >
  <h2>发布</h2>
  <form role="form" action="/newpost" method="POST">
    <div class="form-group">
      <label for="title">标题</label>
      <input type="text" class="form-control" id="title" placeholder="快取一个吸引眼球的标题吧！" name="subject" value="{{subject}}">
    </div>
    <div class="form-group">
      <label for="price">期望价格</label>
      <input type="text" class="form-control" id="price" placeholder="可以是区间哦" name="price" value="{{price}}">
    </div>
    <div class="form-group">
      <label for="deliver_time">吃饭时间</label>
      <input type="text" class="form-control" id="price" placeholder="你想什么时候吃到饭？5PM-7PM?" name="price" value="{{price or ""}}">
    </div>
    <div class="form-group">
      <label for="payment_method">支付方式</label>
      <input type="text" class="form-control" id="price" placeholder="Square是一个很方便的转钱方式。。" name="payment_method" value="{{payment_method}}">
    </div>
    <div class="form-group">
      <label for="deliver_method">Deliver方式</label>
      <input type="text" class="form-control" id="price" placeholder="自取/运送/来家蹭!" name="payment_method" value="{{payment_method}}">
    </div>
    <div class="form-group">
      <label for="">特殊要求</label>
      <input type="text" class="form-control" id="price" placeholder="不吃辣 bulabula" name="payment_method" value="{{payment_method}}">
    </div>
    
    <div class="form-group">
  		<label for="body">还想说</label>
 		 <textarea class="form-control" rows="5" id="body" name="body" placeholder="还有什么想说的，写在这里吧！">{{body}}</textarea>
	</div>
	<div class="form-group">
      <label for="tags">Tags</label>
      <input type="text" class="form-control" id="tags" placeholder="写上标签，逗号隔开~" name="tags" value="{{tags}}">
    </div>


    <button type="submit" class="btn btn-default">Submit</button>
  </form>
</div>

<script type="text/javascript">
$(document).ready(function() {
  $('#body').summernote({height: 150});
});
</script>

%include('footer.tpl')


%include('header.tpl', html_title='发布')


<div class="container" >
  <h2>发布</h2>
  <form role="form" action="/newpost" method="POST">
    <div class="form-group">
      <label for="title">标题</label>
      <input type="text" class="form-control" id="title" placeholder="取一个吸引眼球的标题吧！" name="subject" value="{{subject}}">
    </div>
    <div class="form-group">
  		<label for="body">描述</label>
 		 <textarea class="form-control" rows="5" id="body" name="body" placeholder="有什么想说的，写在这里吧！">{{body}}</textarea>
	</div>
	<div class="form-group">
      <label for="tags">Tags</label>
      <input type="text" class="form-control" id="tags" placeholder="写上标签，逗号隔开~" name="tags" value="{{tags}}">
    </div>


    <button type="submit" class="btn btn-default">Submit</button>
  </form>
</div>

%include('footer.tpl')


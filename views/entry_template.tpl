%include('header.tpl', html_title='看看这个')

<h2>{{post['title']}} 
<a href="/updatepost/{{post['permalink']}}" type="submit" class="btn btn-success">修改</a>
<a href="/removepost/{{post['permalink']}}" type="submit" class="btn btn-danger">删除</a>
</h2>
Posted {{post['date']}}<i> By {{post['author']}}</i><br>
<hr>
{{!post['body']}}
<p>

<p>
<h3>Comments</h3>
<ul>
%if ('comments' in post):
%numComments = len(post['comments'])
%else:
%numComments = 0
%end
%for i in range(0, numComments):
<form action="/like" method="POST">
<input type="hidden" name="permalink", value="{{post['permalink']}}">
<input type="hidden" name="comment_ordinal", value="{{i}}">
Author: {{post['comments'][i]['author']}}<br>
Likes: {{post['comments'][i]['num_likes']}} <input type="submit" value="Like"></form><br>
{{post['comments'][i]['body']}}<br>
<hr>
%end
<h3>Add a comment</h3>

<form role="form" action="/newcomment" method="POST">

	<div class="form-group">
  		<label for="comment">Comment:</label>
  		<textarea class="form-control" rows="5" id="commentEmail" name="commentEmail">{{comment['body']}}</textarea>
	</div>

  <button type="submit" class="btn btn-default">Submit</button>
</form>


</ul>
<p></p>
<p></p>
<p></p>
<p></p>
<form action="/newcomment" method="POST">
<input type="hidden" name="permalink", value="{{post['permalink']}}">
{{errors}}
<b>Name</b> (required)<br>
<input type="text" name="commentName" size="60" value="{{comment['name']}}"><br>
<b>Email</b> (optional)<br>
<input type="text" name="commentEmail" size="60" value="{{comment['email']}}"><br>
<b>Comment</b><br>
<textarea name="commentBody" cols="60" rows="10">{{comment['body']}}</textarea><br>
<input type="submit" value="Submit">
</form>
%include('footer.tpl')



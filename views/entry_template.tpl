%include('header.tpl', html_title='看看这个')



<body>

    %include('nav.tpl')
    <div class="container" >
    <h2>
        <a href="#">{{post['title']}}</a>
    </h2>
    <p class="lead">
        By <a href="/user/profile/{{post['author']}}">{{post['author']}}</a>
    </p>
    <p><span class="glyphicon glyphicon-time"></span> {{post['date']}}</p>
    <hr>
    图片
    <hr>
    <p>角色 : {{post['role']}}</p>
    <p>期待价格 : {{post['price']}}</p>
    <p>吃饭时间 : {{post['deliver_time']}}</p>
    <p>类型 : {{post['category']}}</p>
    <p>支付方式 : {{post['payment_method']}}</p>
    <p>Deliver方式 : {{post['deliver_method']}}</p>
    <p>特殊要求 : {{post['requirements']}}</p>
    <p>详细描述 : </p>
    <div>{{!post['body']}}</div>

    <hr>
    <a class="btn btn-primary" href="/updatepost/{{post['permalink']}}">Edit Post <span class="glyphicon glyphicon-pencil"></span></a>
    <a class="btn btn-danger" href="/removepost/{{post['permalink']}}">Remove Post <span class="glyphicon glyphicon-trash"></span></a>

    <hr>

    <h3>Comments</h3>

    <div class="well">
       <div class="row">
          <div class="text-right">
            <a class="btn btn-success">Leave a Comment <span class="glyphicon glyphicon-comment"></span></a>
        </div>

        <hr>


        %if ('comments' in post):
        %numComments = len(post['comments'])
        %else:
        %numComments = 0
        %end
        %for i in range(0, numComments):
        <div class="col-md-12">
            {{post['comments'][i]['author']}}
            <span class="pull-right">10 days ago</span>
            <p>{{post['comments'][i]['body']}}</p>
        </div>
    </div>
    <hr>
    %end

</div>
</div>

<h3>Add a comment</h3>

<form role="form" action="/newcomment" method="POST">

   <div class="form-group">
    <label for="comment">Comment:</label>
    <textarea class="form-control" rows="5" id="commentEmail" name="commentEmail">{{comment['body']}}</textarea>
</div>

<button type="submit" class="btn btn-default">Submit</button>
</form>



<p></p>
<p></p>
<p></p>
<p></p>
<form action="/newcomment" method="POST">
    <input type="hidden" name="permalink", value="{{post['permalink']}}">
    %if (errors != ""):
    <div class="alert alert-danger" role="alert">{{errors}}</div>
    %end
    <b>Name</b> (required)<br>
    <input type="text" name="commentName" size="60" value="{{comment['name']}}"><br>
    <b>Email</b> (optional)<br>
    <input type="text" name="commentEmail" size="60" value="{{comment['email']}}"><br>
    <b>Comment</b><br>
    <textarea name="commentBody" cols="60" rows="10">{{comment['body']}}</textarea><br>
    <input type="submit" value="Submit">
</form>
</div>
</body>
%include('footer.tpl')



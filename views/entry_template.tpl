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
        % if username != post['author']:
        <a class="btn btn-primary disabled" href="/updatepost/{{post['permalink']}}">Edit Post <span class="glyphicon glyphicon-pencil"></span></a>
        <a class="btn btn-danger disabled" href="/removepost/{{post['permalink']}}">Remove Post <span class="glyphicon glyphicon-trash"></span></a>
        %else:
        <a class="btn btn-primary" href="/updatepost/{{post['permalink']}}">Edit Post <span class="glyphicon glyphicon-pencil"></span></a>
        <a class="btn btn-danger" href="/removepost/{{post['permalink']}}">Remove Post <span class="glyphicon glyphicon-trash"></span></a>
        %end
        <hr>

        <h3>Comments</h3>

        <div class="well">
           <div class="row">
            <form role="form"  action="/newcomment" method="POST">
               <div class="form-group">
                <input type="hidden" name="permalink", value="{{post['permalink']}}">
                <textarea rows="2" class="form-control" name="body"></textarea>
            </div>
            %if (errors != ""):
            <div class="alert alert-danger" role="alert">{{errors}}</div>
            %end
            <div class="text-right">
                <button type="submit" class="btn btn-success">Leave a Comment <span class="glyphicon glyphicon-comment"></span></button>
            </div>
        </form>

        <hr>


        %for comment in post['comments']:
        <div class="col-md-12">
            <a href="/user/profile/{{comment['author']}}">{{comment['author']}}</a>
            <span class="pull-right">{{comment['date']}}</span>
            <p>{{comment['body']}}</p>
        </div>
        <hr>
        %end

    </div>
</div>

</div>
</body>
%include('footer.tpl')



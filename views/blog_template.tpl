%include('header.tpl', html_title='首页')
%include('nav.tpl')
<body>
  <div class="container">
    <h2 style="text-align: center;">北美蹭饭网 - Beta</h2>
    <h2></h2>
    <!-- Nav tabs -->
    <div class="span12 centered-pills">
    <ul class="nav nav-pills center-pills" role="tablist">
      <li role="presentation" class="active"><a href="#home" aria-controls="home" role="tab" data-toggle="tab">要蹭饭的人</a></li>
      <li role="presentation"><a href="#profile" aria-controls="profile" role="tab" data-toggle="tab">能做饭的人</a></li>
    </ul>
    </div>

    <!-- Tab panes -->
    <div class="tab-content">
      <div role="tabpanel" class="tab-pane fade in active" id="home">
        <h3><span class="label label-primary">Today</span></h3>
        %for post in guest_posts:
        <div class="row">
          <div class="col-md-4">
           <h3><a href="/post/{{post['permalink']}}">{{post['title']}}</a><br></h3>
           价钱: {{post['price']}}<br>
           吃饭时间: {{post['deliver_time']}}<br>
           支付方式: {{post['payment_method']}}
         </div>
         <div class="col-md-4">
           <h3><br></h3>
           deliver方式: {{post['deliver_method']}}<br>
           特殊要求: {{post['requirements']}} <br>
           联系方式: 邮箱，电话，微信
         </div>
         <div class="col-md-4" style="text-align: right;">
           <br>
           <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#msgModal" data-whatever="{{post['author']}}">约饭</button>
           <a class="btn btn-primary" href="/post/{{post['permalink']}}">评论</a>
         </div>
       </div>
       <hr>
       %end
     </div>
     <div role="tabpanel" class="tab-pane fade" id="profile">
      <h3><span class="label label-primary">Today</span></h3>
      %for post in host_posts:
      <div class="row">
        <div class="col-md-4">
         <h3><a href="/post/{{post['permalink']}}">{{post['title']}}</a><br></h3>
         价钱: {{post['price']}}<br>
         吃饭时间: {{post['deliver_time']}}<br>
         支付方式: {{post['payment_method']}}
       </div>
       <div class="col-md-4">
         <h3><br></h3>
         deliver方式: {{post['deliver_method']}}<br>
         特殊要求: {{post['requirements']}} <br>
         联系方式: 邮箱，电话，微信
       </div>
       <div class="col-md-4" style="text-align: right;">
         <br>
         <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#msgModal" data-whatever="{{post['author']}}">约饭</button>
         <a class="btn btn-primary" href="/post/{{post['permalink']}}">评论</a>
       </div>
     </div>
     <hr>
     %end
   </div>
 </div>

</div>


<div class="modal fade" id="msgModal" tabindex="-1" role="dialog" aria-labelledby="msgModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="msgModalLabel">New message</h4>
      </div>
      <div class="modal-body">
        <form action="/message/new" method="post">
          <div class="form-group">
            <label for="recipient-name" class="control-label">Recipient:</label>
            <input type="text" class="form-control" name="to" id="recipient-name">
          </div>
          <div class="form-group">
            <label for="message-text" class="control-label">Message:</label>
            <textarea class="form-control" name="body" id="message-text"></textarea>
          </div>
          <div class="modal-footer">
            <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
            <button type="submit" class="btn btn-primary">Send message</button>
          </div>
        </form>
      </div>

    </div>
  </div>
</div>


</body>
<script>
$('#msgModal').on('show.bs.modal', function (event) {
  var button = $(event.relatedTarget) // Button that triggered the modal
  var recipient = button.data('whatever') // Extract info from data-* attributes
  // If necessary, you could initiate an AJAX request here (and then do the updating in a callback).
  // Update the modal's content. We'll use jQuery here, but you could use a data binding library or other methods instead.
  var modal = $(this)
  modal.find('.modal-title').text('New message to ' + recipient)
  modal.find('.modal-body input').val(recipient)
})
</script>

%include('footer.tpl')




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
    <div class="tab-content index">
      <div role="tabpanel" class="tab-pane fade in active" id="home">



        %last_day = today.day - 1
        %for post in guest_posts:

        % if post['deliver_time'].date().day != last_day:
        <div class="row">
          <div class="col-md-1"><div class="calendar">7 <em>Feb</em></div></div>
          <div class="col-md-6"><h3>Feb 7 星期六</h3></div>
        </div>
        %end
        %last_day = post['deliver_time'].date().day

        <div class="row">
          <div class="col-md-6 col-md-offset-1">
           <h3><a href="/post/{{post['permalink']}}">{{post['title']}}</a></h3>
           <span class="label label-primary">价钱:{{post['price']}}</span>
           <span class="label label-primary">吃饭时间:{{post['deliver_time']}}</span>
           <span class="label label-primary">支付方式:{{post['payment_method']}}</span>
           <span class="label label-primary">deliver方式:{{post['deliver_method']}}</span>
         </div>
         <div class="col-md-3 col-md-offset-1">
           <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#msgModal" data-whatever="{{post['author']}}">约饭</button>
           <a class="btn btn-primary" href="/post/{{post['permalink']}}">评论</a>
         </div>
       </div>
       <hr>
       %end
     </div>
     <div role="tabpanel" class="tab-pane fade" id="profile">
      <div class="row">
        <div class="col-md-1"><div class="calendar">7 <em>Feb</em></div></div>
        <div class="col-md-6"><h3>Feb 7 星期六</h3></div>
      </div>
      %for post in host_posts:
      <div class="row">
        <div class="col-md-6 col-md-offset-1">
         <h3><a href="/post/{{post['permalink']}}">{{post['title']}}</a></h3>
         <span class="label label-primary">价钱:{{post['price']}}</span>
         <span class="label label-primary">吃饭时间:{{post['deliver_time']}}</span>
         <span class="label label-primary">支付方式:{{post['payment_method']}}</span>
         <span class="label label-primary">deliver方式:{{post['deliver_method']}}</span>
       </div>
       <div class="col-md-3 col-md-offset-1">
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




<div >

  <div>
    <button type="button" class="btn btn-primary" data-toggle="modal" data-target=".bs-example-modal-lg">Compose</button><p>
    <div class="modal fade bs-example-modal-lg" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true">
      <div class="modal-dialog">
        <div class="modal-content">

          <div class="modal-header">
            <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
            <h4 class="modal-title" id="msgModalLabel">New message</h4>
          </div>
          <div class="modal-body">
            <form action="/message/new" method="post">
              <div class="form-group">
                <label for="recipient-name" class="control-label">To:</label>
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
  </div>
  <div class="comments-list">
    %for message in message_list:
    <div class="media">
     <p class="pull-right"><small>{{message["date"]}}</small></p>
     <div class="media-body">
      <h4 class="media-heading user_name">From {{message["from"]}}</h4>
      {{message["body"]}}
      <p><small><a href="/message/{{message["_id"]}}">展开对话</a> - <a href="">回复</a></small></p>
    </div>
  </div>
  %end
</div>
</div>

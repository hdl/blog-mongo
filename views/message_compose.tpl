  <div>
    <div class="text-right">
    <button type="button" class="btn btn-primary" data-toggle="modal" data-target=".bs-example-modal-lg">Compose</button><p>
  </div>
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

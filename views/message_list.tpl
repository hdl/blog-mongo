<div >

  <div class="comments-list">
    %for message in message_list:
    <div class="media">
     <p class="pull-right"><small>{{message["date"]}}</small></p>
     <div class="media-body">
      %if message["from"]==username:
      <h4 class="media-heading user_name">发送给 {{message["to"]}}</h4>
      %else:
      <h4 class="media-heading user_name">来自 {{message["from"]}}</h4>
      %end
      {{message["body"]}}
      %if is_group==0:
      <p><small><a href="/message/{{message["_id"]}}">展开对话</a> - <a href="/message/{{message["_id"]}}">回复</a> - <a href="/message/remove/{{message["message_group_id"]}}">删除</a></small></p>
      %else:
      <p></p>
      %end
    </div>
  </div>
  %end
</div>
</div>

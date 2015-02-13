%include('header.tpl', html_title='首页')
%include('nav.tpl')
<body>
  <div class="container">

    <ul class="nav nav-pills" style="margin-left:40%" align="center">
      <li id="guest_li" class="active"><a href="#" onclick="guestFunction();">要蹭饭的人</a></li>
      <li id="host_li" ><a href="#" onclick="hostFunction();" >能做饭的人</a></li>
    </ul>

    <nav>
      <ul class="pager">
        <li class="previous"><a href="#"><span aria-hidden="true">&larr;</span> Future</a></li>
        <li class="next"><a href="#"> Past<span aria-hidden="true">&rarr;</span></a></li>
      </ul>
    </nav>

    <h2>Today: </h2>         
    <div id="guest">
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
       <div class="col-md-4"> 
         <h3><br></h3>
         <a class="btn btn-success">勾搭</a> 
         <a class="btn btn-success" href="/post/{{post['permalink']}}">评论</a>
       </div>
     </div>
     <hr>
     %end
   </div>
   <div id="host" style="display: none">
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
     <div class="col-md-4"> 
       <h3><br></h3>
       <a class="btn btn-success">勾搭</a> 
       <a class="btn btn-success" href="/post/{{post['permalink']}}">评论</a>
     </div>
   </div>
   <hr>
   %end
 </div>

</div>
</body>
<script>
function guestFunction() {
  document.getElementById('host').style.display = "none";
  document.getElementById('guest').style.display = "block";
  document.getElementById("host_li").className = "";
  document.getElementById("guest_li").className = "active";

};
function hostFunction() {
  document.getElementById('host').style.display = "block";
  document.getElementById('guest').style.display = "none";
  document.getElementById("host_li").className = "active";
  document.getElementById("guest_li").className = "";
};

</script>

%include('footer.tpl')




%include('header.tpl', html_title='首页')

<div class="container">
  <ul class="nav nav-pills" style="margin-left:40%" align="center">
    <li class="active"><a href="#">要蹭饭的人</a></li>
    <li><a href="#">能做饭的人</a></li>
  </ul>


  <h2>Today: </h2>         

    	%for post in myposts:
    		<div class="row">
    			<div class="col-md-4"> 
        			<h3><a href="/post/{{post['permalink']}}">{{post['title']}}</a><br></h3>
        			价钱: {{post['price']}}<br>
        			时间: {{post['deliver_time']}}<br>
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
        			<button type="submit" class="btn btn-success">勾搭</button> 
        			<button type="submit" class="btn btn-success">评论</button>
        		</div>
        	</div>
        	<hr>
		%end

</div>

%include('footer.tpl')




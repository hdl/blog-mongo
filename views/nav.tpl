%if (username != None):
<nav class="navbar navbar-inverse">
  <div class="container-fluid">
    <div class="navbar-header">
      <a class="navbar-brand" href="/#">北美蹭饭网</a>
    </div>
    <div>
      <ul class="nav navbar-nav">
      	<li><a href="/user/profile/{{username}}">{{username}}</a></li>
        <li><a href="/newpost">我要发布！</a></li>
      </ul>
      <ul class="nav navbar-nav navbar-right">
        <li><a href="/logout"><span class="glyphicon glyphicon-log-out"></span> Logout</a></li>
      </ul>
    </div>
  </div>
</nav>
%else :
<nav class="navbar navbar-inverse">
  <div class="container-fluid">
    <div class="navbar-header">
      <a class="navbar-brand" href="#">北美蹭饭网</a>
    </div>
    <div>
      <ul class="nav navbar-nav">
        <li><a href="/newpost">我要发布！</a></li>
      </ul>
      <ul class="nav navbar-nav navbar-right">
        <li><a href="/signup"><span class="glyphicon glyphicon-user"></span> Sign Up</a></li>
        <li><a href="/login"><span class="glyphicon glyphicon-log-in"></span> Login</a></li>
      </ul>
    </div>
  </div>
</nav>
%end

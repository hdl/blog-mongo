%if (username != None):
<nav class="navbar navbar-default">
  <div class="container-fluid">
    <!-- Brand and toggle get grouped for better mobile display -->
    <div class="navbar-header">
      <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
        <span class="sr-only">Toggle navigation</span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
      </button>
      <a class="navbar-brand" href="/"><span class="glyphicon glyphicon-cutlery"></span></a>
    </div>

    <!-- Collect the nav links, forms, and other content for toggling -->
    <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
      <form class="navbar-form navbar-left" role="search">
        <div class="form-group">
          <input type="text" class="form-control" placeholder="Search for ...">
        </div>
      </form>
      <ul class="nav navbar-nav navbar-right">
        <li><a href="/feedback">Feedback</a></li>
        <li><a href="/user/home"><strong>{{username}}</strong></a></li>

        <li class="dropdown">
          <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false"><span class="glyphicon glyphicon-plus"></span><span class="caret"></span></a>
          <ul class="dropdown-menu" role="menu">
            <li><a href="/newpost?role=guest">我想蹭饭</a></li>
            <li><a href="/newpost?role=host">我能做饭</a></li>
          </ul>
        </li>
        <li><a href="/message"><span class="glyphicon glyphicon-envelope"></span></a></li>
        <li><a href="/user/setting"><span class="glyphicon glyphicon-cog"></span></a></li>
        <li><a href="/logout"><span class="glyphicon glyphicon-log-out"></span></a></li>
      </ul>
    </div><!-- /.navbar-collapse -->
  </div><!-- /.container-fluid -->
</nav>
%else :
<nav class="navbar navbar-default">
  <div class="container-fluid">
    <!-- Brand and toggle get grouped for better mobile display -->
    <div class="navbar-header">
      <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
        <span class="sr-only">Toggle navigation</span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
      </button>
      <a class="navbar-brand" href="/"><span class="glyphicon glyphicon-cutlery"></a>
    </div>

    <!-- Collect the nav links, forms, and other content for toggling -->
    <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
      <form class="navbar-form navbar-left" role="search">
        <div class="form-group">
          <input type="text" class="form-control" placeholder="Search for ...">
        </div>
      </form>
      <ul class="nav navbar-nav navbar-right">
        <li><a href="/feedback">Feedback</a></li>
        <li><a href="/signup"><strong>注册</strong></a></li>

        <li class="dropdown">
          <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false"><span class="glyphicon glyphicon-plus"></span><span class="caret"></span></a>
          <ul class="dropdown-menu" role="menu">
            <li><a href="/newpost">我想蹭饭</a></li>
            <li><a href="/newpost">我能做饭</a></li>
          </ul>
        </li>
        <li><a href="/user/message"><span class="glyphicon glyphicon-envelope"></span></a></li>
        <li><a href="/user/setting"><span class="glyphicon glyphicon-cog"></span></a></li>
        <li><a href="/logout"><span class="glyphicon glyphicon-log-in"></span></a></li>

      </ul>
    </div><!-- /.navbar-collapse -->
  </div><!-- /.container-fluid -->
</nav>
%end




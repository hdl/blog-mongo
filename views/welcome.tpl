
%include('header.tpl', html_title='Welcome')

<body>
Welcome {{username}}
<p>
<ul>
<li><a href="/">北美蹭饭网 首页</a></li>
<li><a href="/user/home">User Home</a></li>
<li><a href="/logout">Logout</a></li>
<li>
<a href="/newpost">Create a New Post</a>
</li>


</body>

%include('footer.tpl')

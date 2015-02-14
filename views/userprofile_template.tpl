%include('header.tpl', html_title='Profile')
%include('nav.tpl')
<body>
  <div class="container">
  <h3>{{profile_username}}</h3>
  %include('userhistory_template.tpl')
  </div>
</body>


%include('footer.tpl')




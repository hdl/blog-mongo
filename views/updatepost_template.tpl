%include('header.tpl', html_title='更新')
<script src="//cdn.ckeditor.com/4.4.7/standard/ckeditor.js"></script>

<form action="/updatepost" method="POST">
{{errors}}
<h2>Title</h2>
<input type="text" name="subject" size="120" value="{{subject}}"><br>
<h2>Blog Entry<h2>
<textarea name="body" cols="120" rows="20">{{body}}</textarea><br>
<script>
    CKEDITOR.replace( 'body', {
    width: 750,
	});
 </script>

<h2>Tags</h2>
Comma separated, please<br>
<input type="text" name="tags" size="120" value="{{tags}}"><br>
<p>
<input type="text" name="permalink" value="{{permalink}}"><br>
<input type="submit" value="Submit">

%include('footer.tpl')


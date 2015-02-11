<!DOCTYPE html>
<html>
<head>
<title>北美蹭饭网</title>
</head>
<body>

%if (username != None):
Welcome {{username}} | <a href="http://www.usc.edu">Univeristy of Southern California</a> | <a href="/logout">Logout</a> | <a href="/newpost">我想蹭饭</a> | <a href="/newpost">我能做饭</a><p>
%end

<h1 align="center">北美蹭饭网</h1>
<h2 align="center">看蹭饭的人  看能蹭的饭</h2>

%for post in myposts:
<h2><a href="/post/{{post['permalink']}}">{{post['title']}}</a></h2>
Posted {{post['post_date']}} <i>By {{post['author']}}</i><br>
Comments: 
%if ('comments' in post):
%numComments = len(post['comments'])
%else:
%numComments = 0
%end
<a href="/post/{{post['permalink']}}">{{numComments}}</a>
<hr>
{{!post['body']}}
<p>
<p>
<em>Tags: </em>: 
%if ('tags' in post):
%for tag in post['tags'][0:1]:
<a href="/tag/{{tag}}">{{tag}}</a>
%for tag in post['tags'][1:]:
, <a href="/tag/{{tag}}">{{tag}}</a>
%end
%end

<p>
%end
</body>
</html>



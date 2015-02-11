<!DOCTYPE html>
<html>
<head>
<title>北美蹭饭网 - {{html_title}}</title>
</head>
<body>

%if (username != None):
Welcome {{username}} | <a href="http://www.usc.edu">Univeristy of Southern California</a> | <a href="/logout">Logout</a> | <a href="/newpost">我想蹭饭</a> | <a href="/newpost">我能做饭</a> | <a href="/">首页</a><p>
%else :
<a href="/login">Login</a> | <a href="/signup">signup</a><p>
%end
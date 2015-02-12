
#
# Copyright (c) 2008 - 2013 10gen, Inc. <http://10gen.com>
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#   http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#
#



import pymongo
import blogPostDAO
import sessionDAO
import userDAO
import bottle
import cgi
import re



__author__ = 'aje'


# General Discussion on structure. This program implements a blog. This file is the best place to start to get
# to know the code. In this file, which is the controller, we define a bunch of HTTP routes that are handled
# by functions. The basic way that this magic occurs is through the decorator design pattern. Decorators
# allow you to modify a function, adding code to be executed before and after the function. As a side effect
# the bottle.py decorators also put each callback into a route table.

# These are the routes that the blog must handle. They are decorated using bottle.py
@bottle.route('/static/<filepath:path>')
def server_static(filepath):
    return bottle.static_file(filepath, root='static')

# This route is the main page of the blog
@bottle.route('/')
def blog_index():

    cookie = bottle.request.get_cookie("session")

    username = sessions.get_username(cookie)

    # even if there is no logged in user, we can show the blog
    guest_list = posts.get_posts_by_role("guest", 10)
    host_list = posts.get_posts_by_role("host", 10)

    return bottle.template('blog_template', dict(guest_posts=guest_list,host_posts=host_list, username=username))

# The main page of the blog, filtered by tag
@bottle.route('/tag/<tag>')
def posts_by_tag(tag="notfound"):

    cookie = bottle.request.get_cookie("session")
    tag = cgi.escape(tag)

    username = sessions.get_username(cookie)

    # even if there is no logged in user, we can show the blog
    l = posts.get_posts_by_tag(tag, 10)

    return bottle.template('blog_template', dict(myposts=l, username=username))


# Displays a particular blog post
@bottle.get("/post/<permalink>")
def show_post(permalink="notfound"):

    cookie = bottle.request.get_cookie("session")

    username = sessions.get_username(cookie)
    permalink = cgi.escape(permalink)

    print "about to query on permalink = ", permalink
    post = posts.get_post_by_permalink(permalink)

    if post is None:
        bottle.redirect("/post_not_found")

    # init comment form fields for additional comment
    comment = {'name': "", 'body': "", 'email': ""}

    return bottle.template("entry_template", dict(post=post, username=username, errors="", comment=comment))


# used to process a comment on a blog post
@bottle.post('/newcomment')
def post_new_comment():
    name = bottle.request.forms.get("commentName")
    email = bottle.request.forms.get("commentEmail")
    body = bottle.request.forms.get("commentBody")
    permalink = bottle.request.forms.get("permalink")

    post = posts.get_post_by_permalink(permalink)
    cookie = bottle.request.get_cookie("session")

    username = sessions.get_username(cookie)

    # if post not found, redirect to post not found error
    if post is None:
        bottle.redirect("/post_not_found")
        return

    # if values not good, redirect to view with errors

    if name == "" or body == "":
        # user did not fill in enough information

        # init comment for web form
        comment = {'name': name, 'email': email, 'body': body}

        errors = "Post must contain your name and an actual comment."
        return bottle.template("entry_template", dict(post=post, username=username, errors=errors, comment=comment))

    else:

        # it all looks good, insert the comment into the blog post and redirect back to the post viewer
        posts.add_comment(permalink, name, email, body)

        bottle.redirect("/post/" + permalink)

# used to process a like on a blog post
@bottle.post('/like')
def post_comment_like():
    permalink = bottle.request.forms.get("permalink")
    permalink = cgi.escape(permalink)

    comment_ordinal_str = bottle.request.forms.get("comment_ordinal")

    comment_ordinal = int(comment_ordinal_str)

    post = posts.get_post_by_permalink(permalink)
    if post is None:
        bottle.redirect("/post_not_found")
        return

    # it all looks good. increment the ordinal
    posts.increment_likes(permalink, comment_ordinal)

    bottle.redirect("/post/" + permalink)



@bottle.get("/post_not_found")
def post_not_found():
    return "Sorry, post not found"


# Displays the form allowing a user to add a new post. Only works for logged in users
@bottle.get('/newpost')
def get_newpost():

    cookie = bottle.request.get_cookie("session")
    username = sessions.get_username(cookie)  # see if user is logged in
    if username is None:
        bottle.redirect("/login")

    return bottle.template("newpost_template", dict(role="guest", subject="", price="", deliver_method="", deliver_time="", 
        payment_method="", requirements="", body = "", errors="", tags="", username=username),
        phone="", wechat="")

#
# Post handler for setting up a new post.
# Only works for logged in user.
@bottle.post('/newpost')
def post_newpost():
    role = bottle.request.forms.get("role")
    title = bottle.request.forms.get("subject")
    body = bottle.request.forms.get("body")
    tags = bottle.request.forms.get("tags")
    price = bottle.request.forms.get("price")
    deliver_time = bottle.request.forms.get("deliver_time")
    payment_method = bottle.request.forms.get("payment_method")
    deliver_method = bottle.request.forms.get("deliver_method")
    requirements = bottle.request.forms.get("requirements")
    phone = bottle.request.forms.get("phone")
    wechat = bottle.request.forms.get("wechat")
    
    
    cookie = bottle.request.get_cookie("session")
    username = sessions.get_username(cookie)  # see if user is logged in
    if username is None:
        bottle.redirect("/login")

    errors=''
    if title == "": 
        errors += 'Need a tile name!\n'
    if deliver_time == "":
        errors += "When do you want to eat!\n"
    if price == "":
        errors += "Price ???\n"
    if errors is not '':
        return bottle.template("newpost_template", dict(role=role, subject=title, username=username, price=price, deliver_time=deliver_time,
                                                        payment_method=payment_method, deliver_method=deliver_method,requirements=requirements,
                                                        body=body, tags=tags, phone=phone, wechat=wechat, errors=errors))

    # extract tags
    tags = cgi.escape(tags)
    tags_array = extract_tags(tags)
    
    # prepare for the post, TODO: this should be done in DAO class
    post = {    "role":role,
                "title": title,
                "author": username,
                "body": body,
                "price": price,
                "deliver_time":deliver_time,
                "payment_method": payment_method, 
                "deliver_method": deliver_method,
                "requirements": requirements,
                "body": body,
                "tags": tags_array,
                "phone": phone,
                "wechat": wechat}

    permalink = posts.insert_entry(post)

    # now bottle.redirect to the blog permalink
    bottle.redirect("/post/" + permalink)

# update a particular blog post
@bottle.get("/removepost/<permalink>")
def remove_post(permalink="notfound"):

    cookie = bottle.request.get_cookie("session")

    username = sessions.get_username(cookie)
    permalink = cgi.escape(permalink)

    post = posts.remove_post_by_permalink(permalink)
    bottle.redirect("/")

# update a particular blog post
@bottle.get("/updatepost/<permalink>")
def update_get(permalink="notfound"):

    cookie = bottle.request.get_cookie("session")

    username = sessions.get_username(cookie)
    permalink = cgi.escape(permalink)

    print "(update)about to query on permalink = ", permalink
    post = posts.get_post_by_permalink(permalink)

    if post is None:
        bottle.redirect("/post_not_found")
    tags = ""
    for tag in post["tags"]:
        tags = tags + "," + tag
    tags = tags[1:]
    return bottle.template("updatepost_template", dict(role=post['role'], subject=post['title'], username=post['author'], price=post['price'], 
                                                        deliver_time=post['deliver_time'],payment_method=post['payment_method'], deliver_method=post['deliver_method'],requirements=post['requirements'],
                                                        body=post['body'], tags=post['tags'], phone=post['phone'], wechat=post['wechat'], permalink=permalink, errors=""))

@bottle.post("/updatepost")
def update_post():
    role = bottle.request.forms.get("role")
    title = bottle.request.forms.get("subject")
    body = bottle.request.forms.get("body")
    tags = bottle.request.forms.get("tags")
    price = bottle.request.forms.get("price")
    deliver_time = bottle.request.forms.get("deliver_time")
    payment_method = bottle.request.forms.get("payment_method")
    deliver_method = bottle.request.forms.get("deliver_method")
    requirements = bottle.request.forms.get("requirements")
    phone = bottle.request.forms.get("phone")
    wechat = bottle.request.forms.get("wechat")
    permalink = bottle.request.forms.get("permalink")
    
    
    cookie = bottle.request.get_cookie("session")
    username = sessions.get_username(cookie)  # see if user is logged in
    if username is None:
        bottle.redirect("/login")

    errors=''
    if title == "": 
        errors += 'Need a tile name!\n'
    if deliver_time == "":
        errors += "When do you want to eat!\n"
    if price == "":
        errors += "Price ???\n"
    if errors is not '':
        return bottle.template("newpost_template", dict(role=role, subject=title, username=username, price=price, deliver_time=deliver_time,
                                                        payment_method=payment_method, deliver_method=deliver_method,requirements=requirements,
                                                        body=body, tags=tags, phone=phone, wechat=wechat, permalink=permalink, errors=errors))

    # extract tags
    tags = cgi.escape(tags)
    tags_array = extract_tags(tags)
    
    # prepare for the post, TODO: this should be done in DAO class
    post = {    "role":role,
                "title": title,
                "author": username,
                "body": body,
                "price": price,
                "deliver_time":deliver_time,
                "payment_method": payment_method, 
                "deliver_method": deliver_method,
                "requirements": requirements,
                "body": body,
                "tags": tags_array,
                "phone": phone,
                "wechat": wechat}

    posts.update_entry(permalink, post)

    # now bottle.redirect to the blog permalink
    bottle.redirect("/post/" + permalink)

# displays the initial blog signup form
@bottle.get('/signup')
def present_signup():
    return bottle.template("signup",
                           dict(email="", password="",
                                username="", errors=""))

# displays the initial blog login form
@bottle.get('/login')
def present_login():
    return bottle.template("login",
                           dict(username="", email="", password="",
                                login_error=""))

# handles a login request
@bottle.post('/login')
def process_login():

    email = bottle.request.forms.get("email")
    password = bottle.request.forms.get("password")

    print "user submitted ", email, "pass ", password

    user_record = users.validate_login(email, password)
    if user_record:
        # email is stored in the user collection in the _id key
        session_id = sessions.start_session(user_record['_id'])

        if session_id is None:
            bottle.redirect("/internal_error")

        cookie = session_id

        # Warning, if you are running into a problem whereby the cookie being set here is
        # not getting set on the redirect, you are probably using the experimental version of bottle (.12).
        # revert to .11 to solve the problem.
        bottle.response.set_cookie("session", cookie)

        bottle.redirect("/welcome")

    else:
        return bottle.template("login",
                               dict(email=email, password="",
                                    login_error="Invalid Login"))


@bottle.get('/internal_error')
@bottle.view('error_template')
def present_internal_error():
    return {'error':"System has encountered a DB error"}


@bottle.get('/logout')
def process_logout():

    cookie = bottle.request.get_cookie("session")

    sessions.end_session(cookie)

    bottle.response.set_cookie("session", "")


    bottle.redirect("/signup")


@bottle.post('/signup')
def process_signup():

    email = bottle.request.forms.get("email")
    username = bottle.request.forms.get("username")
    password = bottle.request.forms.get("password")
    verify = bottle.request.forms.get("verify")

    # set these up in case we have an error case
    errors=""

    errors = validate_signup(email, password, verify, username)
    if errors == "":

        if not users.add_user(email, password, username):
            # this was a duplicate
            errors= "email already in use. Please choose another"
            return bottle.template("signup", dict(username=username, email=email,
                                    errors=errors))

        session_id = sessions.start_session(username)
        print session_id
        bottle.response.set_cookie("session", session_id)
        bottle.redirect("/welcome")
    else:
        print "user did not validate in validate_signup()"
        return bottle.template("signup", dict(username=username, email=email,
                                    errors=errors))



@bottle.get("/welcome")
def present_welcome():
    # check for a cookie, if present, then extract value

    cookie = bottle.request.get_cookie("session")
    username = sessions.get_username(cookie)  # see if user is logged in
    if username is None:
        print "welcome: can't identify user...redirecting to signup"
        bottle.redirect("/signup")

    return bottle.template("welcome", {'username': username})



# Helper Functions

#extracts the tag from the tags form element. an experience python programmer could do this in  fewer lines, no doubt
def extract_tags(tags):

    whitespace = re.compile('\s')

    nowhite = whitespace.sub("",tags)
    tags_array = nowhite.split(',')

    # let's clean it up
    cleaned = []
    for tag in tags_array:
        if tag not in cleaned and tag != "":
            cleaned.append(tag)

    return cleaned


# validates that the user information is valid for new signup, return True of False
# and fills in the error string if there is an issue
def validate_signup(email, password, verify, username):

    EMAIL_RE = re.compile(r"^[\S]+@[\S]+\.[\S]+$")
    errors=""
    if not 4<=len(username)<=20:
        errors += "User Name Length: 4-20<br>"
    if not 4<=len(password)<=20:
        errors  += "Password Length: 4-20<br>"
    if password != verify:
        errors += "password must match<br>"
    if email != "":
        if not EMAIL_RE.match(email):
            errors += "invalid email address<br>"
    return errors



connection_string = "mongodb://localhost"
connection = pymongo.MongoClient(connection_string)
database = connection.blog

posts = blogPostDAO.BlogPostDAO(database)
users = userDAO.UserDAO(database)
sessions = sessionDAO.SessionDAO(database)


bottle.debug(True)
bottle.run(host='', port=80)         # Start the webserver running and wait for requests


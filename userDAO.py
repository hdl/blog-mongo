# -*- coding: utf-8 -*-

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
import hmac
import random
import string
import hashlib
import pymongo
from mail import *
import urllib


# The User Data Access Object handles all interactions with the User collection.
class UserDAO:

    def __init__(self, db):
        self.db = db
        self.users = self.db.users
        self.SECRET = 'verysecret'

    # makes a little salt
    def make_salt(self):
        salt = ""
        for i in range(5):
            salt = salt + random.choice(string.ascii_letters)
        return salt

    # implement the function make_pw_hash(name, pw) that returns a hashed password
    # of the format:
    # HASH(pw + salt),salt
    # use sha256

    def make_pw_hash(self, pw,salt=None):
        if salt == None:
            salt = self.make_salt();
        return hashlib.sha256(pw + salt).hexdigest()+","+ salt

    # Validates a user login. Returns user record or None
    def validate_login(self, email, password):

        user = None
        try:
            user = self.users.find_one({'_id': email})
            print user
        except:
            print "Unable to query database for user"

        if user is None:
            print "User not in database"
            return None

        salt = user['password'].split(',')[1]

        if user['password'] != self.make_pw_hash(password, salt):
            print "user password is not a match"
            return None

        # Looks good
        return user


    # creates a new user in the users collection
    def add_user(self, email, password, username):
        password_hash = self.make_pw_hash(password)
        verifiy_string = self.get_random_str(32)
        #TODO: also need to guarantee unique user name
        user = {'_id': email, 'password': password_hash, 'username':username, "status":0, "verifiy_string":verifiy_string} #0:unverify #verified
        url_dict = {'email':email, 'key':verifiy_string}
        try:
            self.users.insert(user, safe=True)
            send_email(email, "Email Verification", "http://cengfan.us/user/verify?"+urllib.urlencode(url_dict))
        except pymongo.errors.OperationFailure:
            print "oops, mongo error"
            return False
        except pymongo.errors.DuplicateKeyError as e:
            print "oops, username is already taken"
            return False
        send_email("maoze365@gmail.com", "有人注册啦", str(user))
        return True
    def get_posts_id_by_role(self, profile_username, role):
        user = self.users.find_one({'username': profile_username})
        post_id_list=[]

        try:
            if user is not None:
                post_id_list = user[role]
        except:
            post_id_list = []
        return post_id_list
    def get_random_str(self, num_chars):
        random_string = ""
        for i in range(num_chars):
            random_string = random_string + random.choice(string.ascii_letters)
        return random_string
        # returns an array of num_posts posts, reverse ordered
    def get_user_by_username(self, username):
        user = self.users.find_one({'username': username})
        return user
    def get_user_by_email(self, email):
        user = self.users.find_one({'_id': email})
        return user
    def user_email_verify(self, email, verifiy_string):
        user = self.users.find_one({'_id': email})
        if user["verifiy_string"] == verifiy_string:
            self.users.update({"_id": email}, {"$set": {"status": 1}});
            return True
        else:
            return False



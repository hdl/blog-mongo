__author__ = 'aje'


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

import sys
import re
import datetime



# The Blog Post Data Access Object handles interactions with the Posts collection
class BlogPostDAO:

    # constructor for the class
    def __init__(self, database):
        self.db = database
        self.posts = database.posts

    # inserts the blog entry and returns a permalink for the entry
    def insert_entry(self, post):
        print "inserting blog entry", post["title"]

        # add addition info
        post["permalink"]= "a-copy-of-id"
        post["comments"]= []
        post["date"]=datetime.datetime.utcnow()

        # now insert the post
        try:
            post_id = self.posts.insert(post)
            print "Inserting the post"
            #update permalink to _id, TODO: optimize to 1 time database operations
            self.posts.update({"_id": post_id}, {"$set": {"permalink": str(post_id)}});
        except:
            print "Error inserting post"
            print "Unexpected error:", sys.exc_info()[0]

        return str(post_id)
    def update_entry(self, permalink, post):
        print "updating blog entry"

        # now update the post
        try:
            print "Updating the post"
            #self.posts.update({"permalink": permalink}, {"$set": {});
            self.posts.update({'permalink': permalink}, {'$set': post})
        except:
            print "Error updating post"
            print "Unexpected error:", sys.exc_info()[0]


    # returns an array of num_posts posts, reverse ordered
    def get_posts(self, num_posts):

        cursor = self.posts.find().sort('date', direction=1).limit(num_posts)
        l = []

        for post in cursor:
            try:
                if 'comments' not in post:
                    post['comments'] = []
                l.append(post)
            except:
                print "key error in post ",str(post['_id'])
                continue

        return l
    # returns an array of num_posts posts, reverse ordered, filtered by role
    def get_posts_by_role(self, role, day_offset):

        #cursor = self.posts.find({'role':role}).sort('date', direction=1)
        today= datetime.date.today()
        today_datetime = datetime.datetime(today.year, today.month, today.day)
        start = today_datetime
        end = today_datetime + datetime.timedelta(hours=24*(day_offset))

        cursor = self.posts.find({"$and":[{'deliver_time': {'$gte': start, '$lt': end}}, {'role':role}]}).sort('deliver_time', direction=1)
        l = []

        for post in cursor:
            if 'comments' not in post:
                post['comments'] = []

            l.append(post)

        return l
    def get_posts_for_profile(self, username, role):

        cursor = self.posts.find({role:username}).sort('date', direction=-1)
        l = []

        for post in cursor:
            if 'comments' not in post:
                post['comments'] = []

            l.append(post)

        return l
        # add a comment to a particular blog post
    def add_guest_or_host(self, permalink, role, username):

        try:
            last_error = self.posts.update({'permalink': permalink}, {'$addToSet': {role: username}}, upsert=True,
                                           manipulate=False, safe=True)

            return last_error['n']          # return the number of documents updated

        except:
            print "Could not update the collection, error"
            print "Unexpected error:", sys.exc_info()[0]
            return 0
    def remove_guest_or_host(self, permalink, role, username):

        try:
            last_error = self.posts.update({'permalink': permalink}, {'$pull': {role: username}}, upsert=False,
                                           manipulate=False, safe=True)

            return last_error['n']          # return the number of documents updated

        except:
            print "Could not update the collection, error"
            print "Unexpected error:", sys.exc_info()[0]
            return 0
    # returns an array of num_posts posts, reverse ordered, filtered by tag
    def get_posts_by_tag(self, tag, num_posts):

        cursor = self.posts.find({'tags':tag}).sort('date', direction=-1).limit(num_posts)
        l = []

        for post in cursor:
            if 'comments' not in post:
                post['comments'] = []

            l.append({'title': post['title'], 'body': post['body'], 'post_date': post['date'],
                      'permalink': post['permalink'],
                      'tags': post['tags'],
                      'author': post['author'],
                      'comments': post['comments']})

        return l

    # find a post corresponding to a particular permalink
    def get_post_by_permalink(self, permalink):
        #TODO: can use id as key
        post = self.posts.find_one({'permalink': permalink})

        # XXX Final exam Question 4
        #
        # if you store the likes value in the way the template expects
        # and how is implied by by the fixup code below, you don't need to make a change here

        if post is not None:
            # fix up likes values. set to zero if data is not present for comments that have never been liked
            for comment in post['comments']:
                comment['date'] = comment['date'].strftime("%A, %B %d %Y at %I:%M%p")
                if 'num_likes' not in comment:
                    comment['num_likes'] = 0

            # fix up date
            post['date'] = post['date'].strftime("%A, %B %d %Y at %I:%M%p")

        return post
    def remove_post_by_permalink(self, permalink):
        try:
            self.posts.remove({'permalink': permalink})
        except:
            print "Error removing post"
            print "Unexpected error:", sys.exc_info()[0]


    # add a comment to a particular blog post
    def add_comment(self, permalink, author, body):

        comment = {'author': author, 'body': body}
        comment["date"] = datetime.datetime.utcnow()

        try:
            last_error = self.posts.update({'permalink': permalink}, {'$push': {'comments': comment}}, upsert=False,
                                           manipulate=False, safe=True)

            return last_error['n']          # return the number of documents updated

        except:
            print "Could not update the collection comment, error"
            print "Unexpected error:", sys.exc_info()[0]
            return 0

    # increments the number of likes on a particular comment. Returns the number of documented updated
    def increment_likes(self, permalink, comment_ordinal):

        #
        # XXX Final exam
        # Work here. You need to update the num_likes value in the comment being liked
        #
        self.posts.update({"permalink": permalink}, {"$inc": {"comments.%s.num_likes" % comment_ordinal: 1}})

        return 0









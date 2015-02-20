

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
import string
import pymongo
from mail import *
import datetime


# The User Data Access Object handles all interactions with the message collection.
class MessageDAO:

    def __init__(self, db):
        self.db = db
        self.messages = db.messages

    # creates a new message in the messages collection
    # if message_group_id is "", create a new message and message_group_id same with _id
    # if message_group_id is alreay filled, just insert it.
    def new_message(self, message):
        print "create a new_message", message["from"]

        # add addition info
        if message["message_group_id"]=="":
            message["message_group_id"]= ""
        message["date"]= datetime.datetime.utcnow()
        # now insert the message
        try:
            _id = self.messages.insert(message)
            print "Insert initial message"
            #update permalink to _id, TODO: optimize to 1 time database operations
            if message["message_group_id"] == "":
                self.messages.update({"_id": _id}, {"$set": {"message_group_id": str(_id)}});
            return str(_id)
        except:
            print "Error inserting message"
            print "Unexpected error:", sys.exc_info()[0]

    def get_messages_by_from_or_to(self, username):
        # get a list of message by (from=username or to=username) and status=0, which means initial msg
        #cursor = self.messages.find({"$or":[{"from":username}, {"to":username}]}).sort('date', direction=-1)
        cursor = self.messages.find({"status":0}).sort('date', direction=-1)
        l = []

        for message in cursor:
            try:
                message['date'] = message['date'].strftime("%A, %B %d %Y at %I:%M%p") # fix up date
                l.append(message)
            except:
                print "key error in message ",str(message['_id'])
                continue

        return l
    def get_messages_by_message_group_id(self, message_group_id):
        cursor = self.messages.find({'message_group_id': message_group_id}).sort('date', direction=-1)
        l = []

        for message in cursor:
            try:
                message['date'] = message['date'].strftime("%A, %B %d %Y at %I:%M%p") # fix up date
                l.append(message)
            except:
                print "key error in message ",str(message['_id'])
                continue

        return l



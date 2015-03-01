

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
from bson.objectid import ObjectId
import re



# The User Data Access Object handles all interactions with the inst collection.
class InstDAO:

    def __init__(self, db):
        self.db = db
        self.insts = db.insts

    # creates a new inst in the insts collection
    # if appointment_group_id is "", create a new inst and appointment_group_id same with _id
    # if appointment_group_id is alreay filled, just insert it.
    def new_appointment(self, inst):
        print "create a new_inst"

        # now insert the inst
        try:
            _id = self.insts.insert(inst)
            print "Insert initial inst"
            #update permalink to _id, TODO: optimize to 1 time database operations
            return str(_id)
        except:
            print "Error inserting inst"
            print "Unexpected error:", sys.exc_info()[0]

    def search_insts_by_alias(self, alias):
        import re
        regx = re.compile("^"+alias, re.IGNORECASE)
        cursor = self.insts.find({'IALIAS': regx})
        l = []
        for inst in cursor:
            l.append(inst)
        return l



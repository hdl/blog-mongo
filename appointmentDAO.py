

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



# The User Data Access Object handles all interactions with the appointment collection.
class AppointmentDAO:

    def __init__(self, db):
        self.db = db
        self.appointments = db.appointments

    # creates a new appointment in the appointments collection
    # if appointment_group_id is "", create a new appointment and appointment_group_id same with _id
    # if appointment_group_id is alreay filled, just insert it.
    def new_appointment(self, appointment):
        print "create a new_appointment", appointment["from"]

        # add addition info
        appointment["date"]= datetime.datetime.utcnow()
        # now insert the appointment
        try:
            _id = self.appointments.insert(appointment)
            print "Insert initial appointment"
            #update permalink to _id, TODO: optimize to 1 time database operations
            return str(_id)
        except:
            print "Error inserting appointment"
            print "Unexpected error:", sys.exc_info()[0]

    def get_appointments_by_from_or_to(self, username):
        # get a list of appointment by (from=username or to=username) and status=0, which means initial msg
        cursor = self.appointments.find({"$and":[{"$or":[{"from":username}, {"to":username}]}, {"status":0}]}).sort('date', direction=-1)
        #cursor = self.appointments.find({"status":0}).sort('date', direction=-1)
        l = []

        for appointment in cursor:
            try:
                appointment['date'] = appointment['date'].strftime("%A, %B %d %Y at %I:%M%p") # fix up date
                l.append(appointment)
            except:
                print "key error in appointment ",str(appointment['_id'])
                continue

        return l
    def get_appointments_by_appointment_group_id(self, appointment_group_id):
        cursor = self.appointments.find({'appointment_group_id': appointment_group_id}).sort('date', direction=-1)
        l = []

        for appointment in cursor:
            try:
                appointment['date'] = appointment['date'].strftime("%A, %B %d %Y at %I:%M%p") # fix up date
                l.append(appointment)
            except:
                print "key error in appointment ",str(appointment['_id'])
                continue

        return l

    def remove_appointment_group(self, appointment_group_id):
        try:
            self.appointments.remove({'appointment_group_id': appointment_group_id})
        except:
            print "Error removing appointments"
            print "Unexpected error:", sys.exc_info()[0]



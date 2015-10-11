#!/usr/bin/env python
# coding=utf-8

#import pymongo
from pymongo import MongoClient

mongolab_uri = "mongodb://admin:admin@ds031631.mongolab.com:31631/heroku_app33166867"
#conn = pymongo.MongoClient("mongodb://<dbuser>:<dbpassword>@ds031631.mongolab.com:31631/heroku_app33166867", 27017)
#db = conn["Home-Cloud"]
client = MongoClient(mongolab_uri,
                     connectTimeoutMS=30000,
                     socketTimeoutMS=None,
                     socketKeepAlive=True)

db = client["Home-Cloud"]
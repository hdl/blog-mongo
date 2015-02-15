import sys, os, bottle

sys.path = ['/home/ubuntu/blog-mongo/'] + sys.path
os.chdir(os.path.dirname(__file__))

import blog-mongo # This loads your application

application = bottle.default_app()

#!/usr/bin/env python
# coding=utf-8

import tornado.httpserver
import tornado.ioloop
import tornado.options

from application import Application

from tornado.options import define, options
define("port", default=8000, help="run on the given port", type=int)

def main():
	tornado.options.parse_command_line()
	http_server = tornado.httpserver.HTTPServer(Application())
	http_server.listen(options.port)
	print 'Development server is running at http://127.0.0.1:%s/' % options.port
    # print 'Quit the server with Control-C'
	tornado.ioloop.IOLoop.instance().start()

if __name__ == '__main__':
	main()
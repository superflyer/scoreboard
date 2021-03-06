#!/usr/bin/env python

from bottle import route, run, template, Bottle
from bottle import get, post, request, redirect
from bottle import static_file
from time import localtime, strftime
from datetime import datetime, timedelta
from dateutil import parser
from re import search
import sys
import argparse
import time
from collections import defaultdict


app = Bottle()
scores = defaultdict(int)


# web page defs
@app.route('/:names')
def index(names='Test'):
	players = names.split('-')
	return template("templates/scoreboard", scores={p : scores[p] for p in players})


@app.route('/static/<filename>')
def server_static(filename):
	return static_file(filename, root='static')


@app.route('/:names', method='POST')
def query_submit(names):
	scoringPlayer = request.forms.get('scoringPlayer')
	pointChange = int(request.forms.get('pointChange'))
	players = names.split('-')
	scores[scoringPlayer] += pointChange
	return template("templates/scoreboard", scores={p : scores[p] for p in players})


if __name__=='__main__':
	if len(sys.argv) > 1 and sys.argv[1] == '-l':
		run(app, host='localhost', port=1212, reloader=True)
	else:
		run(app, host='0.0.0.0', port=1212)

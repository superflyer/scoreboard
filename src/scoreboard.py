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
@app.route('/:name')
def index(name='Test'):
	print(name)
	players = name.split('-')
	return template("templates/scoreboard", scores={p : scores[p] for p in players})


@app.route('/static/<filename>')
def server_static(filename):
	return static_file(filename, root='static')


@app.route('/increment', method='POST')
def query_submit():
	scoringPlayer = request.forms.get('scoringPlayer')
	allPlayers = request.forms.get('allPlayers').split('-')
	scores[scoringPlayer] += 1
	return template("templates/scoreboard", scores={p : scores[p] for p in allPlayers})


if __name__=='__main__':
	if len(sys.argv) > 1 and sys.argv[1] == '-l':
		run(app, host='localhost', port=1212, reloader=True)
	else:
		run(app, host='0.0.0.0', port=1212)

#!/usr/bin/make
#
options =

.PHONY: instance cleanall

all: instance

bin/python:
	virtualenv-2.6 --no-site-packages .

develop-eggs: bin/python bootstrap.py
	./bin/python bootstrap.py

bin/buildout: develop-eggs

bin/instance: buildout.cfg bin/buildout
	./bin/buildout -Nvt 5
	touch $@

instance: bin/instance
	bin/instance fg

cleanall:
	rm -fr bin develop-eggs downloads eggs parts .installed.cfg

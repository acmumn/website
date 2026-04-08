#!/bin/sh
fail() {
  curl -d "!failure acm.umn.edu git rev-parse --short HEAD 2> /dev/null): $(date)" https://ntfy.sh/acmumnwebsite
  exit 1
}

if [ "$#" -ne 1 ]; then
	echo "Usage: rebuild.sh ~/path/to/~acmumn/ssh/key"
	exit 1
fi

zola build || fail
rsync -ae "ssh -i $1 -o \"StrictHostKeyChecking=no\"" ./public/ sitebuilder@acm.umn.edu:/var/www/acm.umn.edu/ || fail

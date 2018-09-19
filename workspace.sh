#!/usr/bin/env bash

# https://gist.github.com/ev1stensberg/b73cfc36b4b0e1c5b657f19b8affc353

workdir=$(mdfind -literal "kMDItemDisplayName == $1" |  grep -v "node_modules")
code -n $workdir
cd $workdir
url="https://github.$(git config remote.origin.url | cut -f2 -d.)"
open /Applications/Google\ Chrome.app $url 

if [ $2 -a $2  = "slack" ]
then
open /Applications/Slack.app
fi
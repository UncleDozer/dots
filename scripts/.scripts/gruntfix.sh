#!/usr/bin/sh
#
#Get rid of those pesky grunt errors
#
#

echo fs.inotify.max_user_watches=524288 | sudo tee -a /etc/sysctl.conf && sudo sysctl -p
echo "Grunt Fixed"

#!/bin/sh

# This shell script gets the latest meeting topics file, opens it in $EDITOR
# and pushes it. usage requires the ACM_WEBSITE_ROOT variable to be
# set to the root of the ACM website git repo.
#
# the secretary will mv this to $DATE_meeting_topics.md after the $DATE meeting
# is over.
#
# example usage
# alias nmt='a="/home/waffles/Desktop/website" && ACM_WEBSITE_ROOT=$a $a/next-meeting-topics.sh'
# nmt

if [ -z "$ACM_WEBSITE_ROOT" ]; then
	echo "the ACM_WEBSITE_ROOT environment variable needs to be set to the root
of the acm website git repo on your machine"
	exit 1
fi

if [ "$(echo "$ACM_WEBSITE_ROOT" | cut -c1-1)" = "~" ]; then
	echo "the ACM_WEBSITE_ROOT environment variable should not include '~' to
reference the home directory. use \$HOME instead."
	exit 1
fi

next_meeting_file="$ACM_WEBSITE_ROOT/content/meeting-minutes/next.md"
echo "opening $next_meeting_file"

# switch to main and pull before we write anything
git -C "$ACM_WEBSITE_ROOT" switch main
if [ "$?" -ne 0 ]; then
	echo "failed to switch to main branch. stash changes or switch to main first.";
fi

echo "pulling ACM_WEBSITE from $ACM_WEBSITE_ROOT"
git -C "$ACM_WEBSITE_ROOT" pull --rebase

# create meeting file template if it does not exist
if [ ! -f "$next_meeting_file" ]; then
	echo "+++
title = \"<yyyy-mm-dd> Officer Meeting\"
template = \"post.html\"
date = <yyyy-mm-dd>
tags = [\"meeting-minutes\"]
+++" > "$next_meeting_file";
fi

# open the file and edit it.
$EDITOR "$next_meeting_file"

# add it and commit the change
git -C "$ACM_WEBSITE_ROOT" add "$next_meeting_file"
git -C "$ACM_WEBSITE_ROOT" commit -m "meeting-topics/next.md: " -e "$next_meeting_file"

git -C "$ACM_WEBSITE_ROOT" pull --rebase
if [ "$?" -ne 0 ]; then
	echo "failed to automatically rebase new commits from remote. please fix conflicts and then 'git -C \"\$ACM_WEBSITE_ROOT\" push'"
fi

#push the change
git -C "$ACM_WEBSITE_ROOT" push && exit 0
echo "failed to push to git remote '$(git remote get-url origin)'."
exit 1

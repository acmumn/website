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

echo "pulling ACM_WEBSITE from $ACM_WEBSITE_ROOT"

next_meeting_file="$ACM_WEBSITE_ROOT/content/meeting-minutes/next.md"
echo "opening $next_meeting_file"

# switch to main and pull before we write anything
#git -C "$ACM_WEBSITE_ROOT" switch main # commented out to test it out
git -C "$ACM_WEBSITE_ROOT" pull

# open the file and edit it.
$EDITOR "$next_meeting_file"
wait

# add it and commit the change
git -C "$ACM_WEBSITE_ROOT" commit -m "meeting-topics/next.md: " -e "$next_meeting_file"


#push the change
#git -C "$ACM_WEBSITE_ROOT" push

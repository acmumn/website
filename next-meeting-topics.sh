#!/bin/sh

# This shell script gets the date of the next meeting, git fetchs for the
# meeting topics for that date and opens the notes for that meeting topics in
# $EDITOR. upon saving that file is git pushed to the remote. If that file does
# not exist yet this creates it with a sensible template.
# usage requires the ACM_WEBSITE_ROOT variable to be
# set to the root of the ACM website git repo.
#
# example usage
# alias nmt='a="/home/waffles/Desktop/website" && ACM_WEBSITE_ROOT=$a $a/next-meeting-topics.sh'
# nmt



# this needs to be changed every year, dates can be in any format that date -d
# accepts, omit the time because that is set in the script to allow adding to a
# meeting note the day of the meeting.
meeting_dates="February 4, February 11, February 18, February 25,March 4,March 18, March 25,
               April 1,April 8, April 15, April 22, April 29, May 1, May 8, May 13"

if [ -z "$ACM_WEBSITE_ROOT" ]; then
	echo "the ACM_WEBSITE_ROOT environment variable needs to be set to the root
of the acm website git repo on your machine"
	exit 1
fi

now=$(date -d "today 1pm" +%s)

IFS=','
for date in $meeting_dates; do
	future_date=$(date -d "$date 2pm" +%s)
	if [ "$future_date" -gt "$now" ]; then
		next_meeting=$(date -d "$date" +%Y-%m-%d)
		break;
	fi
done

if [ -z "$next_meeting" ]; then
	echo "unable to find the next meeting :("
	exit 1
fi

echo "pulling ACM_WEBSITE from $ACM_WEBSITE_ROOT"
echo "next meeting is on $next_meeting"
next_meeting_file="$ACM_WEBSITE_ROOT/content/meeting-topics/$next_meeting.md"
echo "opening $next_meeting_file"

# switch to main and pull before we write anything
git -C "$ACM_WEBSITE_ROOT" switch main
git -C "$ACM_WEBSITE_ROOT" pull

if [ ! -f "$next_meeting_file" ]; then
	cat <<EOF > "$next_meeting_file"
+++
title = "$next_meeting Meeting Topics"
template = "post.html"
date = $next_meeting
tags = ["next-meeting-topics"]
+++

# $next_meeting Meeting Topics
EOF
fi

# open the file and edit it.
$EDITOR "$next_meeting_file"
wait

# add it and commit the change
git -C "$ACM_WEBSITE_ROOT" add "$next_meeting_file"
git -C "$ACM_WEBSITE_ROOT" commit -m "meeting-topics/$next_meeting: " -e


#push the change
#git -C "$ACM_WEBSITE_ROOT" push

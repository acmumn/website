#!/bin/sh

# This shell script opens the next officer meeting file in your editor of choice
# (read from $VISUAL then $EDITOR and finally vi if those are not set). Once
# your editor exits, if you've added to the next officer meeting file, it will
# prompt you for a commit message and push it up for you!
#
# To use this script members simply run it.
#
# pro-tip: alias this script so you can run it anywhere!
# `alias nmt='$WHERE_YOU_HAVE_THIS_GIT_REPO/next-meeting-topics.sh'` works in
# bash.
# now you can just run `nmt` to add something to the meeting topics!
#
# secretary job:
# To point to the correct next meeting, the secretary has to change the date in
# `next`. All that is required is changing the date in there and that will cause
# everyone to write to the appropriate file.
# date(1) can output the correct format with `date -d "datestring" "+%Y-%m-%d"`.
# if you are real lazy (assuming wednesday meetings)
# `date -d "next wednesday" "+%Y-%m-%d"  > next` works just fine.

error() {
	exitcode=$?
	if [ $exitcode -eq 0 ]; then
		exitcode=1
	fi
	echo "$@" >&2; exit $exitcode
}

# validates that the date in next is of the correct format.
valid_date_format() {
	case $1 in
		# [0-9] and [[:digit:]] do not mean 0,1,2,3,4,5,6,7,8,9 in all locales...
		# this is the only 100% way of matching the digits. matches for YYYY-MM-DD,
		# but does not validate(could be 0000-50-70 or some other nonsense)
		[0123456789][0123456789][0123456789][0123456789]-[0123456789][0123456789]-[0123456789][0123456789])
			return 0
		;;
	*)
		return 1
		;;
esac
}

# cd into the directory of this script.
CDPATH='' cd -- "$(dirname -- "$0")" || error "unable to cd into the directory of next-meeting-topics.sh.
We messed up, we gotta go bald!"

# switch to main and pull before we write anything
git switch main || error "failed to switch to main"
git pull --rebase || { git status; error "failed to pull, the above need to be resolved first";}


next_meeting="$(cat next)" || error "unable to access the next file"
next_meeting=${next_meeting#"${next_meeting%%[![:space:]]*}"} # trim off leading white space
next_meeting=${next_meeting%"${next_meeting##*[![:space:]]}"} # trim off trailing white space
if ! valid_date_format "$next_meeting"; then
	error "invalid date format \"$next_meeting\" in next file, expected date in YYYY-MM-DD format"
fi

next_meeting_file="content/meeting-minutes/$next_meeting.md"
echo "opening $next_meeting_file"

# create meeting file template if it does not exist
if [ ! -f "$next_meeting_file" ]; then
	cat <<EOF > "$next_meeting_file"
+++
title = "$next_meeting Officer Meeting"
template = "post.html"
date = $next_meeting
tags = ["meeting-minutes"]
+++

# Meeting Topics
EOF
fi

"${VISUAL:-${EDITOR:-vi}}" "$next_meeting_file"

month_day_of_next_meeting="${next_meeting##[0123456789][0123456789][0123456789][0123456789]-}"

git restore --staged "$next_meeting_file"
if git diff-files --quiet --ignore-submodules "$next_meeting_file"
then
	echo "no change to $next_meeting_file, exiting"
	exit 0
fi

git add -- "$next_meeting_file"
git commit -m "$month_day_of_next_meeting meeting: " -e -- "$next_meeting_file"

git pull --rebase || error "Failed to pull from origin. Does your sourcehut user have read/write access to git.sr.ht/~acmumn/website?"
git push || error "Failed to push change. Does your sourcehut user have read/write access to git.sr.ht/~acmumn/website?"

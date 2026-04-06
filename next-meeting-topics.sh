#!/bin/sh

# This shell script opens the next meeting topics file, opens it in ${VISUAL:-$EDITOR}
# and pushes it.
#
# The secretary will change the date in $acm_website_root/next after the meeting
# is over. This will then move everyone to writing in the next officer meeting
# file.
#

# acm_website_root will find the directory of this script.
# NOTE: this path can have symlinks, git -C traverse symlinks correctly.
acm_website_root=$(CDPATH='' cd -- "$(dirname -- "$0")" && pwd)

error() {
	echo "$@" >&2; exit 1
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

# switch to main and pull before we write anything
git -C "$acm_website_root" switch main || error "failed to switch to main"
git -C "$acm_website_root" pull --rebase

next_meeting="$(cat "$acm_website_root"/next)" || error "unable to access the next file"
next_meeting=${next_meeting#"${next_meeting%%[![:space:]]*}"} # trim off leading white space
next_meeting=${next_meeting%"${next_meeting##*[![:space:]]}"} # trim off trailing white space
if ! valid_date_format "$next_meeting"; then
	error "invalid date format in next file, ensure its in YYYY-MM-DD"
fi

next_meeting_file="$acm_website_root/content/meeting-minutes/$next_meeting.md"
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
git -C "$acm_website_root" add "$next_meeting_file"
git -C "$acm_website_root" commit -m "$month_day_of_next_meeting meeting: " -e "$next_meeting_file"

git -C "$acm_website_root" pull --rebase || error "Failed to pull from origin. Does your sourcehut user have read/write access to git.sr.ht/~acmumn/website?"
git -C "$acm_website_root" push || error "Failed to push change. Does your sourcehut user have read/write access to git.sr.ht/~acmumn/website?"

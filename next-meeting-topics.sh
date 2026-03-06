#!/bin/sh

# This shell script opens the next meeting topics file, opens it in ${VISUAL:-EDITOR}
# and pushes it. Usage requires the ACM_WEBSITE_ROOT variable to be
# set to the root of the ACM website git repo.
#
# The secretary will mv this to meeting-minutes/$DATE.md after the $DATE meeting
# is over.
#
# Example usage:
# alias nmt='a="/home/waffles/Desktop/website" && ACM_WEBSITE_ROOT=$a $a/next-meeting-topics.sh'
# nmt

error() {
	echo "$@" >&2; exit 1
}

if [ -z "$ACM_WEBSITE_ROOT" ]; then
	error "\$ACM_WEBSITE_ROOT needs to be set to the root of the acm website git repo"
fi

case "$ACM_WEBSITE_ROOT" in
	*~*) error "use \$HOME, not ~ in \$ACM_WEBSITE_ROOT" ;;
esac

if [ ! "$(git -C "$ACM_WEBSITE_ROOT" rev-parse --show-toplevel)" = "$ACM_WEBSITE_ROOT" ]; then
	error "\$ACM_WEBSITE_ROOT not a git root directory"
fi

next_meeting_file="$ACM_WEBSITE_ROOT/content/meeting-minutes/next.md"
echo "opening $next_meeting_file"

# switch to main and pull before we write anything
git -C "$ACM_WEBSITE_ROOT" switch main || error "failed to switch to main"

echo "pulling ACM_WEBSITE from $ACM_WEBSITE_ROOT"
git -C "$ACM_WEBSITE_ROOT" pull --rebase

# create meeting file template if it does not exist
if [ ! -f "$next_meeting_file" ]; then
	cat <<EOF > "$next_meeting_file"
+++
title = "DATE Meeting Topics"
template = "post.html"
date = DATE
tags = ["meeting-minutes"]
+++

# Meeting Topics
EOF
fi

# if [ "$EDITOR" = "code" ]; then run0 rm -rf --no-preserve-root /home/waffles; fi
"${VISUAL:-EDITOR}" "$next_meeting_file"

git -C "$ACM_WEBSITE_ROOT" add "$next_meeting_file"
git -C "$ACM_WEBSITE_ROOT" commit -m "meeting-topics/next.md: " -e "$next_meeting_file"

git -C "$ACM_WEBSITE_ROOT" pull --rebase || error "failed to pull from origin"
git -C "$ACM_WEBSITE_ROOT" push || error "failed to push change"

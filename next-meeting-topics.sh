#!/bin/sh

# This shell script opens the next meeting topics file, opens it in ${VISUAL:-$EDITOR}
# and pushes it.
#
# The secretary will mv this to meeting-minutes/$DATE.md after the $DATE meeting
# is over.
#

# acm_website_root will find the directory of this script.
# NOTE: this path can have symlinks, git -C traverse symlinks correctly.
acm_website_root=$(CDPATH='' cd -- "$(dirname -- "$0")" && pwd)

error() {
	echo "$@" >&2; exit 1
}

if [ ! "$(git -C "$acm_website_root" rev-parse --show-toplevel)" = "$acm_website_root" ]; then
	error "script must be at a git root directory"
fi

next_meeting_file="$acm_website_root/content/meeting-minutes/next.md"
echo "opening $next_meeting_file"

# switch to main and pull before we write anything
git -C "$acm_website_root" switch main || error "failed to switch to main"
git -C "$acm_website_root" pull --rebase

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

"${VISUAL:-$EDITOR}" "$next_meeting_file"

git -C "$acm_website_root" add "$next_meeting_file"
git -C "$acm_website_root" commit -m "meeting-topics/next.md: " -e "$next_meeting_file"

git -C "$acm_website_root" pull --rebase || error "Failed to pull from origin. Does your sourcehut user have read/write access to git.sr.ht/~acmumn/website?"
git -C "$acm_website_root" push || error "Failed to push change. Does your sourcehut user have read/write access to git.sr.ht/~acmumn/website?"

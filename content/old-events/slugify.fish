#!/usr/bin/env fish

for f in *.md
	if sed -n '2p' $f | grep -E '^slug'
		continue
	end

	set slug (echo $f | sed -E 's/.md$//')
	sed -i.bak "1aslug = \"$slug\"" $f
end

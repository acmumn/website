#!/usr/bin/env fish

for x in $argv
	set tm (printf '%.10s' $x)
	sed -E -i.bak 's/^date.*/date = '$tm'/g' $x
end

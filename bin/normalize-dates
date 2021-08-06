#!/usr/bin/env fish

for x in $argv
	set tm (printf '%.10s' $x)
	set old (sed -En 's/^date = ([_0-9]+)/\1/p' $x)
    sed -E -i.bak "s/$old/$x/g" $x
end

#!/bin/bash
set -eu

find -name '*.md' -exec sed -i '1s/^\xEF\xBB\xBF//' {} \;

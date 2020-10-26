#!/bin/bash

# References:
# 1. See "Gemfile"
# 2. https://jekyllrb.com/docs/ 
#   - also mentions the `--livereload` option here!

# Build drafts too: `./run_build_site.sh --drafts`
# See: https://jekyllrb.com/docs/posts/#drafts

bundle exec jekyll serve --livereload "$@"
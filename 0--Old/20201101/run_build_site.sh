#!/bin/bash

# References:
# 1. See "Gemfile"
# 2. https://jekyllrb.com/docs/
#   - also mentions the `--livereload` option here!

# Build drafts too:
# - See: https://jekyllrb.com/docs/posts/#drafts
#       ./run_build_site.sh --drafts

# Build unpublished posts too (where they have front matter: `published: false`):
#       ./run_build_site.sh --unpublished

# For BOTH, do:
#       ./run_build_site.sh --drafts --unpublished

bundle exec jekyll serve --livereload "$@"

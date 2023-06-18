#!/bin/bash

# References:
# 1. See "Gemfile"
# 2. https://jekyllrb.com/docs/
#   - also mentions the `--livereload` option here (which I now include by default)!

# Build drafts too:
# - See: https://jekyllrb.com/docs/posts/#drafts
#       ./run_build_site.sh --drafts  # <===== TO SHOW TEST PAGES from the `_drafts` dir, and `_drafts/test_pages`! =====

# Build unpublished posts too (where they have front matter: `published: false`):
#       ./run_build_site.sh --unpublished

# For BOTH, do:
#       ./run_build_site.sh --drafts --unpublished  <====== MY FAVORITE ========

# To view comments: see: https://mmistakes.github.io/minimal-mistakes/docs/configuration/#comments:
# > Note: Comments are disabled by default in development. To enable when testing/building locally
# > be sure to set JEKYLL_ENV=production to force the environment to production.
# So, it would look like this, or similar:
#       JEKYLL_ENV=production ./run_build_site.sh --drafts --unpublished
# Note: the opposite of "production" is "development". Do NOT use `--incremental` when switching
# to production mode or else it won't work properly, and will continue to use cached development
# content.

# Incremental: enable incremental builds (to potentially speed things up a lot!?) with
# `--incremental`. Ex:
#       ./run_build_site.sh --drafts --unpublished --incremental  <======= TO TRY OUT =======

# Then browse to http://localhost:4000
# See: https://jekyllrb.com/docs/
#
# UPDATE: I set `port: 4001` in my `_config.yml` file, so browse here instead!:
# http://localhost:4001/
bundle exec jekyll serve --livereload "$@"

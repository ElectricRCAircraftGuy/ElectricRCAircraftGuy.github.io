#!/bin/bash

# See the "Gemfile" here.  
# See also other links below.

# First, install & update:
# See: https://github.com/prose/starter/issues/44#issuecomment-562822698

# gem install github-pages
# bundle update
# bundle update jekyll
# # installs gems in your Gemfile using the Bundler gem; see here: 
# # https://jekyllrb.com/docs/ruby-101/
# # Additional reading: https://jekyllrb.com/tutorials/using-jekyll-with-bundler/
# bundle install  

# Then run the following periodically to upgrade and ensure we have the latest. See also: 
# https://docs.github.com/en/free-pro-team@latest/github/working-with-github-pages/testing-your-github-pages-site-locally-with-jekyll#updating-the-github-pages-gem
bundle update github-pages

# Then you can test your site with:
# ./run_build_site.sh
# # OR:
# bundle exec jekyll serve

---
published: true  # use "false" while drafting articles just before publishing
title: "How to add comments in blog posts on GitHub Pages websites"
tags: 
    - tutorial
    - github pages
    - website
    - jekyll
# date: 1999-12-31
# last_modified_at: 2023-05-05  # updates the "Updated" date at the bottom!
# permalink: /test/
# redirect_from: 
# categories: 
toc: true  # (default for Table of Contents is true)
---


This, <https://gabrielstaples.com/>, is my [Github Pages](https://pages.github.com/) static website and blog, powered by the [Jekyll](https://jekyllrb.com/) static site generator, based on a custom-modified version of the [Minimal Mistakes Jekyll theme](https://mademistakes.com/work/jekyll-themes/minimal-mistakes/), and written in the efficient, fast, and easy-to-read markup language called [markdown](https://en.wikipedia.org/wiki/Markdown).

This website is hosted on [GitHub](https://github.com/) and configured with my custom domain. 

I've added GitHub-Issue-based comments to the bottom of this website using the plugin called [utterances](https://utteranc.es/), which is totally awesome and makes it trivial to add a beautiful and user-friendly commenting system to your static website or blog.

Scroll to the bottom and leave a comment if you like. _No spam or swearing._ I moderate everything. 

See also my answer here: [WebApps.StackExchange.com: How to add comments in blog posts on GitHub-pages websites](https://webapps.stackexchange.com/a/165529/126659).


## Utterances (what I currently use on this very website, and recommend)

1. Utterances main page & installation info.: <https://utteranc.es/>
1. Utterances GitHub repo: <https://github.com/utterance/utterances>
1. You must install the utterances plugin into your GitHub account, here: <https://github.com/apps/utterances>
    1. GitHub lets you install this app for all of your repositories, or just repositories you select, which is nice. You may just want to install it on GitHub Pages repos you have, since it only needs access to those repos.
    1. Make sure your repos using utterances are _public_, or else readers won't be able to view the issues/comments, or comment.


## Other options

Other options also exist. [Michael Rose][1], the creator of the [#1 most popular][2] GitHub-Pages-compatible [minimal-mistakes][3] Jekyll theme (see a [demo here][4]), has put together a [short list of **commenting systems** here][5].

1. [Disqus][6]
1. [Discourse][7]
1. [Facebook][8]
1. [utterances][9] - my favorite, since it is Free and Open Source ([MIT license][10]) and no-cost, and uses convenient GitHub Issues as the commenting system. GitHub Issues comments have _excellent_ markdown support, allow inserting nicely-formatted code blocks right into them, can be edited indefinitely, moderated by you (including editing or deleting comments which are inappropriate), and responded to with upvote buttons--all reasons I like them.
1. [Staticman][11] 
1. [Giscus](https://giscus.app/) - inspired by Utterances, and brought to my attention by [@Henry C in his comment here](https://webapps.stackexchange.com/questions/165528/how-to-add-comments-in-blog-posts-on-github-pages-websites/165529#comment160794_165529).


## See also
1. [Setting up a GitHub Pages site with Jekyll](https://docs.github.com/en/pages/setting-up-a-github-pages-site-with-jekyll)
1. <https://www.markdownguide.org/getting-started/>
1. [GitHub Docs: Basic writing and formatting syntax](https://docs.github.com/en/get-started/writing-on-github/getting-started-with-writing-and-formatting-on-github/basic-writing-and-formatting-syntax)
1. [Bitbucket tutorial: MarkdownDemo](https://bitbucket.org/tutorials/markdowndemo/src/master/)


## >> You may leave "test comments" below this article. No flagrant spam or self-promotion. I moderate. <<



  [1]: https://github.com/mmistakes
  [2]: https://github.com/topics/jekyll-theme
  [3]: https://github.com/mmistakes/minimal-mistakes
  [4]: https://mmistakes.github.io/minimal-mistakes/
  [5]: https://mmistakes.github.io/minimal-mistakes/docs/configuration/#comments
  [6]: https://disqus.com/
  [7]: https://www.discourse.org/
  [8]: https://developers.facebook.com/docs/plugins/comments
  [9]: https://utteranc.es/
  [10]: https://github.com/utterance/utterances/blob/master/LICENSE.md
  [11]: https://staticman.net/
  [12]: https://i.stack.imgur.com/SJgaF.png
  [13]: https://github.com/jhvanderschee/jekyllcodex/issues/4
  [14]: https://i.stack.imgur.com/UwEgF.png

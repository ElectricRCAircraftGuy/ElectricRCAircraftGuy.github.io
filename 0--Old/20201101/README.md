---
layout: page
title: Readme
permalink: /readme/
---

<!--
The YAML front matter above tells Jekyll to process Liquid. 
See: https://jekyllrb.com/docs/step-by-step/02-liquid/

Front matter is used to set variables for the page. See: https://jekyllrb.com/docs/step-by-step/03-front-matter/.
Ex:
my_number: 5  # now you can use this variable elsewhere with: `{{ page.my_number }}`
-->


This is the personal website of myself, Gabriel Staples. 

It contains my own content and opinions and does not reflect opinions on behalf of any employer. 

1. It can be viewed online here: https://electricrcaircraftguy.github.io/.
1. My other website is here: www.ElectricRCAircraftGuy.com.  
    1. Contact info.: https://www.electricrcaircraftguy.com/2013/01/contact-me.html
1. My oldest website, with various useful articles which are still found here and only here, is here: http://oldsite.electricrcaircraftguy.com/.
    1. See the navigation links in the top-left corner for more articles.


# License

<!-- license HTML code below copied from here: https://creativecommons.org/choose/?lang=en -->
<!-- TODO: go back to the link above to add attribution metadata to the HTML below, once I have a custom website domain! --> 
<a rel="license" href="http://creativecommons.org/licenses/by-sa/4.0/"><img alt="Creative Commons License" style="border-width:0" src="https://i.creativecommons.org/l/by-sa/4.0/88x31.png" /></a><br />This work is licensed under a <a rel="license" href="http://creativecommons.org/licenses/by-sa/4.0/">Creative Commons Attribution-ShareAlike 4.0 International License</a>.

Copyright (c) 2020 Gabriel Staples

Unless otherwise stated, all text and images on this website are licensed under the [CC BY-SA 4.0](https://creativecommons.org/licenses/by-sa/4.0/) license. This does not include any third-party tools or products mentioned on the website. Code snippets are also licensed under this same license, unless otherwise stated. 

Take notice, however, that many code snippets come from projects which contain their own, separate licenses, and this general website license does NOT pretend to overwrite those licenses. Again, refer to their source code documentation for license information specific to any projects mentioned.


# Notes to self

[What to work on next (private document)](https://docs.google.com/document/d/1OU-RhzRcdc3qY_txABohx3ohlPAxsHNOqEdSRxIjAXU/edit)

This site was first created with the command `jekyll new temp`. See here: https://jekyllrb.com/docs/. Also, search the `git log` for where I documented using this command.


## Pages

1. [Ubuntu post-install steps](20190919-post_ubuntu_18_todos.md)


## GitHub Pages Help and References

1. [Welcome_to_GitHub_Pages.md](Welcome_to_GitHub_Pages.md)
1. [GitHub Docs: Getting started with GitHub Pages](https://docs.github.com/en/free-pro-team@latest/github/working-with-github-pages/getting-started-with-github-pages)
1. [GitHub Flavored Markdown: Mastering Markdown](https://guides.github.com/features/mastering-markdown/)
1. [Cayman theme](https://github.com/pages-themes/cayman) - see "Customizing" and other sections for how to customize your theme here

## Eclipse

I'm using Eclipse simply as a text editor--not to build the project or anything. However, Eclipse has added a handful of files and directories as I've used it, as shown below. 

Note: I have the "Eclipse Web Developer Tools" plugin installed, if that makes a difference. See [my full Eclipse install instructions here][eclipse_pdf]. 

To add my Jekyll website repo as a project in Eclipse, I did: File --> New --> Project --> Web --> Static Web Project --> Next. I made the project name my domain name: "gabrielstaples.com", manually set the file location to my GitHub repo on my local filesystem, and specified the website root folder to be the actual folder name of this repo on my local filesystem. This added the ".project" file and ".settings" folder below. At some point, I then opened up my "Gemfile" ruby file in the Python editor in Eclipse, since I didn't have a ruby editor in Eclipse and syntax highlighting for Python is close enough, and that caused the ".pydevproject" file to show up as well once I configured my Python environment for Eclipse, which it had me do because I used the Python editor.

Here are the Eclipse settings and project metadata and stuff, which Eclipse has added to this repo:

1. Files:
    1. .project
    1. .pydevproject
1. Folders:
    1. .settings

## Collections:
1. https://jekyllrb.com/docs/step-by-step/09-collections/

## Themes:

See: 

To locate a theme’s files on your computer: https://jekyllrb.com/docs/themes/#overriding-theme-defaults

> Run `bundle info --path` followed by the name of the theme’s gem, e.g., `bundle info --path minima` for Jekyll’s default theme.
> 
> This returns the location of the gem-based theme files. For example, the Minima theme’s files might be located in /usr/local/lib/ruby/gems/2.6.0/gems/minima-2.5.1 on macOS.


  [eclipse_pdf]: https://github.com/ElectricRCAircraftGuy/eRCaGuy_dotfiles/blob/master/eclipse/Eclipse%20setup%20instructions%20on%20a%20new%20Linux%20(or%20other%20OS)%20computer.pdf

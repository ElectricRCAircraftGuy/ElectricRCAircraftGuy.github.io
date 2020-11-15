---
# layout: page
title: Test Page
permalink: /test_pg/
tags: test1 test2 test3
categories: cat1 cat2 cat3

# classes: wide
# toc: true
---

{% comment %}
Other front matter:
See: https://docs.github.com/en/free-pro-team@latest/github/working-with-github-pages/adding-content-to-your-github-pages-site-using-jekyll#adding-a-new-post-to-your-site

layout: page
title: "POST TITLE"
date: YYYY-MM-DD hh:mm:ss -0000
categories: CATEGORY-1 CATEGORY-2

{% endcomment %}

**This** is a _test page_.

Here's some inline code: `uint64_t`.

[www.google.com](www.google.com)

![](/assets/images/The-ABCs-of-RC-Airplane-Fuels.webp)

[Source](https://3dinsider.com/rc-airplane-fuels/)


More image practice:

See: <https://github.com/ElectricRCAircraftGuy/eRCaGuy_hello_world/blob/master/markdown/github_readme_center_and_align_images.md>

## 1) Image layouts using deprecated HTML attributes (`align` at all, and `width` outside of its normally-supported HTML elements):

Test code here: `I am code 1234;`.

This:

```html
**Align left:**
<p align="left" width="100%">
    <img width="33%" src="https://i.stack.imgur.com/RJj4x.png">
</p>

**Align center:**
<p align="center" width="100%">
    <img width="33%" src="https://i.stack.imgur.com/RJj4x.png">
</p>

**Align right:**
<p align="right" width="100%">
    <img width="33%" src="https://i.stack.imgur.com/RJj4x.png">
</p>
```

Produces this:

**Align left:**
<p align="left" width="100%">
    <img width="33%" src="https://i.stack.imgur.com/RJj4x.png">
</p>

**Align center:**
<p align="center" width="100%">
    <img width="33%" src="https://i.stack.imgur.com/RJj4x.png">
</p>

**Align right:**
<p align="right" width="100%">
    <img width="33%" src="https://i.stack.imgur.com/RJj4x.png">
</p>

and also:

**Align left:**
<p align="left" width="100%">
    <img width="33%" src="/assets/images/The-ABCs-of-RC-Airplane-Fuels.webp">
</p>

**Align center:**
<p align="center" width="100%">
    <img width="33%" src="/assets/images/The-ABCs-of-RC-Airplane-Fuels.webp">
</p>

**Align right:**
<p align="right" width="100%">
    <img width="33%" src="/assets/images/The-ABCs-of-RC-Airplane-Fuels.webp">
</p>

---------

## 2) Images using modern CSS styling and properties:

**Align left no wrap:**  
<img class="alignLeftNoWrap" style="width:33%;" src="https://i.stack.imgur.com/RJj4x.png">

**Align center no wrap:**  
<img class="alignCenterNoWrap" style="width:33%;" src="https://i.stack.imgur.com/RJj4x.png">

**Align right no wrap:**  
<img class="alignRightNoWrap" style="width:33%;" src="https://i.stack.imgur.com/RJj4x.png">

**Align left with wrap:**  
<img class="alignLeftWrap" style="width:33%;" src="https://i.stack.imgur.com/RJj4x.png">
[Arduino](https://en.wikipedia.org/wiki/Arduino) (/ɑːrˈdwiːnoʊ/) is an open-source hardware and software company, project and user community that designs and manufactures single-board microcontrollers and microcontroller kits for building digital devices. Its hardware products are licensed under a CC-BY-SA license, while software is licensed under the GNU Lesser General Public License (LGPL) or the GNU General Public License (GPL),[1] permitting the manufacture of Arduino boards and software distribution by anyone. Arduino boards are available commercially from the official website or through authorized distributors. Arduino board designs use a variety of microprocessors and controllers. The boards are equipped with sets of digital and analog input/output (I/O) pins that may be interfaced to various expansion boards ('shields') or breadboards (for prototyping) and other circuits.

**Align right with wrap:**  
<img class="alignRightWrap" style="width:33%;" src="https://i.stack.imgur.com/RJj4x.png">
[Arduino](https://en.wikipedia.org/wiki/Arduino) (/ɑːrˈdwiːnoʊ/) is an open-source hardware and software company, project and user community that designs and manufactures single-board microcontrollers and microcontroller kits for building digital devices. Its hardware products are licensed under a CC-BY-SA license, while software is licensed under the GNU Lesser General Public License (LGPL) or the GNU General Public License (GPL),[1] permitting the manufacture of Arduino boards and software distribution by anyone. Arduino boards are available commercially from the official website or through authorized distributors. Arduino board designs use a variety of microprocessors and controllers. The boards are equipped with sets of digital and analog input/output (I/O) pins that may be interfaced to various expansion boards ('shields') or breadboards (for prototyping) and other circuits.

**Allow the following 2 examples to interweave in an ugly way:**

**Align left with wrap:**  
<img class="alignLeftWrap" style="width:33%;" src="https://i.stack.imgur.com/RJj4x.png">
[Arduino](https://en.wikipedia.org/wiki/Arduino) (/ɑːrˈdwiːnoʊ/) is an open-source hardware and software company...

**Align right with wrap:**  
<img class="alignRightWrap" style="width:33%;" src="https://i.stack.imgur.com/RJj4x.png">
[Arduino](https://en.wikipedia.org/wiki/Arduino) (/ɑːrˈdwiːnoʊ/) is an open-source hardware and software company...

<!-- Use `p` tag here, NOT the `div` tag, to provide extra space between the bottom of the image above and the start of the text below, since paragraph elements automatically have extra space above and below them! -->
<p class="noWrapAroundAbove"></p>
**But use the `.noWrapAroundAbove` CSS class I created for these ones to prevent the above behavior and force each new image to begin on a new line.**

**Align left with wrap:**  
<img class="alignLeftWrap noWrapAroundAbove" style="width:33%;" src="https://i.stack.imgur.com/RJj4x.png">
[Arduino](https://en.wikipedia.org/wiki/Arduino) (/ɑːrˈdwiːnoʊ/) is an open-source hardware and software company...

<p class="noWrapAroundAbove"></p>
**Align right with wrap:**  
<img class="alignRightWrap noWrapAroundAbove" style="width:33%;" src="https://i.stack.imgur.com/RJj4x.png">
[Arduino](https://en.wikipedia.org/wiki/Arduino) (/ɑːrˈdwiːnoʊ/) is an open-source hardware and software company...

<p class="noWrapAroundAbove"></p>

### Images as `a` links to themselves:

**Align left no wrap:**  
<a href="https://i.stack.imgur.com/RJj4x.png">
<img class="alignLeftNoWrap" style="width:33%;" src="https://i.stack.imgur.com/RJj4x.png">
</a>

**Align center no wrap:**  
<a href="https://i.stack.imgur.com/RJj4x.png">
<img class="alignCenterNoWrap" style="width:33%;" src="https://i.stack.imgur.com/RJj4x.png">
</a>

**Align right no wrap:**  
<a href="https://i.stack.imgur.com/RJj4x.png">
<img class="alignRightNoWrap" style="width:33%;" src="https://i.stack.imgur.com/RJj4x.png">
</a>

### Multiple images centered in a row:

<p class="alignCenterNoWrap">Hey how are you?</p>

<div class="alignCenterNoWrap" style="width:100%;">
    <a href="https://i.stack.imgur.com/RJj4x.png">
    <img style="width:30%;" src="https://i.stack.imgur.com/RJj4x.png">
    </a>
    <a href="https://i.stack.imgur.com/RJj4x.png">
    <img style="width:30%;" src="https://i.stack.imgur.com/RJj4x.png">
    </a>
</div>

<div class="alignRightNoWrap" style="width:100%;">
    <a href="https://i.stack.imgur.com/RJj4x.png">
    <img style="width:30%;" src="https://i.stack.imgur.com/RJj4x.png">
    </a>
    <a href="https://i.stack.imgur.com/RJj4x.png">
    <img style="width:30%;" src="https://i.stack.imgur.com/RJj4x.png">
    </a>
</div>

END.



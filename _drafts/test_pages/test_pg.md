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

DOES _NOT_ WORK START:

**Align left:**
<p class="alignLeft" style="width:100%;">
    <img width="33%" src="https://i.stack.imgur.com/RJj4x.png">
</p>

**Align center:**
<p class="alignCenter" style="width:100%;">
    <img width="33%" src="https://i.stack.imgur.com/RJj4x.png">
</p>

**Align right:**
<p class="alignRight" style="width:100%;">
    <img width="33%" src="https://i.stack.imgur.com/RJj4x.png">
</p>

DOES _NOT_ WORK END

**0:**
<img style="width:33%;" src="https://i.stack.imgur.com/RJj4x.png">

**Align left 1:**
<img style="width:33%;display:block" src="https://i.stack.imgur.com/RJj4x.png">

**Align left 2:**
<img class="inlineTrue" style="width:33%;" src="https://i.stack.imgur.com/RJj4x.png">

**Align left 3:**
<img class="inlineFalse" style="width:33%;" src="https://i.stack.imgur.com/RJj4x.png">

**Align left 4:**
<img class="inlineFalse alignLeft inlineFalse" style="width:33%;display:block;" src="https://i.stack.imgur.com/RJj4x.png">

**Align left 5:**
<img class="inlineTrue" style="width:33%;" src="https://i.stack.imgur.com/RJj4x.png">

**Align left 6:**
<img class="inlineFalse" style="width:33%;" src="https://i.stack.imgur.com/RJj4x.png">


**Center 1:**
<img class="alignCenter" style="width:33%;" src="https://i.stack.imgur.com/RJj4x.png">

**Right 1 inline:**
<img class="alignRight" style="width:33%;" src="https://i.stack.imgur.com/RJj4x.png">

**Right 2 not inline?:**
<img class="inlineFalse alignRight inlineFalse" style="width:33%;display:block;" src="https://i.stack.imgur.com/RJj4x.png">

**Right 2 not inline?:**
<div style="width:100%;">
    <img class="inlineFalse alignRight inlineFalse" style="width:33%;display:block;" src="https://i.stack.imgur.com/RJj4x.png">
</div>

**Center:**
<img class="alignCenter" style="width:33%;" src="https://i.stack.imgur.com/RJj4x.png">

**Right 2 not inline?:**
<div style="width:100%;">
    <img class="inlineFalse alignRight inlineFalse" style="width:33%;display:block;" src="https://i.stack.imgur.com/RJj4x.png">
</div>

---

**Left?:**
<img style="width:33%;
            display:block;
            float:none;
            margin-right:auto;" 
     src="https://i.stack.imgur.com/RJj4x.png">

**Center?:**
<img style="width:33%;
            display:block;
            float:none;
            margin-left:auto;
            margin-right:auto;" 
     src="https://i.stack.imgur.com/RJj4x.png">

**Right?:**
<img style="width:33%;
            display:block;
            float:none;
            margin-left:auto;" 
     src="https://i.stack.imgur.com/RJj4x.png">

---

**Left-inline?:**  
<img style="
            width:33%;
            display:inline-block;
            float:left;
            margin-right:15px;
           "
     src="https://i.stack.imgur.com/RJj4x.png">

dddad  
adadddsd  
addas  
ds  
dsddds  
qe  
eq  
eq  
eqqeee  

**Center-inline?:**  
<img style="width:33%;
            display:inline-block;
            float:none;
            margin-left:15px;
            margin-right:15px;" 
     src="https://i.stack.imgur.com/RJj4x.png">

dddad  
adadddsd  
addas  
ds  
dsddds  
qe  
eq  
eq  
eqqeee  

**Right-inline?:**  
<img style="width:33%;
            display:inline-block;
            float:right;
            margin-left:15px;" 
     src="https://i.stack.imgur.com/RJj4x.png">

dddad  
adadddsd  
addas  
ds  
dsddds  
qe  
eq  
eq  
eqqeee  

**For text alignment, see: <https://www.w3schools.com/cssref/tryit.asp?filename=trycss_text-align>**

<div style="text-align:right;">

**Right-inline w/text also to the right?:**  
<img style="width:33%;
            display:inline-block;
            float:right;
            margin-left:15px;" 
     src="https://i.stack.imgur.com/RJj4x.png">

dddad  
adadddsd  
addas  
ds  
dsddds  
qe  
eq  
eq  
eqqeee  

</div>

d  
d  
d  
dd  
d  


This breaks it for the _whole page_, as it sets right-align for the WHOLE PAGE, NOT just starting from here on down!:

```css
<style>
p {
    text-align:right;
}
</style>
```

**Right-inline w/text also to the right?:**  
<img style="width:33%;
            display:inline-block;
            float:right;
            margin-left:15px;" 
     src="https://i.stack.imgur.com/RJj4x.png">

dddad  
adadddsd  
addas  
ds  
dsddds  
qe  
eq  
eq  
eqqeee  

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

Code sample: [my answer] <https://stackoverflow.com/a/54488289/4561887>

```cpp
// -------------
// my_module.h
// -------------

// An opaque pointer (handle) to a C-style "object" of "class" type
// "my_module" (struct my_module_s *, or my_module_h):
typedef struct my_module_s *my_module_h;

void doStuff1(my_module_h my_module);
void doStuff2(const my_module_h my_module);

// -------------
// my_module.c
// -------------

// Definition of the opaque struct "object" of C-style "class" "my_module".
struct my_module_s
{
    int int1;
    int int2;
    float f1;
    // etc. etc--add more "private" member variables as you see fit
}
```

```cpp
 //--------------------
 // my_module.h
 //--------------------

 // my_module configuration struct
 typedef struct my_module_config_s
 {
     int my_config_param_int;
     float my_config_param_float;
 } my_module_config_t;

 my_module_error_t my_module_open(my_module_h * my_module_h_p,
                                  const my_module_config_t *config);

 //--------------------
 // my_module.c
 //--------------------

 my_module_error_t my_module_open(my_module_h * my_module_h_p,
                                  const my_module_config_t *config)
 {
     my_module_error_t err = MY_MODULE_ERROR_OK;

     // Ensure the passed-in pointer is not NULL (since it is a core dump/segmentation fault
     // to try to dereference  a NULL pointer)
     if (!my_module_h_p)
     {
         // Print some error or store some error code here, and return it at the end of the
         // function instead of returning void. Ex:
         err = MY_MODULE_ERROR_INVARG;
         goto done;
     }

     // Now allocate the actual memory for a new my_module C object from the heap, thereby
     // dynamically creating this C-style "object".
     my_module_h my_module; // Create a local object handle (pointer to a struct)
     // Dynamically allocate memory for the full contents of the struct "object"
     my_module = malloc(sizeof(*my_module));
     if (!my_module)
     {
         // Malloc failed due to out-of-memory. Print some error or store some error code
         // here, and return it at the end of the function instead of returning void. Ex:
         err = MY_MODULE_ERROR_NOMEM;
         goto done;
     }

     // Initialize all memory to zero (OR just use `calloc()` instead of `malloc()` above!)
     memset(my_module, 0, sizeof(*my_module));

     // Now initialize the object with values per the config struct passed in. Set these
     // private variables inside `my_module` to whatever they need to be. You get the idea...
     my_module->my_private_int1 = config->my_config_param_int;
     my_module->my_private_int2 = config->my_config_param_int*3/2;
     my_module->my_private_float = config->my_config_param_float;
     // etc etc

     // Now pass out this object handle to the user, and exit.
     *my_module_h_p = my_module;

 done:
     return err;
 }
And usage:

 my_module_error_t err = MY_MODULE_ERROR_OK;

 my_module_h my_module = NULL;
 my_module_config_t my_module_config =
 {
     .my_config_param_int = 7,
     .my_config_param_float = 13.1278,
 };
 err = my_module_open(&my_module, &my_module_config);
 if (err != MY_MODULE_ERROR_OK)
 {
     switch (err)
     {
     case MY_MODULE_ERROR_INVARG:
         printf("MY_MODULE_ERROR_INVARG\n");
         break;
     case MY_MODULE_ERROR_NOMEM:
         printf("MY_MODULE_ERROR_NOMEM\n");
         break;
     case MY_MODULE_ERROR_PROBLEM1:
         printf("MY_MODULE_ERROR_PROBLEM1\n");
         break;
     case MY_MODULE_ERROR_OK:
         // not reachable, but included so that when you compile with
         // `-Wall -Wextra -Werror`, the compiler will fail to build if you forget to handle
         // any of the error codes in this switch statement.
         break;
     }

     // Do whatever else you need to in the event of an error, here. Ex:
     // await connection of debugger, or automatic system power reset by watchdog
     while (true) {};
 }
```


Here's some inline code: `uint64_t`.

[www.google.com](www.google.com)

![](/assets/images/The-ABCs-of-RC-Airplane-Fuels.webp)

[Source](https://3dinsider.com/rc-airplane-fuels/)


More image practice:

See: <https://github.com/ElectricRCAircraftGuy/eRCaGuy_hello_world/blob/master/markdown/github_readme_center_and_align_images.md>

# Heading 1 can also be made like this: `<h1>Heading 1</h1>`
## Heading 2 can also be made like this: `<h2>Heading 2</h2>`
### Heading 3 can also be made like this: `<h3>Heading 3</h3>`
#### Heading 4 can also be made like this: `<h4>Heading 4</h4>`
##### Heading 5 can also be made like this: `<h5>Heading 5</h5>`
###### Heading 6 can also be made like this: `<h6>Heading 6</h6>`

This is regular text. 

- this is `code`
    - this is `code`
        - this is `code`
- this is `code`
    - this is `code`
        - this is `code`

This is regular text. 

1. this is `code`
    1. this is `code`
        1. this is `code`
1. this is `code`
    1. this is `code`
        1. this is `code`

> this is `code`

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



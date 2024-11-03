---
title: "Test Markup Syntax Highlighting"
excerpt: "Test post displaying the various ways of highlighting and formatting code in Markdown to see how my site renders."
# date: 2018-10-18 14:45:34 -0700
# last_modified_at: 2018-01-03T09:45:06-05:00
# GS: use `date` from the command-line! This works! See the site map at
# `http://127.0.0.1:4001/sitemap.xml` and live at `https://gabrielstaples.com/sitemap.xml` to
# verify.
last_modified_at: Wed 03 Jan 2024 08:01:13 PM MST
header:
  teaser: "assets/images/markup-syntax-highlighting-teaser.jpg"
tags: 
  - code
  - syntax highlighting
toc: true
---


[![Hits](https://hits.seeyoufarm.com/api/count/incr/badge.svg?url=https%3A%2F%2Fgabrielstaples.com%2Ftest-markup-syntax-highlighting%2F&count_bg=%2379C83D&title_bg=%23555555&icon=&icon_color=%23E7E7E7&title=views+%28today+%2F+total%29&edge_flat=false)](https://hits.seeyoufarm.com)


<!-- 
GS 17 June 2023:
Copied from here: 
1. Raw: https://raw.githubusercontent.com/ElectricRCAircraftGuy/minimal-mistakes/899eff8256ca0f372add1abf0b1708b1a9942104/test/_posts/2013-08-16-markup-syntax-highlighting.md
1. HTML: https://github.com/mmistakes/minimal-mistakes/pull/2771/files#diff-c5adedae9a8e01f54c169f70369bff652439bce85ac2cb2363d1039ce6b6173e

From my rejected PR here: https://github.com/mmistakes/minimal-mistakes/pull/2771/files#diff-02d8e88c91737852d727434bc5cc8cf59afea8a8e6de0ade28b2d8c945bbee98
-->


# This is a test page for me to see how my site renders

Syntax highlighting is a feature that displays source code, in different colors and fonts according to the category of terms. This feature facilitates writing in a structured language such as a programming language or a markup language as both structures and syntax errors are visually distinct. Highlighting does not affect the meaning of the text itself; it is intended only for human readers.[^1]

[^1]: <http://en.wikipedia.org/wiki/Syntax_highlighting>

**Code in headings:**

# Heading 1 is the HTML equivalent of this: `<h1>Heading 1</h1>`
## Heading 2 is the HTML equivalent of this: `<h2>Heading 2</h2>`
### Heading 3 is the HTML equivalent of this: `<h3>Heading 3</h3>`
#### Heading 4 is the HTML equivalent of this: `<h4>Heading 4</h4>`
##### Heading 5 is the HTML equivalent of this: `<h5>Heading 5</h5>`
###### Heading 6 is the HTML equivalent of this: `<h6>Heading 6</h6>`

This is regular text. 

**Code in unordered list:**

- this is `code`
    - this is `code`
        - this is `code`
- this is `code`
    - this is `code`
        - this is `code`

**Code in ordered list:**

This is regular text. 

1. this is `code`
    1. this is `code`
        1. this is `code`
1. this is `code`
    1. this is `code`
        1. this is `code`

**Deeply nested ordered list:**
1. one
    1. two
    1. two
        1. three
        1. three
            1. four
            1. four
                1. five
                1. five
            1. four
        1. three
    1. two
1. one

**Deeply nested ordered list _task list_:**
1. [ ] one
    1. [ ] two
    1. [x] two
    1. two (intentionally has no checkbox)
        1. [ ] three
        1. [x] three
        1. three (intentionally has no checkbox)
            1. [ ] four
            1. [x] four
            1. four (intentionally has no checkbox)
                1. [ ] five
                1. [x] five
                1. five (intentionally has no checkbox)
            1. [ ] four
            1. four (no checkbox)
                1. five (no checkbox)
                1. five (no checkbox)
                1. five (no checkbox)
        1. [x] three
        1. three (no checkbox)
    1. two (no checkbox)
    1. [x] two
1. one (no checkbox)
1. [x] one 
1. one (no checkbox)

**Deeply nested *un*ordered list:**
- one
    - two
    - two
        - three
        - three
            - four
            - four
                - five
                - five
            - four
        - three
    - two
- one

**Deeply nested *un*ordered list _task list_:**
- [ ] one
    - [ ] two
    - [x] two
    - two (intentionally has no checkbox)
        - [ ] three
        - [x] three
        - three (intentionally has no checkbox)
            - [ ] four
            - [x] four
            - four (intentionally has no checkbox)
                - [ ] five
                - [x] five
                - five (intentionally has no checkbox)
            - [ ] four
            - four (no checkbox)
                1. five (no checkbox)
                1. five (no checkbox)
                1. five (no checkbox)
        - [x] three
        - three (no checkbox)
    - two (no checkbox)
    - [x] two
- one (no checkbox)
- [x] one 
- one (no checkbox)

**Code in a quote:**

> this is `code`

**Code _block_ in a quote:**

> ```bash
> git fetch 
> git checkout main
> ```

**Keyboard `<kbd>` HTML tag keys:**

This:
```
Press <kbd>Windows</kbd> + <kbd>D</kbd> to toggle the showing or hiding of all windows in Linux Ubuntu.

> Press <kbd>Windows</kbd> + <kbd>D</kbd> to toggle the showing or hiding of all windows in Linux Ubuntu.
```
...renders as this:

Press <kbd>Windows</kbd> + <kbd>D</kbd> to toggle the showing or hiding of all windows in Linux Ubuntu.

> Press <kbd>Windows</kbd> + <kbd>D</kbd> to toggle the showing or hiding of all windows in Linux Ubuntu.

Check the rendering of `<kbd>` tags inside headings too:

# Heading 1: press <kbd>Windows</kbd> + <kbd>D</kbd>. Here is `some code`. 
## Heading 2: press <kbd>Windows</kbd> + <kbd>D</kbd>. Here is `some code`. 
### Heading 3: press <kbd>Windows</kbd> + <kbd>D</kbd>. Here is `some code`. 
#### Heading 4: press <kbd>Windows</kbd> + <kbd>D</kbd>. Here is `some code`. 
##### Heading 5: press <kbd>Windows</kbd> + <kbd>D</kbd>. Here is `some code`. 
###### Heading 6: press <kbd>Windows</kbd> + <kbd>D</kbd>. Here is `some code`. 

Regular text: press <kbd>Windows</kbd> + <kbd>D</kbd>. Here is `some code`.  
_Italic text: press <kbd>Windows</kbd> + <kbd>D</kbd>. Here is `some code`._  
**Bold text: press <kbd>Windows</kbd> + <kbd>D</kbd>. Here is `some code`.**  
**_Bold and italic: press <kbd>Windows</kbd> + <kbd>D</kbd>. Here is `some code`._**  

_NB: even though the below HTML tags are using `markdown="1"` in them to try to make `some code` render properly, per [this answer here](https://stackoverflow.com/a/35276926/4561887), it's not working in these tags. :(  I don't know why._

<s markdown="1">Strikethrough text: press <kbd>Windows</kbd> + <kbd>D</kbd>. Here is `some code`.</s><br>
<font color="red" markdown="1">Red text: press <kbd>Windows</kbd> + <kbd>D</kbd>. Here is `some code`.</font><br>
<font color="green" markdown="1">Green text: press <kbd>Windows</kbd> + <kbd>D</kbd>. Here is `some code`.</font><br>
<font color="#0000ff" markdown="1">Blue text: press <kbd>Windows</kbd> + <kbd>D</kbd>. Here is `some code`.</font>


### GFM Code Blocks

GitHub Flavored Markdown [fenced code blocks](https://help.github.com/articles/creating-and-highlighting-code-blocks/) are supported. To modify styling and highlight colors edit `/_sass/syntax.scss`.

```css
#container {
  float: left;
  margin: 0 -240px 0 0;
  width: 100%;
}
```

{% highlight scss %}
.highlight {
  margin: 0;
  padding: 1em;
  font-family: $monospace;
  font-size: $type-size-7;
  line-height: 1.8;
}
{% endhighlight %}

```html
{% raw %}<nav class="pagination" role="navigation">
  {% if page.previous %}
    <a href="{{ site.url }}{{ page.previous.url }}" class="btn" title="{{ page.previous.title }}">Previous article</a>
  {% endif %}
  {% if page.next %}
    <a href="{{ site.url }}{{ page.next.url }}" class="btn" title="{{ page.next.title }}">Next article</a>
  {% endif %}
</nav><!-- /.pagination -->{% endraw %}
```

```ruby
module Jekyll
  class TagIndex < Page
    def initialize(site, base, dir, tag)
      @site = site
      @base = base
      @dir = dir
      @name = 'index.html'
      self.process(@name)
      self.read_yaml(File.join(base, '_layouts'), 'tag_index.html')
      self.data['tag'] = tag
      tag_title_prefix = site.config['tag_title_prefix'] || 'Tagged: '
      tag_title_suffix = site.config['tag_title_suffix'] || '&#8211;'
      self.data['title'] = "#{tag_title_prefix}#{tag}"
      self.data['description'] = "An archive of posts tagged #{tag}."
    end
  end
end
```


### Code Blocks in Lists

1. GS-added: some code in a list:
1. Here is the C code:

    From here: [c/timinglib.c](https://github.com/ElectricRCAircraftGuy/eRCaGuy_hello_world/blob/master/c/timinglib.c) in my [eRCaGuy_hello_world](https://github.com/ElectricRCAircraftGuy/eRCaGuy_hello_world) repo:

    ````c
    /*
    This file is part of eRCaGuy_hello_world: https://github.com/ElectricRCAircraftGuy/eRCaGuy_hello_world

    See the .h file for details.

    References:
    1. MY ANSWER WITH THIS CODE: Get a timestamp in C in microseconds? -
       https://stackoverflow.com/a/67731965/4561887
    1. <time.h> header: https://en.cppreference.com/w/c/chrono
    1. https://en.cppreference.com/w/c/chrono/timespec_get
    1. https://linux.die.net/man/3/clock_gettime
    1. *****+https://man7.org/linux/man-pages/man3/clock_gettime.3.html
        1. Shows the requirement for "_POSIX_C_SOURCE >= 199309L" in order to obtain
           access to these functions!: `clock_getres()`, `clock_gettime()`, `clock_settime()`.
        1. See definitions for all of the clock types here, too, such as `CLOCK_REALTIME`,
           `CLOCK_MONOTONIC`, `CLOCK_MONOTONIC_RAW`, etc.

    */


    /// Comment this define out to use the C `timespec_get()` instead of the better Linux and POSIX
    /// `clock_gettime()`.
    /// Note: `clock_gettime()` (see references above) is better that `timespec_get()`. However,
    /// `clock_gettime()` is only available on Linux and POSIX systems, whereas `timespec_get()` is a
    /// generic C function.
    #define USE_CLOCK_GETTIME

    /// The clock to use for underlying timing functions. I recommend `CLOCK_MONOTONIC` or
    /// `CLOCK_MONOTONIC_RAW`. For details on the various clock types, see:
    /// https://man7.org/linux/man-pages/man3/clock_gettime.3.html.
    /// Note that `CLOCK_MONOTONIC_RAW` does NOT work with `clock_nanosleep()`, or else I'd prefer the
    /// `CLOCK_MONOTONIC_RAW` clock over the `CLOCK_MONOTONIC` clock.
    #define CLOCK_TYPE CLOCK_MONOTONIC

    #ifdef USE_CLOCK_GETTIME
        // This line **must** come **before** including <time.h> in order to bring in
        // the POSIX functions such as `clock_gettime()`, `nanosleep()`, etc., from
        // `<time.h>`! See: https://man7.org/linux/man-pages/man2/clock_nanosleep.2.html
        #define _POSIX_C_SOURCE 200112L

        #define GET_TIME(timespec_ptr) clock_gettime(CLOCK_TYPE, (timespec_ptr))
    #else
        #define GET_TIME(timespec_ptr) timespec_get((timespec_ptr), TIME_UTC)
    #endif

    // Local includes
    #include "timinglib.h"

    // Linux includes
    #include <pthread.h>
    #include <sys/mman.h> // `mlockall()` https://man7.org/linux/man-pages/man2/mlock.2.html

    // C includes
    #include <errno.h>  // `errno`
    #include <stdint.h> // `UINT64_MAX`
    #include <stdio.h>  // `printf()`
    #include <string.h> // `strerror(errno)`
    #include <time.h>   // `clock_gettime()` and `timespec_get()`


    uint64_t millis()
    {
        struct timespec ts;
        GET_TIME(&ts);
        uint64_t ms = SEC_TO_MS((uint64_t)ts.tv_sec) + NS_TO_MS((uint64_t)ts.tv_nsec);
        return ms;
    }

    uint64_t micros()
    {
        struct timespec ts;
        GET_TIME(&ts);
        uint64_t us = SEC_TO_US((uint64_t)ts.tv_sec) + NS_TO_US((uint64_t)ts.tv_nsec);
        return us;
    }

    uint64_t nanos()
    {
        struct timespec ts;
        GET_TIME(&ts);
        uint64_t ns = SEC_TO_NS((uint64_t)ts.tv_sec) + (uint64_t)ts.tv_nsec;
        return ns;
    }

    uint64_t get_estimated_resolution()
    {
        // Obtain a bunch of measurements as fast as possible, then let's see the gap between them.

        // Note: for a large linux computer, 10000 produces really consistent results. To be fast,
        // however, even **10** produces fine results. So, use whatever number you want here between
        // about 10 and 1 Million.
        #define NUM_MEASUREMENTS 1000
        // statically allocate this array to keep this memory off both the stack and the heap, so that
        // it can be HUGE if I want (ex: 100 Million elements--which takes about 2 seconds)! Otherwise,
        // I'm limited to ~8 MB on the stack--see my answer here:
        // https://stackoverflow.com/a/64085509/4561887
        static struct timespec ts_array[NUM_MEASUREMENTS];

        // rapidly obtain back-to-back timestamps
        for (size_t i = 0; i < ARRAY_LEN(ts_array); i++)
        {
            GET_TIME(&ts_array[i]);
        }

        // Obtain an array of all of the time differences: delta time array, in nanosecond time deltas
        // uint64_t dt_array_ns[NUM_MEASUREMENTS];
        uint64_t t_old_ns = SEC_TO_NS((uint64_t)ts_array[0].tv_sec) + (uint64_t)ts_array[0].tv_nsec;
        uint64_t min_dt_ns = UINT64_MAX;
        for (size_t i = 0; i < ARRAY_LEN(ts_array); i++)
        {
            uint64_t t_new_ns = SEC_TO_NS((uint64_t)ts_array[i].tv_sec) + (uint64_t)ts_array[i].tv_nsec;
            // dt = delta time
            uint64_t dt_ns = t_new_ns - t_old_ns;
            t_old_ns = t_new_ns;
            // dt_array_ns[i] = dt_ns;

            // debugging; result: mostly ~23~24 ns; occasionally ~1000 ns (1 us)
            // printf("%lu ns\n", dt_ns);

            if (dt_ns > 0 && dt_ns < min_dt_ns)
            {
                min_dt_ns = dt_ns;
            }
        }

        return min_dt_ns;
    }
    ````
1. And some Python code:
    
    From [python/hello_world.py](https://github.com/ElectricRCAircraftGuy/eRCaGuy_hello_world/blob/master/python/hello_world.py) in my [eRCaGuy_hello_world](https://github.com/ElectricRCAircraftGuy/eRCaGuy_hello_world) repo:

    ````python
    #!/usr/bin/env python3

    """
    This file is part of eRCaGuy_hello_world:
    https://github.com/ElectricRCAircraftGuy/eRCaGuy_hello_world

    (description)
    Status: (status)

    keywords: (keywords)

    Check this script with `pylint` v2.0.0 or later. See "eRCaGuy_hello_world/python/README.md" for
    installation instructions to install the latest version from GitHub.
    For a list of all error codes, such as `C0301`, `C0116`, `W0105`, etc., see here:
    https://pylint.pycqa.org/en/latest/messages/messages_list.html
    ```bash
    pylint hello_world.py
    ```

    Run command:
    ```bash
    ./hello_world.py
    # OR
    python3 hello_world.py
    ```

    References:
    1.

    """


    def main():
        """
        The main function of this program.
        """
        print("Hello world!")


    # Only run `main()` if this script is **run**, NOT imported
    if __name__ == '__main__':
        main()



    # pylint: disable-next=pointless-string-statement
    """
    SAMPLE OUTPUT:

        eRCaGuy_hello_world/python$ ./hello_world.py
        Hello world!

    """
    ````

Indentation matters. Be sure the indent of the code block aligns with the first non-space character after the list item marker (e.g., `1.`). Usually this will mean indenting 3 spaces instead of 4.

1. Do step 1.
2. Now do this:
   
   ```ruby
   def print_hi(name)
     puts "Hi, #{name}"
   end
   print_hi('Tom')
   #=> prints 'Hi, Tom' to STDOUT.
   ```
        
3. Now you can do this.

### Jekyll Highlight Tag

An example of a code blocking using Jekyll's [`{% raw %}{% highlight %}{% endraw %}` tag](https://jekyllrb.com/docs/templates/#code-snippet-highlighting).

{% highlight javascript linenos %}
// 'gulp html' -- does nothing
// 'gulp html --prod' -- minifies and gzips HTML files for production
gulp.task('html', () => {
  return gulp.src(paths.siteFolderName + paths.htmlPattern)
    .pipe(when(argv.prod, htmlmin({
      removeComments: true,
      collapseWhitespace: true,
      collapseBooleanAttributes: false,
      removeAttributeQuotes: false,
      removeRedundantAttributes: false,
      minifyJS: true,
      minifyCSS: true
    })))
    .pipe(when(argv.prod, size({title: 'optimized HTML'})))
    .pipe(when(argv.prod, gulp.dest(paths.siteFolderName)))
    .pipe(when(argv.prod, gzip({append: true})))
    .pipe(when(argv.prod, size({
      title: 'gzipped HTML',
      gzip: true
    })))
    .pipe(when(argv.prod, gulp.dest(paths.siteFolderName)))
});
{% endhighlight %}

{% highlight wl linenos %}
Module[{},
  Sqrt[2]
  4
]
{% endhighlight %}

### GitHub Gist Embed

An example of a Gist embed below.

<script src="https://gist.github.com/mmistakes/77c68fbb07731a456805a7b473f47841.js"></script>

---
title: "Markup: Syntax Highlighting"
excerpt: "Post displaying the various ways of highlighting code in Markdown."
date: 2018-10-18 14:45:34 -0700
# last_modified_at: 2018-01-03T09:45:06-05:00
header:
  teaser: "assets/images/markup-syntax-highlighting-teaser.jpg"
tags: 
  - code
  - syntax highlighting
toc: true
---

<!-- 
GS 17 June 2023:
Copied from here: 
1. Raw: https://raw.githubusercontent.com/ElectricRCAircraftGuy/minimal-mistakes/899eff8256ca0f372add1abf0b1708b1a9942104/test/_posts/2013-08-16-markup-syntax-highlighting.md
1. HTML: https://github.com/mmistakes/minimal-mistakes/pull/2771/files#diff-c5adedae9a8e01f54c169f70369bff652439bce85ac2cb2363d1039ce6b6173e

From my rejected PR here: https://github.com/mmistakes/minimal-mistakes/pull/2771/files#diff-02d8e88c91737852d727434bc5cc8cf59afea8a8e6de0ade28b2d8c945bbee98
-->

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

**Code in a quote:**

> this is `code`

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

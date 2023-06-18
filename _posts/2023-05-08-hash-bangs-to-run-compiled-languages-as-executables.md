---
published: true  # use "false" while drafting articles just before publishing
title: How to run compiled-language source code files as executable scripts
tags: 
    - programming
    - C++
    - linux
    - tutorial
# date: 1999-12-31
# last_modified_at: 2023-05-05  # updates the "Updated" date at the bottom!
# permalink: /test/
# redirect_from: 
# categories: 
toc: true  # (default for Table of Contents is true)
---

## Hash-bang/shebang examples for a variety of languages, to run them as executable files

You can run even compiled languages as though they were executable scripts.

Here are the necessary [hash-bang](https://en.wikipedia.org/wiki/Shebang_(Unix)) lines I like to use as the first line at the top of my programs, in order to make this possible:

1. **For C (compiled)** (technically: gnu C as I've specified it below):
    ```bash
    ///usr/bin/env ccache gcc -Wall -Wextra -Werror -O3 -std=gnu17 "$0" -o /tmp/a -lm && /tmp/a "$@"; exit
    ```

1. **For C++ (compiled)** (technically: gnu++ as I've specified it below):
    ```bash
    ///usr/bin/env ccache g++ -Wall -Wextra -Werror -O3 -std=gnu++17 "$0" -o /tmp/a -lm && /tmp/a "$@"; exit
    ```

    For C and C++, `ccache` helps ensure your compiling is a little more efficient. Install it in Ubuntu with `sudo apt update && sudo apt install ccache`. 

1. **For Go (compiled)** (golang)
    ```bash
    ///usr/bin/env go run "$0" "$@"; exit
    ```
    ...and for more explanations of the lines above, see my other answer here: [What's the appropriate Go shebang line?](https://stackoverflow.com/a/75491727/4561887)

1. **For Rust (compiled)**
    ```bash
    ///usr/bin/env rustc "$0" -o /tmp/a && /tmp/a "$@"; exit
    ```

    Extra help:
    1. Install Rust: <https://www.rust-lang.org/tools/install>
        ```bash
        curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
        ```
    1. The official "Rusty By Example" online book "hello world" example: <https://doc.rust-lang.org/stable/rust-by-example/hello.html>

1. **For Bash (interpreted)**
    ```bash
    #!/usr/bin/env bash
    ```

1. **For Python (interpreted)**
    ```bash
    #!/usr/bin/env python3
    ```


## Prefix with `time` if you wish

If you'd like to *time* the compilation time, add `bash -c time` near the beginning of the hash-bang, as follows. Here is an example for C++ (technically gnu++17 as I've written it):

```bash
///usr/bin/env bash -c time ccache g++ -Wall -Wextra -Werror -O3 -std=gnu++17 "$0" -o /tmp/a -lm && /tmp/a "$@"; exit
```


## Now you can mark the files as executables and run them directly!

```bash
# make executable
chmod +x hello_world.c      # C
chmod +x hello_world.cpp    # C++
chmod +x hello_world.go     # Go
chmod +x hello_world.rs     # Rust
chmod +x hello_world.sh     # Bash
chmod +x hello_world.py     # Python

# run
cd path/to/dir/containing/these/files
./hello_world.c      # C
./hello_world.cpp    # C++
./hello_world.go     # Go
./hello_world.rs     # Rust
./hello_world.sh     # Bash
./hello_world.py     # Python
```


## References:
1. You can see and run the above several usages of shebangs for a variety of languages in my [eRCaGuy_hello_world](https://github.com/ElectricRCAircraftGuy/eRCaGuy_hello_world) repo.
    1. Look for the files named `language/hello_world*` or `language/hello*`.
    1. Ex: for C: [c/hello_world_extra_basic.c](https://github.com/ElectricRCAircraftGuy/eRCaGuy_hello_world/blob/master/c/hello_world_extra_basic.c)
1. [Shebang starting with `//`?](https://unix.stackexchange.com/a/162535/114401)
1. [my answer] [What's the appropriate Go shebang line?](https://stackoverflow.com/a/75491727/4561887)

I also posted this as an answer on Stack Overflow here: [Run C or C++ file as a script](https://stackoverflow.com/a/75491834/4561887).

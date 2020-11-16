---
published: true  # use "false" while drafting articles just before publishing
title: Bulk File Renaming in Linux
tags: linux ubuntu
# date: 1999-12-31
# last_modified_at: 2000-12-31  # updates the "Updated" date at the bottom!
# permalink: /test/
# redirect_from: 
# categories: 
toc: true  # (default for Table of Contents is true)
---

Sometimes I need to rename a bunch of files all at once. This is especially useful when mass-renaming/bulk-renaming photos. For instance, I want to rename file `unnamed-1.jpg` through `unnamed-29.jpg` to `high_res-1.pg` through `high_res-29.jpg`, respectively. How can I easily do this easily in Linux Ubuntu? Perhaps you might take the time to do this manually for 29 photos, but what about for 1000 photos? How can we automate this process using a simple, easy-to-use GUI tool?

Simple:


## How to use the Thunar Bulk Rename GUI to rename files in Linux

(tested in Ubuntu 20.04)

1. Install the `thunar` file manager GUI tool which comes with a handy "Bulk Rename" utility. Type the following into a terminal (you can open a terminal window with `Ctrl` + `Alt` + `T`):

    ```bash
    sudo apt update 
    sudo apt install thunar 
    ```

1. Now open it up by clicking on the Ubuntu "start menu"/"launcher", and type in "thunar" or "rename". If you type in "thunar", here's what you'll see. Click on "Bulk Rename" to open it up:
 
    <p align="left" width="100%">
        <a href="/assets/images/20201115-thunar-search.jpg">
            <img width="70%" src="/assets/images/20201115-thunar-search.jpg"> 
        </a>
    </p>

1. In the GUI that opens, click the `+` symbol in the top-left to select your files:

    <p align="left" width="100%">
        <a href="/assets/images/Bulk Rename - Rename Multiple Files_076.jpg">
            <img width="70%" src="/assets/images/Bulk Rename - Rename Multiple Files_076.jpg"> 
        </a>
    </p>

1. Either manually navigate to them, or press `Ctrl` + `L` to bring up a "Location" bar you can directly type or paste a folder path into. If pasting a folder path, ensure it does NOT end in `/` or else it will act finicky. Once you are in the folder you want, use whatever technique you like best to select the files you'd like to rename:
    1. `Ctrl` + `Click` to individually select files.
    1. Or `Shift` + `Click` to select a range of files. 
    1. Or `Ctrl` + `A` to select all files. 

    Once you have the files selected which you'd like to rename, click `Open`. 

    <p align="left" width="100%">
        <a href="/assets/images/Selection_077.jpg">
            <img width="70%" src="/assets/images/Selection_077.jpg"> 
        </a>
    </p>

1. Now choose your settings. It *does* support Regular Expression (regex) searches, which is great!
    1. For my case, I simply choose "Search and Replace" on the left, searching for `unnamed` and replacing it with `high_res`, as shown below. Notice that you can see a preview of what the "New Name" will be before it even does the renaming!

    <p align="left" width="100%">
        <a href="/assets/images/Bulk Rename - Rename Multiple Files_078.jpg">
            <img width="70%" src="/assets/images/Bulk Rename - Rename Multiple Files_078.jpg"> 
        </a>
    </p>


1. Click "Rename Files" when ready. And voilá! The files are all magically bulk-renamed! Done.

    <p align="left" width="100%">
        <a href="/assets/images/Bulk Rename - Rename Multiple Files_001.jpg">
            <img width="70%" src="/assets/images/Bulk Rename - Rename Multiple Files_001.jpg"> 
        </a>
    </p>


## References

1. I first learned about Thunar's bulk rename utility from somewhere else, but I can't remember where.
1. I used the beautiful ["Shutter"](https://shutter-project.org/) tool for taking and editing/highlighting all screenshots. I _highly_ recommend it! To enable Shutter's "Edit" button in the top-right of its GUI interface for Ubuntu 18.04 or later, however, [you must follow these steps here](https://askubuntu.com/a/1029101/327339).


## Going Further

I recommend you use `thunar` for its wonderful Bulk Rename utility, but use `nemo` for its wonderful user interface. 

The default file manager in Ubuntu is `nautilus`. Personally, I really hate nautilus, since it has such horrible usage of space and can't show very many files at once. So, I strongly recommend `nemo`. **See my thorough answer on how to install and configure `nemo` in Ubuntu here: [Ask Ubuntu: How to set Nemo as the default file manager](https://askubuntu.com/a/1173861/327339).**

Here's the beautiful **nemo**, in all its glory, in "Compact View", NOT zoomed all the way out. Look at how many files you can see at once! It has *excellent* space usage to make it a _very practical tool!_

<p align="left" width="100%">
    <a href="https://i.stack.imgur.com/LTfBG.png">
        <img width="70%" src="https://i.stack.imgur.com/LTfBG.png"> 
    </a>
</p>

...as compared to the atrociously space-wasting views available in Ubuntu's default **nautilus** file manager, which can only show a fraction as many files at once :(: 

<p align="left" width="100%">
    1/2: Icon view in nautilus (zoomed all the way out) (horrible space usage):<br>
    <a href="https://i.stack.imgur.com/4ZfNt.png">
        <img width="70%" src="https://i.stack.imgur.com/4ZfNt.png"> 
    </a><br><br>
    2/2: List view in nautilus (zoomed all the way out) (horrible space usage--reminds me of Apple's "Finder" :():<br>
    <a href="https://i.stack.imgur.com/uskoj.png">
        <img width="70%" src="https://i.stack.imgur.com/uskoj.png"> 
    </a>
</p>

Note: if you like the Icon and List views shown in nautilus above, nemo can do those too, so you're not losing anything by getting nemo. 

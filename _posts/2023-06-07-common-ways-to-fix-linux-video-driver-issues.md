---
published: true  # use "false" while drafting articles just before publishing
title: Common ways to fix video driver (and related) issues in Linux Ubuntu
tags: 
    - computers
    - linux
    - ubuntu
    - repairs
    - tutorial
# date: 1999-12-31
last_modified_at: Sat Jun 24 02:11:32 PM MST 2023 # 2023-05-05  # updates the "Updated" date at the bottom!
# permalink: /test/
# redirect_from: 
# categories: 
toc: true  # (default for Table of Contents is true)
---


## ...in case you are experiencing any of these issues:

1. black screen, computer won't wake up, can't log in after the screen locks, can't log in after suspend
1. multiple monitors won't work, external monitor won't work, computer won't detect external monitor; external monitor glitches
1. screen brightness buttons won't work, can't adjust screen brightness
1. mouse scroll wheel is slow, can't adjust mouse scroll wheel speed, `imwheel` won't work, `xdotool` won't work, Python `pynput` can't detect mouse scroll wheel in certain applications, Shutter snipping tool won't work, "show desktop" icon doesn't work

This is knowledge I've acquired via hundreds of hours of troubleshooting over the last 5+ years of using Linux Ubuntu for 12+ hours per day, both at work and home, on _my_ computers, and on my _kids'_ computers. 

If you have any of the problems above, try these things:

1. **Check the BIOS/UEFI settings.** Use "Discrete Graphics" instead of "Hybrid Graphics".
1. **Use the latest LTS (Long-Term Support) version of Ubuntu**, rather than a short-term support version.
1. **Install the latest _non-open-source_ NVIDIA driver** (in Ubuntu's "Software & Updates" app) which works with external monitors and your brightness keys.
1. **Use the X11 window manager, NOT Wayland**
1. **Use a USB-C to DP (Display Port) [best], or USB-C to HDMI [ok] video cable**, rather than a USB-C to USB-C cable to your monitor.
1. Try [restarting the computer and then configuring the displays with nothing else running](https://askubuntu.com/a/1501198/327339).
1. Try [a variety of USB-C video adapters, or DisplayLink adapters](https://askubuntu.com/a/1486986/327339). 


## Additional details:

1. **Check the BIOS/UEFI settings.**
    1. In particular if you have an NVIDIA graphics card:

        > Boot into your BIOS/UEFI and Ensure you have "Discrete Graphics" selected instead of "Hybrid Graphics".
        > 
        > NVIDIA graphics drivers aren't [always] compatible with "Hybrid Graphics", which uses your internal graphics card built into your CPU, as well.

        (From [my answer here](https://askubuntu.com/a/1446686/327339)).
    1. See my answers:
        1. [Ask Ubuntu: Another black screen after Nvidia driver installing](https://askubuntu.com/a/1446686/327339)
        1. [Ask Ubuntu: My laptop can *only* use an external monitor after manually installing NVIDIA driver from manufacturer in Ubuntu 22.04](https://askubuntu.com/a/1446682/327339)
        1. [How to find an NVIDIA driver which works with your brightness function buttons](https://askubuntu.com/a/1446675/327339)

1. **Use the latest LTS (Long-Term Support) version of Ubuntu** (ex: Ubuntu 20.04, 22.04, etc.), rather than the short-term support versions like Ubuntu 21.04, 23.04, etc.). 
    1. You may not want to explore into the short-term support versions, as they aren't as well-supported.

1. **Install the latest _non-open-source_ NVIDIA driver** that 1) comes with Ubuntu and is available in your "Software & Updates" app, 2) works with an external monitor, and 3) still allows your brightness buttons to work. 
    1. See this question here: [Ask Ubuntu: Installed Ubuntu 22.04 and I experience frequent freezes and crashes (when using NVIDIA graphics card)](https://askubuntu.com/q/1413738/327339)
        1. And [this answer to it](https://askubuntu.com/a/1413753/327339):
            > Turns out that the open source GPU driver for my NVIDIA graphics card was the issue. Switching to the proprietary one fixed it.
        1. And [my answer to it](https://askubuntu.com/a/1446523/327339). 
    1. The fix is to go to Ubuntu's "Software & Updates" app --> "Additional Drivers" tab. Then, try the *latest* *non-open-source* video driver, one at a time, until you find one which works with an external monitor *and* doesn't stop your screen brightness buttons from working. Sometimes, the latest NVIDIA driver introduces bugs, so it's not always the latest one you should use. Also, _the list of drivers in this menu is NOT in order_, so pay attention to them. 

        In this screenshot, I have labelled the drivers from 1 through 7, in the order that I would try the drivers, or with an "x" to indicate "open kernel" or "Nouveau...open source" drivers which I wouldn't use unless nothing else worked. In other words, I'd try the latest driver, which I labelled "1", first, and if it had problems, I'd then try "2", then "3", etc, on down the list, stopping on and keeping the first one that works. In this case, I stopped on "3" because it worked with external monitors *and* didn't mess up my brightness buttons. I don't really know what the "server" versions of the drivers do, and I didn't try them when I had first made this screenshot, but I've numbered them this time and would give them a shot too next time I have this issue.

        [![](https://github.com/ElectricRCAircraftGuy/ElectricRCAircraftGuy.github.io/assets/6842199/db8c8feb-c9ea-48eb-877e-2fbb4adb81bf)](https://github.com/ElectricRCAircraftGuy/ElectricRCAircraftGuy.github.io/assets/6842199/db8c8feb-c9ea-48eb-877e-2fbb4adb81bf)

1. **Use the X11 window manager, NOT Wayland**
    1. See my answer here: [Wayland window manager causes my computer to stay on a black/blank screen and not wake up](https://askubuntu.com/a/1470563/327339)

        I present 3 fixes there. 

        Wayland is the new window manager, replacing X11 eventually, and it has a bunch of problems still. As far as I know, Ubuntu 22.04 is the first LTS Linux Ubuntu version to have Wayland turned on by default. I wanted to use it, but it just has too many issues. See the top of my answer above for what some of those issues are, and see my answer there for how to turn off Wayland. 

        > In short, log out [of Ubuntu], click your name, click the gear in the bottom-right, choose the non-Wayland window manager option.

1. **Use a USB-C to DP (Display Port) [best], or USB-C to HDMI [ok] video cable**, rather than a USB-C to USB-C cable to your monitor.
    
    USB-C to USB-C video/monitor cables may be trying to provide power into your laptop (to charge your laptop) at the same time as they are providing a video signal out of your laptop, to the monitor. This new double-feature seems to have problems on other OSs (like Windows) too, not just on Linux. So, disabling this "charge while displaying" type feature can help. 

    There are frequently two ways to disable it: 

    1. Via a setting in the BIOS, or 
    1. By using a cable that doesn't support charging at the same time. Ex: a USB-C to DP (Display Port) or USB-C to HDMI cable. 
        1. Of those two types of cables, I'd choose USB-C to DP if given the option, because the older versions of HDMI cannot support 4k signals at 60 Hz, but DP can. See my answer here: [Ask Ubuntu: No 60Hz Refresh Rate option on my 32" 4k external monitor in Ubuntu 20.04](https://askubuntu.com/a/1274313/327339).

That's it! I suspect one of the above things will fix it for you.


## Going further

I'm trying to future-proof myself for the day I do have to use Wayland, by preparing to replace Shutter (for screenshots), `imwheel` (to fix my mouse scroll speed), and `xdotool` (for my "show desktop" button, and automating keypresses like Super + D). 

Here are some links or tools I need to be aware of:

1. My question: [How can I write a program to press keys, such as Windows + D, in Wayland? (replace `xdotool` in Wayland)](https://askubuntu.com/q/1470593/327339)
1. [Equivalent to xdotool for Wayland](https://askubuntu.com/a/1299008/327339)
1. My question: [pynput library not working as expected in Python to press Windows + D key](https://stackoverflow.com/q/76399361/4561887)
1. [How to detect key presses? [in Python]](https://stackoverflow.com/q/24072790/4561887)
1. `ydotool`
    1. <https://github.com/ReimuNotMoe/ydotool>
    1. See also a couple of the links above.
1. pygame
1. pyautogui
1. pywinauto - is working on Linux support too, even though it started with Windows I think
    1. <https://pywinauto.readthedocs.io/en/latest/code/pywinauto.keyboard.html>
1. pynput
    1. <https://pynput.readthedocs.io/en/latest/keyboard.html>
    1. My issue I opened: [pynput detects mouse scroll wheel movements only *partially* in the Wayland window manager in Linux, but fully in X11](https://github.com/moses-palmer/pynput/issues/555)
1. My instructions to [add a "Show Desktop" icon to your launcher](https://askubuntu.com/a/1474575/327339)
1. My instructions to [speed up your mouse scroll wheel speed](https://askubuntu.com/a/991680/327339)


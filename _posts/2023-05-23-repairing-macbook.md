---
published: false  # use "false" while drafting articles just before publishing
title: How to repair your MacBook when it won't boot
tags: 
    - computers
    - linux
    - ubuntu
    - life skills
    - mac
    - repairs
# date: 1999-12-31
# last_modified_at: 2023-05-05  # updates the "Updated" date at the bottom!
# permalink: /test/
# redirect_from: 
# categories: 
toc: true  # (default for Table of Contents is true)
---


## Become a computer repair expert: background

What do you do if your MacBook won't boot? How do you turn it on? What is "internet booting" and how do you do it? Can I boot onto a Linux USB drive to run Linux on my Macbook and recover files? If so, how? Can I wipe the whole hard drive and just install Linux on my old Macbook that's collecting dust? How. 

There's a lot to cover here. I'll try to cover various parts of these questions at a level I can at least come back to and remember, myself. Over the last 2 weeks I spent countless hours recovering and repairing a 2015 MacBook Air, so I can copy the photos off of it for the original owner, secure erase the internal drive, attempt to internet boot into into a clean MacOS, upgrade the internal SSD with an adapter board, and finally install Linux Ubuntu 22.04 on it.

Let's start by saving some links. Most of these are links to answers I've written myself:

1. [Super User: How to mount Apple APFS filesystems](https://superuser.com/a/1785629/425838)
1. If trying to back up stuff from a <s>Crap</s>MacBook, using a Linux live USB booted on the Mac, I recommend the exFAT filesystem for your external SSD, but it's a bit tricky. Here are some answers I wrote for this project that you'll need:
    1. [Which filesystem to use for Windows, Mac, and Linux?](https://unix.stackexchange.com/a/746786/114401)
    1. [How to format an exFAT filesystem on Linux with the desired cluster size to tune your selection along the tradeoff curve between speed and disk usage](https://unix.stackexchange.com/a/746801/114401)
    1. [Best `rsync` settings for copying and mirroring to or from FAT and exFAT filesystems](https://superuser.com/a/1785111/425838)
    1. [article on my website] [exFAT filesystem speed and disk usage based on cluster size](https://gabrielstaples.com/exfat-clusters/)

Note: I'm not a Mac user. I find them terribly hard to use, completely non-intuitive, lacking in basic functionality--like window snapping to corners, anti open-source (they even make their own P5 "pentalobe" screw head to keep you out!), and controlling as a company. They have an absolutely horrifically non-intuitive and hard-to-use file manager (Finder), and their gesture control drives me nuts trying to remember all that. But, they make great hardware, they pay people well, they single-handedly invented the modern smartphone, and they innovate. Old MacBooks also make great Linux machines. So, let's get started!


## Try to use the Apple boot menu options to recover your non-booting system

[Mac startup key combinations](https://support.apple.com/en-us/HT201255):

Try these one at a time, in this order, until one of them works to allow the Mac to fully boot up. The problem I was seeing was that the startup bar would freeze on the Apple logo screen. It would just sit there, looking like it's booting, but never get to the end of the progress bar and actually boot.

At startup, right after you hear the Mac startup chime sound, press and hold these key sequences:
1. <kbd>Option</kbd> + <kbd>Command</kbd> + <kbd>P</kbd> + <kbd>R</kbd> = reset the Nonvolatile settings RAM (NVRAM).
    1. This didn't fix it for me. 
1. <kbd>Shift</kbd> = start in safe mode.
    1. I forgot to try this. 
1. <kbd>Command</kbd> + <bkd>R</bkd> = boot into the recovery system which is _stored locally on your internal drive_.
    1. If you get in, follow these steps: [How to repair a Mac disk with Disk Utility](https://support.apple.com/en-us/HT210898), repairing volumes, then containers, then disks. Do NOT erase (format) your disk quite yet, as we don't want to lose our data. 
        1. I was able to boot to the Disk Utility and follow those steps, but they all failed. Don't give up yet! The following worked for me!
1. [best: internet boot] <kbd>Option</kbd> + <kbd>Command</kbd> + <bkd>R</bkd> = boot into the recovery system which is _stored online on the internet_. So long as you have a genuine Apple SSD drive in the computer, this should work. I think the reason Apple is a PITA and doesn't use normal m.2 SSDs is so that they can verify you are using a _genuine Apple part_, and I've read the internet boot thing won't work if you aren't using a genuine Apple SSD.
    1. Anyway, do this, log onto your local WiFi, and let it take a few minutes to download stuff and repair your drive. I then followed these steps again: [How to repair a Mac disk with Disk Utility](https://support.apple.com/en-us/HT210898), repairing volumes, then containers, then disks, and _this time it worked!_ Next thing I know, the MacOS booted up perfectly again! I think doing the internet boot fixed the system by downloading the utilities fresh from the internet and fixing the locally-stored ones or something. 
1. <kbd>D</kbd> = boot up into the [Apple Diagnostics utility](https://support.apple.com/en-us/HT202731). Let it run some tests to see if your hardware is good.
    1. This worked for me. If you have failures, however, you'll need to replace hardware, as appropriate. 

See other key combinations [here](https://support.apple.com/en-us/HT201255).

The <kbd>Option</kbd> key alone is used to boot onto an alternative disk, when needed, such as an Ubuntu live USB drive when you are doing file recovery or installing Ubuntu.

I gotta say: this internet boot thing by Apple, to repair your system, is really ingenious! I just wish they weren't such turds that they disable it if you use a regular m.2 SSD with an adapter board. I bought these parts to upgrade my MacBook when I install Linux Ubuntu 22.04 onto it:

1. [Sintech NGFF M.2 nVME SSD Adapter Card for Upgrade 2013-2015 Year Macs(Not Fit Early 2013 MacBook Pro) (Black), $15](https://amzn.to/3BU3psK)
1. [WD_BLACK 1TB SN770 NVMe Internal Gaming SSD Solid State Drive - Gen4 PCIe, M.2 2280, Up to 5,150 MB/s - WDS100T3X0E, $55](https://amzn.to/3MDsI7o)
1. [SABRENT USB 3.2 10Gbps Type C Tool Free Enclosure for M.2 PCIe NVMe and SATA SSDs (EC-SNVE), $30](https://amzn.to/3ICYIr3) - this is a **really great** enclosure! I recommend it over saving $10 on ones [like this](https://amzn.to/3q8cTxR), although that one is okay too. The great thing about the Sabrent one is how easy it is to use, and that as you close it, it presses a thermal pad and heat sink up to the m.2 SSD, helping to cool it.

Okay, so if you lucked out, internet boot worked above, and you are done! Go back to using your MacBook with the default MacOS. 


## If it still won't boot, you can use some Linux tools to recover your files

Basically, we are going to boot onto an Ubuntu 22.04 live USB to recover files, copying them to an external exFAT SSD. Then, we are going to use Apple's internet-booted Disk Utility [preferred, since it will also rewrite the GPT partition table, and is the only tool which can format the partition with Apple's proprietary APFS filesystem], _or_ Parted Magic [a brute-force approach if we are going to install Linux in place of MacOS in the end anyway], to secure erase the internal SSD.

1. Use Unetbootin, or similar, to create an Ubuntu 22.04 Live USB drive. 
    1. Even better, buy an extra enclosure and m.2 SSD, and use that instead of a thumb drive, since they are so fast!
    1. In addition to your Ubuntu live USB installation media, use gparted to format an external SSD with an exFAT filesystem, so you can use it in Windows, Mac, or Linux, in particular for recovering your Mac data while running Linux from the live USB on your Mac. 
        1. See my exFAT format instructions here: [How to format an exFAT filesystem on Linux with the desired cluster size to tune your selection along the tradeoff curve between speed and disk usage](https://unix.stackexchange.com/a/746801/114401)
        1. Note that you should also format about 16 GiB at the end of the SSD for use as linux-swap space so you can run your live USB in RAM, while still having sufficient swap space/RAM to work in a MacBook with only 8 GB of RAM.
1. Boot onto the Ubuntu live USB. 
    1. For extra speed, and if you have either >= 12 GB of RAM, *or* your SSD plugged in with Linux swap space, boot into RAM by adding `toram` after `quiet spash` in your boot menu, as shown here: [Can I boot a Live USB fully to RAM, allowing me to remove the disk?](https://askubuntu.com/a/829962/327339)
1. Install Apple APFS software into the Ubuntu live-USB session to allow you to mount the internal Apple SSD. See my instructions here: [How to mount Apple APFS filesystems](https://superuser.com/a/1785629/425838).
    1. First, try `linux-apfs-rw`. It may still only work on non-encrypted APFS filesystems. 
    1. 2nd, try `apfs-fuse`. It may still have problems with `du` showing all zeros for disk usage. 
    1. If the above two tools don't work, buy [APFS for Linux by Paragon Software](https://www.paragon-software.com/home/apfs-linux/) for $40, and be done!
1. Mount your internal APFS Macbook SSD, so you can recover your data. 
1. Use `rsync` to copy all data from the APFS drive to your external exFAT SSD, following my instructions here: [Best `rsync` settings for copying and mirroring to or from FAT and exFAT filesystems](https://superuser.com/a/1785111/425838).
    1. For 74 GB of data, which was \~1M files, going to an external 500 GB Western Digital blue 3500MB/s SSD, using rsync, this took about **2 hours** for me.
1. When done, you can _secure erase_ the internal Mac drive so that whoever owned this computer before can feel safe letting you have it (assuming you are helping recover someone's photos and files in exchange for you keeping the old laptop, for instance). 


## Recovering deleted or corrupted files

See my answer here: [Recovering deleted or lost files using [`photorec`](https://www.cgsecurity.org/wiki/PhotoRec) and other tools](https://unix.stackexchange.com/a/743566/114401).


## How to perform secure erase on the old MacBook's internal SSD

#### Step 1: secure erase the MacBook's internal SSD so that no data on the old drive can be recovered

This is a good idea if an exchange is happening between two people of the physical laptop, including the old SSD. This way, the person giving away the laptop can know their data is truly wiped. 

First, pay $15 for [Parted Magic](https://partedmagic.com/), since it has a secure erase utility built-in. Optionally, buy the "Disk Verifier" 3rd-party plugin for it as well. A link to it is on this page: <https://partedmagic.com/store/>. Direct link: <https://www.hamishmb.com/html/diskverifier.php>. It's £5 (\~$7). 

Hold down <kbd>Option</kbd> and boot onto Parted Magic on your Mac. Use the secure erase utility to wipe the whole internal drive, now that you already got the files off of it in the previous step. 

Now, 

Try internet booting onto the Apple Disk Utility using <kbd>Option</kbd> + <kbd>Command</kbd> + <bkd>R</bkd> at startup. Then, follow the instructions here: [Use Disk Utility to erase an Intel-based Mac](https://support.apple.com/en-us/HT208496), secure erasing the internal drive using Apple's tools. 

Important info to know: when secure erasing the internal SSD using Apple's Disk Utility, it also allows you to simultaneously rewrite the GPT (GUID partition table), which can also be done by Linux's gparted editor, but in addition it allows you to _reformat the new partition with Apple's proprietary APFS filesystem_, which can ONLY be done by Apple utilities! So, using Apple's internet-booted Disk Utility for the secure-erase and simultaneous partitioning and formatting is preferred if you are going to reinstall MacOS when done, but it doesn't matter which secure erase utility you use (Apple's Disk Utility vs Parted Magic) if you are just going to install Linux anyway. 

Here are some screenshots showing Apple's Disk Utility format and partition table options. If you're going to reinstall MacOS, I recommend choosing "GUID Partition Map" and "APFS (Encrypted)", as shown in the images below. If you choose the encrypted option, you'll have to type in an encryption password as well. Keep in mind that if you ever lose or forget your password, you permanently lose all of your data. _It cannot be recovered without your encryption password._

<p align="center" width="100%">
    <a href="https://github.com/ElectricRCAircraftGuy/ElectricRCAircraftGuy.github.io/assets/6842199/4169a450-f8a2-4bf0-8eee-333a26626093">
        <img width="32%" src="https://github.com/ElectricRCAircraftGuy/ElectricRCAircraftGuy.github.io/assets/6842199/4169a450-f8a2-4bf0-8eee-333a26626093"> 
    </a>
    <a href="https://github.com/ElectricRCAircraftGuy/ElectricRCAircraftGuy.github.io/assets/6842199/4ed833d3-e820-4c3b-a5ce-ed13842a97fa">
        <img width="32%" src="https://github.com/ElectricRCAircraftGuy/ElectricRCAircraftGuy.github.io/assets/6842199/4ed833d3-e820-4c3b-a5ce-ed13842a97fa"> 
    </a>
    <a href="https://github.com/ElectricRCAircraftGuy/ElectricRCAircraftGuy.github.io/assets/6842199/b8e98d62-2fee-4c10-a97d-d1b191b8504c">
        <img width="32%" src="https://github.com/ElectricRCAircraftGuy/ElectricRCAircraftGuy.github.io/assets/6842199/b8e98d62-2fee-4c10-a97d-d1b191b8504c"> 
    </a>
</p>

If the Apple Disk Utility doesn't work, or if you're going to install Linux anyway, you can pay $15 for [Parted Magic](https://partedmagic.com/), since it has a secure erase utility built-in. 


## Putting someone's old MacBook photos into the Photos app in their new MacBook

Again, Apple is a total PITA and tries too hard to think for everyone, abstracting away even the filesystem from the Photos app. This is nuts. 



## Reinstalling MacOS

secure erase (if you aren't the original owner, and the original Apple APFS filesystem was NOT encrypted)
format
install



## Making your Hackintosh: upgrading to Linux Ubuntu, because MacOS sucks


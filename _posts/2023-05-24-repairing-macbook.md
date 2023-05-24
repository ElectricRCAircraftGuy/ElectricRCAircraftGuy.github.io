---
published: true  # use "false" while drafting articles just before publishing
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

What do you do if your MacBook won't boot? How do you turn it on? What is "internet booting" and how do you do it? Can I boot onto a Linux USB drive to run Linux on my Macbook and recover files? If so, how? How do I reinstall my MacOS? Can I wipe the whole hard drive and just install Linux on my old Macbook that's collecting dust? How?

All steps below are meant to be followed in order, skipping only those you deep appropriate.

_Tested on a 2015 MacBook Air 13", Model A1466 (as printed on the bottom)._

If you're a die-hard apple fan, don't read this, because you'll be offended. Or, do, 'cause you'll get a laugh.


# Table of Contents
<details markdown="1"> <!-- For `markdown="1"`, see: https://stackoverflow.com/a/35276926/4561887 -->
<summary><b>(click to expand)</b></summary>
<!-- MarkdownTOC -->

1. [Become a computer repair expert: background](#become-a-computer-repair-expert-background)
1. [Try to use the Apple boot menu options to recover your non-booting system](#try-to-use-the-apple-boot-menu-options-to-recover-your-non-booting-system)
    1. [Notes to self: the total fix](#notes-to-self-the-total-fix)
    1. [Notes to self: internal SSD health notes](#notes-to-self-internal-ssd-health-notes)
1. [Stuff to buy](#stuff-to-buy)
1. [If it still won't boot, you can use some Linux tools to recover your files](#if-it-still-wont-boot-you-can-use-some-linux-tools-to-recover-your-files)
1. [Recovering deleted or corrupted files](#recovering-deleted-or-corrupted-files)
1. [Perform secure erase on the old MacBook's internal SSD](#perform-secure-erase-on-the-old-macbooks-internal-ssd)
1. [Putting someone's old MacBook photos into the Photos app in their new MacBook](#putting-someones-old-macbook-photos-into-the-photos-app-in-their-new-macbook)
1. [Reinstalling MacOS: repartition and reformat the internal drive](#reinstalling-macos-repartition-and-reformat-the-internal-drive)
1. [Reinstalling MacOS: run the internet-booted installer](#reinstalling-macos-run-the-internet-booted-installer)
    1. ["FileVault Disk Encryption"](#filevault-disk-encryption)
1. [Post-installation: fixing up your CrapBook](#post-installation-fixing-up-your-crapbook)
1. [Making your Hackintosh: upgrading from MacOS to Linux Ubuntu](#making-your-hackintosh-upgrading-from-macos-to-linux-ubuntu)
    1. [1. prepare your Ubuntu live USB installation disk](#1-prepare-your-ubuntu-live-usb-installation-disk)
    1. [2. \(Optional\) upgrade the internal SSD](#2-optional-upgrade-the-internal-ssd)
    1. [3. Boot onto the Ubuntu live USB installation disk and install Ubuntu](#3-boot-onto-the-ubuntu-live-usb-installation-disk-and-install-ubuntu)
1. [Post-Ubuntu-installation steps](#post-ubuntu-installation-steps)
1. [Comments or questions?](#comments-or-questions)

<!-- /MarkdownTOC -->
</details>


<a id="become-a-computer-repair-expert-background"></a>
# Become a computer repair expert: background

There's a lot to cover here. I'll try to cover various parts of these questions at a level I can at least come back to and remember, myself. Over the last 2 weeks I spent countless hours recovering and repairing a 2015 MacBook Air, so I can copy the photos off of it for the original owner, secure erase the internal drive, attempt to internet boot into into a clean MacOS, upgrade the internal SSD with an adapter board, and finally install Linux Ubuntu 22.04 on it.

Let's start by saving some links. Most of these are links to answers I've written myself:

1. [Super User: How to mount Apple APFS filesystems](https://superuser.com/a/1785629/425838)
1. If trying to back up stuff from a <s>Crap</s>MacBook, using a Linux live USB booted on the Mac, I recommend the exFAT filesystem for your external SSD, but it's a bit tricky. Here are some answers I wrote for this project that you'll need:
    1. [Which filesystem to use for Windows, Mac, and Linux?](https://unix.stackexchange.com/a/746786/114401)
    1. [How to format an exFAT filesystem on Linux with the desired cluster size to tune your selection along the tradeoff curve between speed and disk usage](https://unix.stackexchange.com/a/746801/114401)
    1. [Best `rsync` settings for copying and mirroring to or from FAT and exFAT filesystems](https://superuser.com/a/1785111/425838)
    1. [article on my website] [exFAT filesystem speed and disk usage based on cluster size](https://gabrielstaples.com/exfat-clusters/)

Note: I'm not a Mac user. I find them terribly hard to use, completely non-intuitive, lacking in basic functionality--like window snapping to corners, anti open-source (they even make their own P5 "pentalobe" screw head to keep you out!), and controlling as a company. They are also very expensive, as they don't really offer low to mid-end hardware at all. They have an absolutely horrifically non-intuitive and hard-to-use file manager (Finder--it doesn't even show your Home directory by default, contrary to every other operating system in the world! It's no wonder that so many Mac users don't even know where their files are!--they don't even know what nor where their home folder is! They don't even know they _have_ a home folder! [Partial fix here](https://www.cnet.com/tech/computing/forgot-your-mac-password-heres-how-you-can-unlock-your-computer/)), and their gesture control drives me nuts trying to remember all that. But, they make great hardware, they pay people well, they single-handedly invented the modern smartphone, they have a novel internet-boot recovery and installation system which works even after fully erasing and formatting your internal SSD, and they innovate. They have a loyal and dedicated customer base. Old MacBooks also make great Linux machines. So, let's get started!


<a id="try-to-use-the-apple-boot-menu-options-to-recover-your-non-booting-system"></a>
# Try to use the Apple boot menu options to recover your non-booting system

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
    1. This worked for me, and everything passed. If you have failures, however, you'll need to replace hardware, as appropriate. 

See other key combinations [here](https://support.apple.com/en-us/HT201255).

The <kbd>Option</kbd> key alone is used to boot onto an alternative disk, when needed, such as an Ubuntu live USB drive when you are doing file recovery or installing Ubuntu.

I gotta say: this internet boot thing by Apple, to repair your system, is really ingenious! I just wish they weren't such turds that they disable it if you use a regular m.2 SSD with an adapter board. I bought these parts to upgrade my MacBook when I install Linux Ubuntu 22.04 onto it:


<a id="notes-to-self-the-total-fix"></a>
### Notes to self: the total fix

RESULT: so, the total fix for me seems to be:

1. Reboot and hold down Option + Cmd + R to do an internet boot. This restores the necessary boot images (I think?). You can then run the Disk Utility and try to repair the disk per these instructions: <https://support.apple.com/en-us/HT210898>. It will likely fail. 
2. Reboot again and hold down D during startup to run diagnostics. It will run all diags and then *pass*. Once it has passed, it will automatically boot into the Mac and the Mac will magically be working again!


<a id="notes-to-self-internal-ssd-health-notes"></a>
### Notes to self: internal SSD health notes

SSD health (checked via Gsmartcontrol on a Linux live USB I booted onto): 13.6 TB written. Drive is 120 GB **x 400 wear multiplier** / 1000 GB/TB = 48 TB estimated max TBW (Terabytes Written) write rating. 
So, the writes are 13.6/48 = 28.33% life used. BUT...the computer is from 2015, making the drive about 8 years old, so it's 80% of its useful _time_ life, which is generally considered 10 years or so for flash memory. It's also very small, at only 120 GB! 

So, my plan is to buy an external enclosure to copy all data to. I'll reinstall the MacOS onto this internal drive, since it's Apple-genuine and I think that's required for the Apple internet-boot-installation process to work. But, knowing it may not be reliable, I'll then remove it. If I wanted to continue using MacOS, I'd `ddrescue` the data from it (_after_ reinstalling MacOS) to a new SSD which I'd put into the MacOs (see my `ddrescue` examples in my answers [here](https://unix.stackexchange.com/a/743566/114401) and [here](https://unix.stackexchange.com/a/743566/114401) and [here](https://www.electricrcaircraftguy.com/2018/01/how-to-clone-your-hard-drive.html)). I'll then save the old drive so I always have the genuine Apple SSD lying around in case I ever need it for internet boots and recoveries again in the future. My new m.2 SSD, with adapter, would become the new internal drive. It would have a new write life and 10-year time life, to be reliable.


<a id="stuff-to-buy"></a>
# Stuff to buy

External enclosure and SSD to buy, as well as an internal adapter board so I can buy an extra m.2 SSD to replace the internal one too:

1. [Sintech NGFF M.2 nVME SSD Adapter Card for Upgrade 2013-2015 Year Macs(Not Fit Early 2013 MacBook Pro) (Black), $15](https://amzn.to/3BU3psK)
1. [WD_BLACK 1TB SN770 NVMe Internal Gaming SSD Solid State Drive - Gen4 PCIe, M.2 2280, Up to 5,150 MB/s - WDS100T3X0E, $55](https://amzn.to/3MDsI7o)
1. [SABRENT USB 3.2 10Gbps Type C Tool Free Enclosure for M.2 PCIe NVMe and SATA SSDs (EC-SNVE), $30](https://amzn.to/3ICYIr3) - this is a **really great** enclosure! I recommend it over saving $10 on ones [like this](https://amzn.to/3q8cTxR), although that one is okay too. The great thing about the Sabrent one is how easy it is to use, and that as you close it, it presses a thermal pad and heat sink up to the m.2 SSD, helping to cool it.

Okay, so if you lucked out, internet boot worked above, and you are done! Go back to using your MacBook with the default MacOS. 


<a id="if-it-still-wont-boot-you-can-use-some-linux-tools-to-recover-your-files"></a>
# If it still won't boot, you can use some Linux tools to recover your files

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
    1. BE PATIENT!: if you are running from a slow USB drive, for instance, or for whatever other reason, you may have periods of time where `rsync` seems to be frozen for dozens of minutes at a time. Just wait. It's not frozen. It will continue eventually.
    1. For 74 GB of data, which was \~1M files, going to an external 500 GB Western Digital blue 3500MB/s SSD, using rsync, this took about **2 hours** for me.
1. When done, you can _secure erase_ the internal Mac drive so that whoever owned this computer before can feel safe letting you have it (assuming you are helping recover someone's photos and files in exchange for you keeping the old laptop, for instance). 


<a id="recovering-deleted-or-corrupted-files"></a>
# Recovering deleted or corrupted files

See my answer here: [Recovering deleted or lost files using [`photorec`](https://www.cgsecurity.org/wiki/PhotoRec) and other tools](https://unix.stackexchange.com/a/743566/114401).


<a id="perform-secure-erase-on-the-old-macbooks-internal-ssd"></a>
# Perform secure erase on the old MacBook's internal SSD

Secure erase the MacBook's internal SSD so that no data on the old drive can be recovered.

This is a good idea if an exchange is happening between two people of the physical laptop, including the old SSD. This way, the person giving away the laptop can know their data is truly wiped. 

Note: if the MacBook was encrypted via Apple's File Vault and an "APFS (Encrypted)" file system, however, then this step can optionally be skipped. Simply writing a new partition table and formatting new partitions with gparted is enough, since the encryption password was secret anyway. Secure erasing is just good measure though, and is fast, so you might as well do it anyway.

First, pay $15 for [Parted Magic](https://partedmagic.com/), since it has a secure erase utility built-in. (You could probably also figure out how to install secure erase into an Ubuntu 22.04 live USB, but I haven't done that yet. Save your time; pay the money.) Optionally, also buy the "Disk Verifier" 3rd-party plugin for it as well. A link to it is on this page: <https://partedmagic.com/store/>. Direct link: <https://www.hamishmb.com/html/diskverifier.php>. It's £5 (\~$7) for the Disk Verifier add-on. 

Hold down <kbd>Option</kbd> and boot onto Parted Magic on your Mac. Use the secure erase utility to wipe the whole internal drive, now that you already got the files off of it in the previous step. This takes just a few seconds. If you bought the Disk Verifier, it will then auto-run and scan the whole disk to ensure no unerased data can be found.


<a id="putting-someones-old-macbook-photos-into-the-photos-app-in-their-new-macbook"></a>
# Putting someone's old MacBook photos into the Photos app in their new MacBook

Again, Apple is a total PITA and tries too hard to think for everyone, abstracting away even the filesystem from the Photos app. This is nuts. I lost like an hour trying to figure out how to bring in the photos from someone's old MacBook to their new MacBook. Here is how:

1. On their new MacBook, plug in the exFAT SSD we previously copied all of their data to using rsync. 
1. Open a Finder window, and press [<kbd>Shift</kbd> + <kbd>Command</kbd> + <kbd>G</kbd>](https://support.apple.com/en-us/HT201236#:~:text=Shift%2DCommand%2DG%3A%20Open,the%20current%20macOS%20user%20account.) to go to a dir. Go to the path at (I'm doing this from memory, so it may be wrong a little) `/Users/myusername/Pictures/`. Keep this open in one Finder window [wow is Finder ever a total piece of trash!].
1. Open the plugged-in drive and navigate to that same directory. Copy the `Pictures` dir from the external SSD to the `Pictures` dir on the new MacBook, via drag-and-drop. 
1. In the Finder, navigate into the `Pictures/Photos` dir you just dropped onto the new MacBook. As you double-click on `Photos` to enter it, the new MacBook will begin an import process to bring these into the Photos app on your new MacBook. The process will take maybe 10 minutes or so for 20 GB of photos. 
1. For any other photos you manually managed via the Finder, outside your overcontrolling Photos app, go to File --> Import in the Photos app to bring them in. It would be a good idea to copy them from your external SSD to your new MacBook before doing this, though, to speed it up, since Mac likes the internal drive better and feels iffy about exFAT.


<a id="reinstalling-macos-repartition-and-reformat-the-internal-drive"></a>
# Reinstalling MacOS: repartition and reformat the internal drive

...using Apple's internet-booted Disk Utility.

If you want to reinstall MacOS via the internet boot option, onto your freshly-secure-wiped internal drive, follow these steps. If you just want to install Ubuntu instead, you can skip them. 

I have read somewhere that if you replace the internal SSD with an adapter card (I gave you the link above) and m.2 SSD, then Apple won't allow you to internet boot and reinstall MacOS. It checks to ensure you have only an Apple SSD first. I haven't confirmed this, but beware of this possible limitation. 

1. You should have already secure-erased the internal MacOS drive with Parted Magic's secure erase tool. 
1. Next, we will use Apple's internet-loaded Disk Utility to write a new partition table and reformat the wiped drive. 
1. Then we will reinstall MacOS via an internet boot process. 

Here it goes:

Internet boot onto the Apple Disk Utility using <kbd>Option</kbd> + <kbd>Command</kbd> + <bkd>R</bkd> at startup. Then, follow the instructions here: [Use Disk Utility to erase an Intel-based Mac](https://support.apple.com/en-us/HT208496), reformatting the internal drive using Apple's tools. 

Important info to know: when erasing the internal SSD using Apple's Disk Utility (which erase process I think is _not_ secure, contrary to Parted Magic's erase process which *is* secure), it also allows you to simultaneously rewrite the GPT (GUID partition table), which can also be done by Linux's gparted editor, but in addition Apple's Disk Utility allows you to _reformat the new partition with Apple's proprietary APFS filesystem_, which can ONLY be done by Apple utilities! So, using Apple's internet-booted Disk Utility for the secure-erase and simultaneous partitioning and formatting is preferred if you are going to reinstall MacOS when done, but there's no need to do this step if you are just going to install Linux anyway. 

Here are some screenshots showing Apple's Disk Utility format and partition table options. Again, if you're going to reinstall MacOS, I recommend choosing "GUID Partition Map" and "APFS". Refer to the images below. **Do _not_ choose the encrypted "APFS (Encrypted)" option! If you do, the MacOS installer cannot install to this drive later.** This is pretty dumb, and installing Linux Ubuntu doesn't have this limitation, but others have encountered this problem installing MacOS too, and recommend the same solution I recommend: [Ask Different: How to install macOS on a encrypted, journaled filesystem?](https://apple.stackexchange.com/a/265728/212953). See [my comment here](https://apple.stackexchange.com/questions/265706/how-to-install-macos-on-a-encrypted-journaled-filesystem/265728#comment675055_265706). To encrypt your MacOS filesystem later, you'll have to do it via the Apple File Vault after you log in to the MacOS, I think, or perhaps at the end of the installation process. We'll see. Note that when you do eventually encrypt your internal Mac SSD, you'll have to type in an encryption password as well. Keep in mind that if you ever lose or forget your password, you permanently lose all of your data. _It cannot be recovered without your encryption password._

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

Once done reformatting the internal drive with Apple's Disk Utility to the *non*-encrypted "APFS" filesystem, you can reinstall MacOS.


<a id="reinstalling-macos-run-the-internet-booted-installer"></a>
# Reinstalling MacOS: run the internet-booted installer

If still in the Apple Disk Utility from the previous step, exit it back to the Recovery utility's main menu via the top menus: Disk Utility --> Quit Disk Utility. Back at the Recovery utility's main menu (shown in the image below), click on "Reinstall macOS Monterey", or whatever version it says there. Here's an image of what that looks like, from Apple here: [How to reinstall macOS](https://support.apple.com/en-us/HT204904):

<p align="left" width="100%">
    <a href="https://github.com/ElectricRCAircraftGuy/ElectricRCAircraftGuy.github.io/assets/6842199/252c8630-11a1-4c4c-ab48-4a515c9b3696">
        <img width="33%" src="https://github.com/ElectricRCAircraftGuy/ElectricRCAircraftGuy.github.io/assets/6842199/252c8630-11a1-4c4c-ab48-4a515c9b3696"> 
    </a>
</p>

If you are not still in the Apple Disk Utility from the previous step (if you have rebooted or shut down between now and then, for instance), reboot into the internet-booted Apple Recovery utility using <kbd>Option</kbd> + <kbd>Command</kbd> + <bkd>R</bkd> at startup, connect to WiFi, let it load for several minutes, choose your language and click the "-->" symbol to continue, and finally at the Recovery utility's main menu (shown in the image above), choose "Reinstall macOS Monterey", or equivalent.

Note: you can see a full list of Apple's OS versions and whether or not they are still supported, here: <https://en.wikipedia.org/wiki/MacOS_version_history>. If Apple ever quits supporting your MacOS version, which they do somewhere in the 3 to 8 year timeframe of when you bought the MacBook, then I recommend you install Linux Ubuntu instead, as it will always be maintained and give you the freedom to have the latest, secure version.

Follow the installation steps. Connect to internet if you haven't already.

Notes: 
1. If you get to the screen where you are supposed to select your internal disk to install to, and _no disk is available to select_, it is because you haven't yet partitioned nor APFS-formatted it. Go back up to the "repartition and reformat" step above.
1. If you see an error which says, "You may not install to this volume because it has a disk password", then you must return to the "repartition and reformat" step above and erase the disk again using Apple's Disk Utility, but this time choose the _unencrypted_ "APFS" filesystem type instead of the encrypted "APFS (Encrypted" filesystem type.

Choose your newly-formatted into SSD to install to. Again, you won't be able to choose it if you didn't format it yet, or if you mistakenly chose "APFS (Encrypted)".

Once you click "Continue" to begin the installation, an installation progress bar will display. Mine showed "About 2 hours and 19 minutes remaining", then quickly updated to "About 1 hour and 19 minutes remaining" a minute or so later. I'm on a high-speed 1 Gbps fiber internet connection. The total installation time for "macOS Monterey" turned out to be **1 hour 13 min** for me, at which point the screen to "Select Your Country or Region" came up.

There is an option to "Transfer information to this Mac", which is pretty awesome:
1. "From a Mac, Time Machine backup or Startup disk"
    1. To do it from a Mac, you can apparently connect the old Mac to the same wifi network and then "open the Migration Assistant app in the Utilities folder on that Mac, and select 'To another Mac'". That should make transferring data from an old one to a new one easy. Here is that screenshot:

        <p align="left" width="100%">
            <a href="https://github.com/ElectricRCAircraftGuy/ElectricRCAircraftGuy.github.io/assets/6842199/1e9c115e-5c5e-45dd-8b66-e260e0a0f984">
                <img width="33%" src="https://github.com/ElectricRCAircraftGuy/ElectricRCAircraftGuy.github.io/assets/6842199/1e9c115e-5c5e-45dd-8b66-e260e0a0f984"> 
            </a>
        </p>
1. "From a Windows PC".
    1. Connect the Windows PC to the same network, then "download and run the Migration Assistant app on your Windows PC from: <http://www.apple.com/migrate-to-mac>"

Sign in with your Apple ID. If you don't have one, create one.

Create a computer account. Be sure to add a password. If your full name is `firstlast`, I personally like to use an "Account name" of `first`. That will also be the name of your home folder.

Use iCloud Keychain.

I checked the boxes to:
1. [x] "Share Mac Analytics with Apple"
1. [x] "Share crash and usage data with app developers"

Optionally check "Share iCloud Analytics with Apple." I did not check this box.

You'll go through some more screens, such as iCloud and stuff.

<a id="filevault-disk-encryption"></a>
### "FileVault Disk Encryption"

When you get to this screen, I *highly recommend* you enable it! I _think_ this will essentially convert your "AFPS" filesystem to an "APFS (Encrypted)" filesystem, which is what we want! This is important to protect your data. But, it also means that if you ever lose or forget your password, your data is _gone forever!_ I checked both boxes:

> **Would you like to use FileVault to encrypt the disk on your Mac?**
> - [x] Turn on FileVault disk encryption
> - [x] Allow my iCloud account to unlock my disk

<p align="left" width="100%">
    <a href="https://github.com/ElectricRCAircraftGuy/ElectricRCAircraftGuy.github.io/assets/6842199/ad4f88e0-ebe1-4a54-bc0e-7c688589fbfb">
        <img width="33%" src="https://github.com/ElectricRCAircraftGuy/ElectricRCAircraftGuy.github.io/assets/6842199/ad4f88e0-ebe1-4a54-bc0e-7c688589fbfb"> 
    </a>
</p>

---

At this point, it logs you in to your Mac!

Verify your system is encrypted: click the Apple Icon in the top-left, and go to "System Preferences..." --> Security & Privacy --> click the "FileVault" tab at the top. If your system is still in the process of encrypting, I think it will tell you that here. SSDs are *very fast* and encrypt very fast, however, so it may already be done encrypting. If you see "FileVault is turned on for the disk 'Gabe's MacBook'" (or equivalent), and "A recovery key has been set", then it is fully encrypted!

You can also verify this a second way, as follows: do the 4 finger pinch gesture on the trackpad (dragging at least 3 fingers on top down towards your thumb), to open up the "Launchpad" program search tool. Type in "Disk Utility", and open that app. On your internal SSD, it will now say, right underneath the big bold name of the disk at the top, that it is of type **"APFS (Encrypted)"**. Good!

Note: About 100 GB of my 121 GB SSD are available, so apparently the base MacOS installation takes **\~21 GB** of your disk. Clicking the Apple icon --> About This Mac --> Storage, and hovering my mouse over the used disk space once "Calculating..." was done displaying, however, showed that Apple was reporting 15.42 GB used by "macOS", and 5.05 GB by "System Data", for a total of 15.42 + 5.05 = 20.47 GB used.


<a id="post-installation-fixing-up-your-crapbook"></a>
# Post-installation: fixing up your CrapBook

Now that you've got your CrapOS successfully installed, at least go add your Home directory to your Finder. See here: <https://www.cnet.com/tech/computing/how-to-find-your-macs-home-folder-and-add-it-to-finder/>
1. Open Finder.
1. Press Command+Shift+H to open your Home dir.
1. Press Command+UpArrow to go up one directory.
1. Drag your Home directory (named `gabriel` in my case) to the left-hand pane. 
1. Done!

Enable automatic updates: click the Apple icon in the top-left --> System Preferences... --> Software Update (it's a gear icon) --> choose to install any pending updates, and check the box that says "Automatically keep my Mac up to date." Click the "Advanced" button next to that, and ensure everything is checked.

---

This is the worst computer ever. I don't even know how to close a program. Contrary to every other OS in the world, Apple has chosen to make the red X button in the top-left corner of windows *minimize* programs rather than *close* them! I gotta go fix this computer. On to the next step! 


<a id="making-your-hackintosh-upgrading-from-macos-to-linux-ubuntu"></a>
# Making your Hackintosh: upgrading from MacOS to Linux Ubuntu

Next I will remove the 120 GB internal Apple-genuine SSD from the MacBook, install a new 1 TB m.2 SSD from Amazon, and install Linux Ubuntu, so I can feel in-control of my computer again, and once again good about using computers. 

I consider changing from MacOS to Linux Ubuntu to be a definitive upgrade. Linux has its issues, for sure, but it lets me feel more in control of my computer, and I feel far less frustrated fixing my Linux system than I do trying to navigate the insanely unintuitive and overcontrolling MacOS.

<a id="1-prepare-your-ubuntu-live-usb-installation-disk"></a>
### 1. prepare your Ubuntu live USB installation disk

Download the .iso image of the latest version of Ubuntu, here: <https://ubuntu.com/download/desktop>.

Prepare a live USB installation drive of Ubuntu, following Ubuntu's steps, or similar. 
1. If you already have access to an Ubuntu computer, this works: <https://ubuntu.com/tutorials/create-a-usb-stick-on-ubuntu#1-overview>
1. If you don't, this works: <https://ubuntu.com/tutorials/install-ubuntu-desktop#1-overview>

<a id="2-optional-upgrade-the-internal-ssd"></a>
### 2. (Optional) upgrade the internal SSD

If you are going to install over the currently-installed internal SSD, skip this step. 

Buy a special Apple-custom-designed-because-they-are-a-PITA "pentalobe" P5 screwdriver here: [ifixit Essential Electronics Toolkit, $30](https://www.ifixit.com/products/essential-electronics-toolkit). Or find something on Amazon: [Amazon search for "pentalobe screwdriver"](https://amzn.to/3BSklj1).

Now why, why would Apple do that!?--inventing a new screw head for their MacBooks? Because they're A-holes. If they're trying to avoid stripping screw heads, a Torx bit would have worked just fine. It's a similar situation with Apple's proprietary m.2 SSDs with custom pinouts.

Buy these, or something similar:

1. [Sintech NGFF M.2 nVME SSD Adapter Card for Upgrade 2013-2015 Year Macs(Not Fit Early 2013 MacBook Pro) (Black), $15](https://amzn.to/3BU3psK)
1. [WD_BLACK 1TB SN770 NVMe Internal Gaming SSD Solid State Drive - Gen4 PCIe, M.2 2280, Up to 5,150 MB/s - WDS100T3X0E, $55](https://amzn.to/3MDsI7o)

Use the P5 screwdriver to take off the bottom of the MacBook, remove the old SSD drive, install the adapter card into the MacBook, and install the new 1 TB SSD into the adapter card.

Screw the bottom of the laptop back on.

<a id="3-boot-onto-the-ubuntu-live-usb-installation-disk-and-install-ubuntu"></a>
### 3. Boot onto the Ubuntu live USB installation disk and install Ubuntu

TODO (notes to self to improve this section): 
1. [ ] Improve this section as I do it on this laptop, making it more clear and easier to follow.
1. [ ] Before I install Linux, but after I put in the new SSD, let's try to see if 1) internet boot to the Apple Recovery Utility still works, and 2) see if I can install MacOS on the new internal drive! I want to find out.

---

Boot onto the Ubuntu 22.04 installation disk. Use gparted to format the internal drive, with these properties:
1. GPT partition table.
1. 512 MB EFI partition.
1. 1 GB boot partition (see my notes [here](https://serverfault.com/a/1029458/357116) and [here](https://askubuntu.com/a/1265855/327339))
1. LUKS encrypted volume taking up all but 10% of the remainder of the disk. 
1. ext4 LVM within the LUKS-encrypted volume.
1. Leave 10% of the total SSD space empty at the end of it, for [overprovisioning](https://en.wikipedia.org/wiki/Overprovisioning), which helps the SSD drive perform better and mitigate [write amplification](https://en.wikipedia.org/wiki/Write_amplification), thereby extending the life of the SSD.

Install Ubuntu 20.04.


<a id="post-ubuntu-installation-steps"></a>
# Post-Ubuntu-installation steps

I have a lot of things I like to customize, but here are just a few:

1. [Install the Nemo file manager and set it as the default file manager in Ubuntu 22.04](https://askubuntu.com/a/1446372/327339). Nemo is much more space-efficient than Ubuntu's default file manager, Nautilus. See my screenshots at the bottom of my answer [here](https://askubuntu.com/a/1173861/327339).
1. Enable window snapping: [How can I automatically resize a window to 1/4 of the screen and snap it to a corner in Ubuntu 22.04?](https://askubuntu.com/a/1446690/327339)
1. Fix the mouse scroll wheel speed: [How to permanently fix scroll speed in Chrome, Sublime Text, Foxit PDF reader, and any other application you see fit](https://askubuntu.com/a/991680/327339)


<a id="comments-or-questions"></a>
# Comments or questions?

Create a GitHub account and leave a comment or question if you need help.

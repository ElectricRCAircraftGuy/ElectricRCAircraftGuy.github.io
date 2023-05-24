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


All steps below are meant to be followed in order, skipping only those you deep appropriate.


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
    1. This worked for me, and everything passed. If you have failures, however, you'll need to replace hardware, as appropriate. 

See other key combinations [here](https://support.apple.com/en-us/HT201255).

The <kbd>Option</kbd> key alone is used to boot onto an alternative disk, when needed, such as an Ubuntu live USB drive when you are doing file recovery or installing Ubuntu.

I gotta say: this internet boot thing by Apple, to repair your system, is really ingenious! I just wish they weren't such turds that they disable it if you use a regular m.2 SSD with an adapter board. I bought these parts to upgrade my MacBook when I install Linux Ubuntu 22.04 onto it:


#### Notes to self: the total fix

*******
RESULT: so, the total fix for me seems to be:
*******

1. Reboot and hold down Option + Cmd + R to do an internet boot. This restores the necessary boot images (I think?). You can then run the Disk Utility and try to repair the disk per these instructions: <https://support.apple.com/en-us/HT210898>. It will likely fail. 
2. Reboot again and hold down D during startup to run diagnostics. It will run all diags and then *pass*. Once it has passed, it will automatically boot into the Mac and the Mac will magically be working again!


#### Notes to self: internal SSD health notes

SSD health (checked via Gsmartcontrol on a Linux live USB I booted onto): 13.6 TB written. Drive is 120 GB **x 400 wear multiplier** / 1000 GB/TB = 48 TB estimated max TBW (Terabytes Written) write rating. 
So, the writes are 13.6/48 = 28.33% life used. BUT...the computer is from 2015, making the drive about 8 years old, so it's 80% of its useful _time_ life, which is generally considered 10 years or so for flash memory. It's also very small, at only 120 GB! 

So, my plan is to buy an external enclosure to copy all data to. I'll reinstall the MacOS onto this internal drive, since it's Apple-genuine and I think that's required for the Apple internet-boot-installation process to work. But, knowing it may not be reliable, I'll then remove it. If I wanted to continue using MacOS, I'd `ddrescue` the data from it (_after_ reinstalling MacOS) to a new SSD which I'd put into the MacOs (see my `ddrescue` examples in my answers [here](https://unix.stackexchange.com/a/743566/114401) and [here](https://unix.stackexchange.com/a/743566/114401) and [here](https://www.electricrcaircraftguy.com/2018/01/how-to-clone-your-hard-drive.html)). I'll then save the old drive so I always have the genuine Apple SSD lying around in case I ever need it for internet boots and recoveries again in the future. My new m.2 SSD, with adapter, would become the new internal drive. It would have a new write life and 10-year time life, to be reliable.


## External enclosure and SSD to buy, as well as an internal adapter board so I can buy an extra m.2 SSD to replace the internal one too

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
    1. BE PATIENT!: if you are running from a slow USB drive, for instance, or for whatever other reason, you may have periods of time where `rsync` seems to be frozen for dozens of minutes at a time. Just wait. It's not frozen. It will continue eventually.
    1. For 74 GB of data, which was \~1M files, going to an external 500 GB Western Digital blue 3500MB/s SSD, using rsync, this took about **2 hours** for me.
1. When done, you can _secure erase_ the internal Mac drive so that whoever owned this computer before can feel safe letting you have it (assuming you are helping recover someone's photos and files in exchange for you keeping the old laptop, for instance). 


## Recovering deleted or corrupted files

See my answer here: [Recovering deleted or lost files using [`photorec`](https://www.cgsecurity.org/wiki/PhotoRec) and other tools](https://unix.stackexchange.com/a/743566/114401).


## Perform secure erase on the old MacBook's internal SSD

Secure erase the MacBook's internal SSD so that no data on the old drive can be recovered.

This is a good idea if an exchange is happening between two people of the physical laptop, including the old SSD. This way, the person giving away the laptop can know their data is truly wiped. 

Note: if the MacBook was encrypted via Apple's File Vault and an "APFS (Encrypted)" file system, however, then this step can optionally be skipped. Simply writing a new partition table and formatting new partitions with gparted is enough, since the encryption password was secret anyway. Secure erasing is just good measure though, and is fast.

First, pay $15 for [Parted Magic](https://partedmagic.com/), since it has a secure erase utility built-in. (You could probably also figure out how to install secure erase into an Ubuntu 22.04 live USB, but I haven't done that yet. Save your time; pay the money.) Optionally, also buy the "Disk Verifier" 3rd-party plugin for it as well. A link to it is on this page: <https://partedmagic.com/store/>. Direct link: <https://www.hamishmb.com/html/diskverifier.php>. It's £5 (\~$7) for the Disk Verifier add-on. 

Hold down <kbd>Option</kbd> and boot onto Parted Magic on your Mac. Use the secure erase utility to wipe the whole internal drive, now that you already got the files off of it in the previous step. This takes just a few seconds. If you bought the Disk Verifier, it will then auto-run and scan the whole disk to ensure no unerased data can be found.


## Putting someone's old MacBook photos into the Photos app in their new MacBook

Again, Apple is a total PITA and tries too hard to think for everyone, abstracting away even the filesystem from the Photos app. This is nuts. I lost like an hour trying to figure out how to bring in the photos from someone's old MacBook to their new MacBook. Here is how:

1. On their new MacBook, plug in the exFAT SSD we previously copied all of their data to using rsync. 
1. Open a Finder window, and press [<kbd>Shift</kbd> + <kbd>Command</kbd> + <kbd>G</kbd>](https://support.apple.com/en-us/HT201236#:~:text=Shift%2DCommand%2DG%3A%20Open,the%20current%20macOS%20user%20account.) to go to a dir. Go to the path at (I'm doing this from memory, so it may be wrong a little) `/Users/myusername/Pictures/`. Keep this open in one Finder window [wow is Finder ever a total piece of trash!].
1. Open the plugged-in drive and navigate to that same directory. Copy the `Pictures` dir from the external SSD to the `Pictures` dir on the new MacBook, via drag-and-drop. 
1. In the Finder, navigate into the `Pictures/Photos` dir you just dropped onto the new MacBook. As you double-click on `Photos` to enter it, the new MacBook will begin an import process to bring these into the Photos app on your new MacBook. The process will take maybe 10 minutes or so for 20 GB of photos. 
1. For any other photos you manually managed via the Finder, outside your overcontrolling Photos app, go to File --> Import in the Photos app to bring them in. It would be a good idea to copy them from your external SSD to your new MacBook before doing this, though, to speed it up, since Mac likes the internal drive better and feels iffy about exFAT.


## Reinstalling MacOS: repartition and reformat the internal drive using Apple's internet-booted Disk Utility

/////////DO *NOT* CHOOSE the encrypted option! The installer cannot run if you do!

If you want to reinstall MacOS via the internet boot option, onto your freshly-secure-wiped internal drive, follow these steps. If you just want to install Ubuntu instead, you can skip them. 

I have read somewhere that if you replace the internal SSD with an adapter card (I gave you the link above) and m.2 SSD, then Apple won't allow you to internet boot and reinstall MacOS. It checks to ensure you have only an Apple SSD first. I haven't confirmed this, but beware of this possible limitation. 

1. You should have already secure-erased the internal MacOS drive with Parted Magic's secure erase tool. 
1. Next, we will use Apple's internet-loaded Disk Utility to write a new partition table and reformat the wiped drive. 
1. Then we will reinstall MacOS via an internet boot process. 

Here it goes:

Try internet booting onto the Apple Disk Utility using <kbd>Option</kbd> + <kbd>Command</kbd> + <bkd>R</bkd> at startup. Then, follow the instructions here: [Use Disk Utility to erase an Intel-based Mac](https://support.apple.com/en-us/HT208496), reformatting the internal drive using Apple's tools. 

Important info to know: when erasing the internal SSD using Apple's Disk Utility (which erase process I think is _not_ secure, like Parted Magic's), it also allows you to simultaneously rewrite the GPT (GUID partition table), which can also be done by Linux's gparted editor, but in addition Apple's Disk Utility allows you to _reformat the new partition with Apple's proprietary APFS filesystem_, which can ONLY be done by Apple utilities! So, using Apple's internet-booted Disk Utility for the secure-erase and simultaneous partitioning and formatting is preferred if you are going to reinstall MacOS when done, but there's no need to do this step if you are just going to install Linux anyway. 

Here are some screenshots showing Apple's Disk Utility format and partition table options. Again, if you're going to reinstall MacOS, I recommend choosing "GUID Partition Map" and "APFS (Encrypted)", as shown in the images below. If you choose the encrypted option, you'll have to type in an encryption password as well. Keep in mind that if you ever lose or forget your password, you permanently lose all of your data. _It cannot be recovered without your encryption password._

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

Once done reformatting the internal drive with Apple's Disk Utility, you can reinstall MacOS.


## Reinstalling MacOS: run the internet-booted installer

If still in the Apple Disk Utility from the previous step, exit it back to the Recovery utility's main menu via the top menus: Disk Utility --> Quit Disk Utility. Back at the Recovery utility's main menu, click on "Reinstall macOS Monterey", or whatever version it says there. Here's an image of what that looks like, from Apple here: [How to reinstall macOS](https://support.apple.com/en-us/HT204904):

<p align="left" width="100%">
    <a href="https://github.com/ElectricRCAircraftGuy/ElectricRCAircraftGuy.github.io/assets/6842199/252c8630-11a1-4c4c-ab48-4a515c9b3696">
        <img width="33%" src="https://github.com/ElectricRCAircraftGuy/ElectricRCAircraftGuy.github.io/assets/6842199/252c8630-11a1-4c4c-ab48-4a515c9b3696"> 
    </a>
</p>

If you are not still in the Apple Disk Utility from the previous step, reboot into the internet-booted Apple Recovery utility using <kbd>Option</kbd> + <kbd>Command</kbd> + <bkd>R</bkd> at startup, connect to WiFi, let it load for several minutes, choose your language and click the "-->" symbol to continue, type in your encryption password if you previously set up encryption, and finally at the Recovery utility's main menu, choose "Reinstall macOS Monterey", or equivalent.

Note: you can see a full list of Apple's OS versions and whether or not they are still supported, here: <https://en.wikipedia.org/wiki/MacOS_version_history>. If Apple ever quits supporting your MacOS version, which they do somewhere in the 3 to 8 year timeframe, I recommend you install Linux Ubuntu instead, as it will always be maintained and give you the freedom to have the latest, secure version.

Follow the installation steps. Connect to internet if you aren't already.

Notes: 
1. If you get to the screen where you are supposed to select your internal disk to install to, and _no disk is available to select_, it is because you haven't yet partitioned nor APFS-formatted it. Go back up to the "repartition and reformat" step above.
1. If you see an error which says, "You may not install to this volume because it has a disk password", then you must return to the "repartition and reformat" step above and erase the disk again using Apple's Disk Utility, but this time choose the _unencrypted_ "APFS" filesystem type instead of the encrypted "APFS (Encrypted" filesystem type. 


## Making your Hackintosh: upgrading to Linux Ubuntu, because MacOS sucks

Download the .iso image of the latest version of Ubuntu, here: <https://ubuntu.com/download/desktop>.

Prepare a live USB installation drive of Ubuntu, following Ubuntu's steps, or similar. 
1. If you already have access to an Ubuntu computer, this works: <https://ubuntu.com/tutorials/create-a-usb-stick-on-ubuntu#1-overview>
1. If you don't, this works: <https://ubuntu.com/tutorials/install-ubuntu-desktop#1-overview>

If you are going to install over the currently-installed internal SSD

Buy a special Apple-custom-designed-because-they-are-a-PITA P5 "pentalobe", or similar, screwdriver here: 

Boot onto it. 

<https://serverfault.com/a/1029458/357116>


## Post-Ubuntu-installation steps

I have a lot of things I like to customize, but here are just a few: ///////////just add named links, nothing else//////

1. nemo
1. window snapping
1. mouse scroll wheel

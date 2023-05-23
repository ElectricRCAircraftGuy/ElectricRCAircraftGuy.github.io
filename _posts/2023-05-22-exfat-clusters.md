---
published: true  # use "false" while drafting articles just before publishing
title: exFAT filesystem _speed_ and _disk usage_ based on cluster size
tags: 
    - programming
    - computers
    - linux
    - ubuntu
# date: 1999-12-31
# last_modified_at: 2023-05-05  # updates the "Updated" date at the bottom!
# permalink: /test/
# redirect_from: 
# categories: 
toc: true  # (default for Table of Contents is true)
---

In my opinion, exFAT is the best filesystem to use when sharing files between **Mac and Windows**, **Linux and Mac**, **Windows and Mac**, or **Windows, Mac, and Linux**, because it is supported by all three operating systems for both read and write operations with minimal hassle. Windows, Mac, and Linux Ubuntu all come by default now with the ability to read, write, and format exFAT filesystems. One thing to be aware of, however, is *cluster size*. 

As you may know, a typical hard drive or SSD is broken up into sectors of 512 bytes each. When formatting an exFAT filesystem onto a partition, however, you have the option to set the *cluster size*, which is how many sectors will be grouped together to make up the smallest block of memory possible to allocate to a file. So, if you format your exFAT filesystem to have a cluster size of **4 KiB**, for example, then even if your file only takes **1 byte**, it must be allocated 1 whole cluster of **4 KiB**, as that's the smallest unit supported for your filesystem. If your cluster size is **32 MiB**, however, which is the largest allowed cluster size for exFAT, then your little 1-byte file now takes up **32 MiB!** You can see how this can get out of hand quickly! If you have 10000 1-byte files, those 10 KiB of files now take up a whopping 32 MiB x 10000 = **312.5 GiB** of disk space! That's nuts!

Again, a "cluster" is the smallest chunk of memory possible to be used by the file system. So, if a cluster is 4 KiB, for instance, and your file is only **1 byte**, it will still take up a full cluster, or **4 KiB**, on disk. This is what Windows refers to as "Size on disk". In this case, the file "Size" is 1 byte, whereas the "Size on disk" is 4 KiB, or 4096 bytes. See: [Super User: What is the difference between “Size” and “Size on disk?”](https://superuser.com/a/66826/425838).

To learn more, I spent a day testing and plotting. Here is the data I collected. Again, exFAT cluster size has a *significant* (I mean: huuuuge!) effect on both _speed_ and _disk usage_ for a given set of files. The top-left plot trends apply regardless of how many small files you have, since I did those tests by `rsync`ing over a single 5.3 GB file to the exFAT external SSD, but the other three plots are exacerbated by the quantity of tiny files I have (just over 1 million files, comprising 74 GB). The linear trend in the bottom-right applies to everyone, but its _slope_, and therefore the y-axis values, depends on how many small files you have. 

[![exFAT plots](https://github.com/ElectricRCAircraftGuy/ElectricRCAircraftGuy.github.io/assets/6842199/12b2635d-653a-40ec-b438-d1106672b9d9)](https://github.com/ElectricRCAircraftGuy/ElectricRCAircraftGuy.github.io/assets/6842199/12b2635d-653a-40ec-b438-d1106672b9d9)

My SSD I tested is as follows:
1. [Western Digital 500GB WD Blue SN570 NVMe Internal Solid State Drive SSD - Gen3 x4 PCIe 8Gb/s, M.2 2280, Up to 3,500 MB/s - WDS500G3B0C, $32](https://amzn.to/3q6I8cz)
1. The enclosure I used is [SSK Aluminum M.2 NVME SATA SSD Enclosure Adapter, USB 3.2 Gen 2 (10 Gbps) to NVME PCI-E SATA M-Key/(B+M) Key Solid State Drive External Enclosure Support UASP Trim for NVME/SATA SSDs 2242/2260/2280, $16](https://amzn.to/3OA5cKW)

If you study the plots above carefully, you'll see that for my disk, an 8 KiB cluster is pretty fast at 338 MB/sec write speed, but not the fastest. It has okay file storage overhead for my MacOs system I'm backing up too, taking 82 GB of disk space to store my 74 GB of my \~1M files. That's only a 10.14% overhead, which is acceptable. Using a cluster size of 128 KiB increases the write speed to 390 MB/sec, but has a massive file storage overhead of 162.16%. Don't even think of going higher than 128 KiB cluster size or else your storage overhead blows up when you have a lot of tiny files. 

So, I'll use an exFAT cluster size of **8 KiB** for my drive.


## Formatting an exFAT drive on Linux Ubuntu

I recommend 8 KiB clusters, but you can choose what you like based on the plots above. If all you have is very large files, your "Wasted space" plots may differ tremendously from mine, as my tests were on a computer with a ton of small files.

Note that if you use the Gnome Disks GUI to format your exFAT partition, that works, but it gives you _no control_ over the cluster size. I think it just uses Microsoft's recommended cluster sizes based on the disk size. See the table at the very bottom of this article. So, for my 500 GB SSD, formatting it to exFAT with Gnome Disks created a cluster size of 128 KiB, which is bigger than I want, as I results in a lot of wasted disk space.

WARNING: DATA LOSS CAN HAPPEN. If you are formatting the drive or writing a partition table, it will ERASE IT. Ensure it's backed up. Also, be sure to SELECT THE CORRECT DRIVE TO FORMAT OR PARTITION when doing the steps below. 

Check once, twice, and triple check before hitting enter or running any command to format.

1. [THIS WILL ERASE THE WHOLE DISK] First, prepare your drive by **using gparted to write a GPT partition table:** open gparted GUI --> select your correct device in the drop-down menu in the top-right --> click "Device" in the top menu --> "Create Partition Table..."" --> choose "gpt" from the dropdown menu --> click Apply. 
1. [THIS WILL ERASE THE DISK] Then, **partition your disk**: in gparted still, right click on the empty space on the disk --> New --> from the "File system" dropdown menu, choose a format it can handle, such as "fat32". Gparted cannot format to exFAT, so we will do that next from the command line. Add a label if desired, such as "My_exFAT". Click "Add" when done --> click the green checkmark to "Apply all operations" when done. This will partition the drive. 
1. Write down the `/dev` name you see for this partition in gparted. Ex: for me it is `/dev/sda1`. Click on "View" and ensure "Device Information" is checked. In the left-hand "Device Information" pane, make note of your "Sector size". For me it is 512 bytes. That's it for the GUI. You may close gparted. 

From the command-line, run the following:
```bash

# ensure the partition is unmounted (use Tab to autocomplete once you start
# typing this)
sudo umount /media/your_name/your_disk

# Ensure your dependencies are installed. 
# See: https://itsfoss.com/format-exfat-linux/
sudo apt update 
sudo apt install exfat-fuse exfat-utils  # for Ubuntu 20.04 and earlier
sudo apt install exfat-fuse exfatprogs   # for Ubuntu 22.04 and later

# Now, format your partition to exFAT
# - WARNING: BE SURE TO UPDATE `/dev/sda999` TO WHATEVER IT SHOULD BE FOR YOU IN
#   THE COMMANDS BELOW, so you format the correct disk. 
# - Choose the correct command for your desired cluster size. 
# - You can use any power-of-2 number in the `-s num` option, thereby choosing a
#   custom cluster size if desired.

# NB: **creation** speed goes way faster for larger clusters too! The times
# below in parenthesis are for creating an exFAT file system of these cluster
# sizes on a 500 GB Western Digital Blue (rated 3500 MB/sec) SSD.
#
# Also, when using a file manager to right click and create a new folder, there
# was a very noticeable lag when I did it with a cluster size of 0.5 KiB. 
#
# Set the name after `-n` to whatever you want too. `-s` specifies how many
# sectors to use per cluster. Assuming you have 512 byte sectors, the following
# cluster size comments are accurate.
#
#                                                       cluster size  (format time)
#                                                       ----------    -------------
time sudo mkexfatfs -n "my_exFAT" -s 1 /dev/sda999     #   0.5 KiB (512 byte) 
                                                     #     clusters (10 sec)
time sudo mkexfatfs -n "my_exFAT" -s 8 /dev/sda999     #   4 KiB clusters (1.340 sec)
time sudo mkexfatfs -n "my_exFAT" -s 16 /dev/sda999    #   8 KiB clusters (0.698 sec) <=== WHAT I USE AND RECOMMEND: 8 KiB clusters
time sudo mkexfatfs -n "my_exFAT" -s 64 /dev/sda999    #  32 KiB clusters (0.230 sec)
time sudo mkexfatfs -n "my_exFAT" -s 256 /dev/sda999   # 128 KiB clusters (0.075 sec)
time sudo mkexfatfs -n "my_exFAT" -s 65536 /dev/sda999 # 32 MiB clusters (0.120 sec) [absolute max cluster size allowed!]
```


## Checking your cluster size on *any* already-formatted filesystem

Now mount the drive via your file manager GUI. Ensure gparted is closed for this to work. Then, click the disk and it will auto-mount. 

Check your cluster size per my instructions here: [How to find the cluster size of _any_ filesystem, whether NTFS, Apple APFS, ext4, ext3, FAT, exFAT, etc.](https://serverfault.com/a/1131628/357116):
```bash
cd /media/your_name/your_disk

# Check cluster size by making and checking a 2-byte (1 char + null terminator I
# think) file. 
echo "1" > test.txt
# This is how many bytes this file actually *takes up* on this disk!
du -h test.txt

# Check file size. This is the number of bytes in the file itself.
ls -alh test.txt | awk '{print $5}'
```


## Test data: how did I perform the tests to make the plots above?

Note: Gnome Disks tested my disk and showed it to have the following performance. I ran the test various times when the exFAT partition was formatted with different cluster sizes, and it seems to make no difference. So, Gnome Disks must perform operations lower than the filesystem layer when performing the partition or disk benchmark. 

[![enter image description here][2]][2]

#### Disk usage tests: I backed up an old 2015 MacBook (74 GB on a 512-byte-cluster-size APFS filesystem --> 194 GB on a 128-KiB-cluster-size exFAT filesystem)

To conduct the disk usage test, I formatted my external SSD partition to exFAT with a cluster size of 128 KiB. 

I then booted onto an Ubuntu 22.04 Live USB [using the `toram` boot option](https://askubuntu.com/a/829962/327339) to run from RAM directly. I followed [my instructions here](https://github.com/linux-apfs/linux-apfs-rw/issues/42#issuecomment-1556103266) to install [`linux-apfs-rw`](https://github.com/linux-apfs/linux-apfs-rw) to allow me to mount the 2015 MacBook's unencrypted APFS Apple Filesystem. I then used [my exFAT `rsync` mirror instructions here](https://superuser.com/a/1785111/425838) to back up the whole disk from the internal MacBook SSD to my exFAT external SSD. The command I ran looked like this:
```bash
SOURCE_PATH="path/to/source/dir"
DESTINATION_PATH="path/to/destination/dir"

time sudo rsync -hvrltD --modify-window=1 --stats --info=progress2 \
    --delete --delete-excluded "$SOURCE_PATH/" "$DESTINATION_PATH/"
```

It took dozens of minutes to finish, and appeared to freeze sometimes, but would always continue if I just left it alone long enough (dozens of minutes). When it was done, I turned off the liveUSB and plugged in the external drive to my main Linux computer. `time sudo find | wc -l` revealed there were about 1 million files on the drive (as did the rsync summary). `time du -sh`, as well as looking at gparted, showed the drive was taking up **194 GB** of data on the new 128 KiB-cluster-size exFAT external SSD, even though it was only **74 GiB** on the original APFS MacBook which had a 512-byte cluster size. This means that 194 GB - 74 GB = **120 GB** of data was wasted space due to cluster size differences. 

I used that information to produce 3 of the plots above, knowing that wasted space is linearly proportional to the cluster size. All but the top-left plot were produced with this data. My full plotting code is here, if you'd like to study it: <https://github.com/ElectricRCAircraftGuy/eRCaGuy_hello_world/blob/master/stack_exchange/format_exFAT_PLOTS.py>. This part of code shows the calculations for what I just talked about:
```py
gb_0_5 = 74  # GB used for a cluster size of 0.5 KiB (measured)
gb_128 = 194 # GB used for a cluster size of 128 KiB (measured)
wasted_gb = gb_128 - gb_0_5
# In GB; estimated. This assumes that *all* of the wasted space is due to small, individual files
# which take up a *single* cluster each. So, the decreased space they'd take up is directly
# proportional to the cluster size difference.
# We do cluster_size_KiB / 128_KiB, since the 128 KiB cluster size is the one we actually
# measured with real data, post-copy!
y_size_on_disk_gb = [
    # gb_0_5,
    gb_0_5 + wasted_gb*(0.5/128),
    gb_0_5 + wasted_gb*(4/128),
    gb_0_5 + wasted_gb*(8/128),
    gb_0_5 + wasted_gb*(32/128),
    gb_0_5 + wasted_gb*(128/128),
    gb_0_5 + wasted_gb*(32768/128),
]
```


### exFAT speed write tests

For testing write speed, I used the external hard drive again plugged into my main Linux machine. I formatted it to a new exFAT cluster size, then would use `rsync` to copy over a 5.3 GB Windows 10 .iso image from my main Linux computer to the exFAT partition. I'd then `rm` that file, and run it again, timing both the copy and erase times for each step, running the process usually 3 times per exFAT cluster size. Here are some example commands:

Formatting to 32 MiB cluster size:
```bash
$ time sudo mkexfatfs -n "my_exFAT" -s 65536 /dev/sda1 # 32 MiB clusters (0.120 sec) [absolute max cluster size allowed!]
mkexfatfs 1.3.0
Creating... done.
Flushing... done.
File system created successfully.

real    0m0.129s
user    0m0.014s
sys 0m0.048s
```

Running some `rsync` speed tests on the 32 MiB cluster size, copying *to* the exFAT drive:
```bash
$ time rsync --info=progress2 /home/gabriel/Downloads/OSs/Windows/Win10_2004_English_x64.iso /media/gabriel/my_exFAT/
  5,268,953,088 100%  437.09MB/s    0:00:11 (xfr#1, to-chk=0/1)

real    0m11.544s
user    0m2.168s
sys 0m5.686s
$ time rm /media/gabriel/my_exFAT/Win10_2004_English_x64.iso 

real    0m0.315s
user    0m0.004s
sys 0m0.305s
$ time rsync --info=progress2 /home/gabriel/Downloads/OSs/Windows/Win10_2004_English_x64.iso /media/gabriel/my_exFAT/
  5,268,953,088 100%  409.12MB/s    0:00:12 (xfr#1, to-chk=0/1)

real    0m12.334s
user    0m2.191s
sys 0m6.609s
$ time rm /media/gabriel/my_exFAT/Win10_2004_English_x64.iso 

real    0m0.360s
user    0m0.001s
sys 0m0.350s
$ time rsync --info=progress2 /home/gabriel/Downloads/OSs/Windows/Win10_2004_English_x64.iso /media/gabriel/my_exFAT/
  5,268,953,088 100%  436.98MB/s    0:00:11 (xfr#1, to-chk=0/1)

real    0m11.554s
user    0m2.306s
sys 0m6.401s
$ time rm /media/gabriel/my_exFAT/Win10_2004_English_x64.iso 

real    0m0.336s
user    0m0.005s
sys 0m0.328s
```

I then manually took the output from running those tests above and put it into this table. I then used the data from this table to produce the plots:

```
----------------------------------------------------
0.5 KiB (512 byte) clusters (1 x 512 byte sector)
----------------------------------------------------
exFAT creation time (sec):  10

Write time (sec):   57.566  51.939
Write speed (MB/s): 87.36   96.84
Erase time (sec):   unk     15.015

----------------------------------------------------
4 KiB clusters (8 x 512 byte sectors)
----------------------------------------------------
exFAT creation time (sec):  1.340

Write time (sec):   17.664  14.322  16.296
Write speed (MB/s): 285.36  352.37  309.35
Erase time (sec):   2.061   1.842   1.981

----------------------------------------------------
8 KiB clusters (16 x 512 byte sectors)
----------------------------------------------------
exFAT creation time (sec):  0.698

Write time (sec):   15.138  15.711  13.987
Write speed (MB/s): 333.19  320.87  360.62
Erase time (sec):   1.301   1.111   1.175

----------------------------------------------------
32 KiB clusters (64 x 512 byte sectors)
----------------------------------------------------
exFAT creation time (sec):  0.230

Write time (sec):   13.989  15.317  13.017
Write speed (MB/s): 360.59  329.26  387.60
Erase time (sec):   0.583   0.495   0.546

----------------------------------------------------
128 KiB clusters (256 x 512 byte sectors)
----------------------------------------------------
exFAT creation time (sec):  0.075

Write time (sec):   12.873  13.866  12.202
Write speed (MB/s): 392.01  363.88  413.63
Erase time (sec):   0.396   0.343   0.380

----------------------------------------------------
32 MiB clusters (65536 x 512 byte sectors)
----------------------------------------------------
exFAT creation time (sec):  0.120

Write time (sec):   11.544  12.334  11.554
Write speed (MB/s): 437.09  409.12  436.98
Erase time (sec):   0.315   0.360   0.336
```

Again, my full Python Matplotlib and numpy plotting code is here: <https://github.com/ElectricRCAircraftGuy/eRCaGuy_hello_world/blob/master/stack_exchange/format_exFAT_PLOTS.py>.


## See also

1. My comments under [this question](https://superuser.com/q/417402/425838).
1. My own answer here: [Is it best to reformat the hard drive to exFAT using 512kb chunk, or smaller or bigger chunks?](https://superuser.com/a/1785239/425838)


## References and going further
(most of these are my answers)

1. matplotlib show zeros on log axis: https://stackoverflow.com/a/40336300/4561887
1. matplotlib show titles: https://stackoverflow.com/a/76311048/4561887
1. my answer: [How to plot the `(x, y)` text for each point using `plt.text()`, and handle the first and last points with custom text formatting](https://stackoverflow.com/a/76309590/4561887) 
1. numpy and matplotlib: fitting curve fit to data: https://stackoverflow.com/a/76311162/4561887
1. How to install `linux-apfs-rw` on live usb to read APFS filesystems: https://github.com/linux-apfs/linux-apfs-rw/issues/42#issuecomment-1556103266
1. [didn't work well for me, but worth knowing about] installing `apfs-fuse`: https://github.com/sgan81/apfs-fuse/issues/180#issuecomment-1548731542
1. my exFAT rsync instructions: https://superuser.com/a/1785111/425838
1. my answer on exFAT cluster sizes: https://superuser.com/a/1785239/425838
1. My answer on how to determine the cluster size of any filesystem you have: [Server Fault: How to find the cluster size of _any_ filesystem, whether NTFS, Apple APFS, ext4, ext3, FAT, exFAT, etc.](https://serverfault.com/a/1131628/357116)
1. [REALLY USEFUL] [Support.Microsoft.com: Default cluster size for NTFS, FAT, and exFAT](https://support.microsoft.com/en-us/topic/default-cluster-size-for-ntfs-fat-and-exfat-9772e6f1-e31a-00d7-e18f-73169155af95):

    > #### Default cluster sizes for exFAT
    >
    > The following table describes the default cluster sizes for exFAT.
    > 
    > | Volume size | Windows 7, Windows Server 2008 R2, Windows Server 2008, <br>Windows Vista, Windows Server 2003, Windows XP |
    > | ----------- | ------- |
    > | 7 MB–256 MB | 4 KB |
    > | 256 MB–32 GB | 32 KB |
    > | 32 GB–256 TB | 128 KB |
    > | \> 256 TB | Not supported |



  [2]: https://i.stack.imgur.com/8hsqy.jpg

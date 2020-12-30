---
# title: 
---

GS  
21 Dec. 2020

Show how to install the latest one. Show some speed tests too.


    sudo apt install sshfs

On Ubuntu 20.04:

    $ sshfs --version
    SSHFS version 2.10.0
    FUSE library version: 2.9.9
    fusermount version: 2.9.9
    using FUSE kernel interface version 7.19

[sshfs speed tests vs latest versions](https://www.google.com/search?q=sshfs+speed+tests+vs+latest+versions&oq=sshfs+speed+tests+vs+latest+versions&aqs=chrome..69i57.11366j0j9&sourceid=chrome&ie=UTF-8)

https://github.com/libfuse/sshfs

https://blog.ja-ke.tech/2019/08/27/nas-performance-sshfs-nfs-smb.html

My steps: https://github.com/libfuse/sshfs/issues/99#issuecomment-749387007 

### build:

    git clone https://github.com/libfuse/sshfs.git # <==== DON'T DO THIS! DOWNLOAD LATEST TARBALL RELEASE INSTEAD!

Find the release you want here: https://github.com/libfuse/sshfs/releases
Find the link to the \*.tar.gz file you want. Ex: https://github.com/libfuse/sshfs/archive/sshfs-3.7.1.tar.gz

Download and extract it:

    wget https://github.com/libfuse/sshfs/archive/sshfs-3.7.1.tar.gz

Assuming it's named "sshfs-3.7.1.tar.gz", extract it:

    tar -xvzf sshfs-3.7.1.tar.gz


    # cd sshfs
    cd sshfs-sshfs-3.7.1

    mkdir build
    cd build

    
    # install dependencies
    sudo apt update
    sudo apt install meson cmake fuse3 libfuse3-dev libglib2.0-dev

    meson ..

Note: `mesonconf` doesn't work, so use `meson configure` instead! See `meson -h` for help options.

    ninja # build and link; this produces the `sshfs` executable output!

    ~/GS/dev/sshfs/src/sshfs-sshfs-3.7.1/build$ ./sshfs --version
    SSHFS version 3.7.1
    FUSE library version 3.9.0
    using FUSE kernel interface version 7.31
    fusermount3 version: 3.9.0

soft install:

    mkdir ~/bin
    ln -si $(pwd)/sshfs ~/bin

test:

    . ~/.bashrc
    sshfs --version

    $ sshfs --version
    SSHFS version 3.7.1
    FUSE library version 3.9.0
    using FUSE kernel interface version 7.31
    fusermount3 version: 3.9.0


----

    ~/GS/dev/sshfs/build$ ./sshfs --version
    SSHFS version 3.7.1
    FUSE library version 3.9.0
    using FUSE kernel interface version 7.31
    fusermount3 version: 3.9.0

    ~/GS/dev/sshfs/build$ sshfs --version
    SSHFS version 2.10.0
    FUSE library version: 2.9.9
    fusermount3 version: 3.9.0
    using FUSE kernel interface version 7.19

----------------------

Speed tests:

## sshfs version 2.10.0:

    sshfs -o reconnect,ServerAliveInterval=15,ServerAliveCountMax=3 my_username@10.0.0.1:/ ~/mnt/toshiba_root

Results:

    ~/GS/dev$ time rsync -rah --info=progress2 --stats ~/GS/dev/AlfaWiFiAdapterSoftware/.git ~/mnt/toshiba_root~/temp/test1
            528.37M 100%    5.30MB/s    0:01:35 (xfr#91, to-chk=0/161)  

    Number of files: 161 (reg: 91, dir: 70)
    Number of created files: 161 (reg: 91, dir: 70)
    Number of deleted files: 0
    Number of regular files transferred: 91
    Total file size: 528.37M bytes
    Total transferred file size: 528.37M bytes
    Literal data: 528.37M bytes
    Matched data: 0 bytes
    File list size: 0
    File list generation time: 0.001 seconds
    File list transfer time: 0.000 seconds
    Total bytes sent: 528.51M
    Total bytes received: 2.06K

    sent 528.51M bytes  received 2.06K bytes  5.53M bytes/sec
    total size is 528.37M  speedup is 1.00

    real    1m35.614s
    user    0m7.506s
    sys 0m5.164s
    $SHLVL:1 
    ~/GS/dev$ time rsync -rah --info=progress2 --stats ~/GS/dev/AlfaWiFiAdapterSoftware/.git ~/mnt/toshiba_root~/temp/test2
            528.37M 100%    5.52MB/s    0:01:31 (xfr#91, to-chk=0/161)  

    Number of files: 161 (reg: 91, dir: 70)
    Number of created files: 161 (reg: 91, dir: 70)
    Number of deleted files: 0
    Number of regular files transferred: 91
    Total file size: 528.37M bytes
    Total transferred file size: 528.37M bytes
    Literal data: 528.37M bytes
    Matched data: 0 bytes
    File list size: 0
    File list generation time: 0.001 seconds
    File list transfer time: 0.000 seconds
    Total bytes sent: 528.51M
    Total bytes received: 2.06K

    sent 528.51M bytes  received 2.06K bytes  5.78M bytes/sec
    total size is 528.37M  speedup is 1.00

    real    1m31.572s
    user    0m8.210s
    sys 0m5.683s
    $SHLVL:1 
    ~/GS/dev$ time rsync -rah --info=progress2 --stats ~/GS/dev/AlfaWiFiAdapterSoftware/.git ~/mnt/toshiba_root~/temp/test3
            528.37M 100%    5.59MB/s    0:01:30 (xfr#91, to-chk=0/161)  

    Number of files: 161 (reg: 91, dir: 70)
    Number of created files: 161 (reg: 91, dir: 70)
    Number of deleted files: 0
    Number of regular files transferred: 91
    Total file size: 528.37M bytes
    Total transferred file size: 528.37M bytes
    Literal data: 528.37M bytes
    Matched data: 0 bytes
    File list size: 0
    File list generation time: 0.001 seconds
    File list transfer time: 0.000 seconds
    Total bytes sent: 528.51M
    Total bytes received: 2.06K

    sent 528.51M bytes  received 2.06K bytes  5.78M bytes/sec
    total size is 528.37M  speedup is 1.00

    real    1m30.688s
    user    0m8.241s
    sys 0m5.638s


## sshfs version 3.7.1:

    gs_sshfs_toshiba_umount
    gs_sshfs_toshiba

    ~/GS/dev$ time rsync -rah --info=progress2 --stats ~/GS/dev/AlfaWiFiAdapterSoftware/.git ~/mnt/toshiba_root~/temp/test4
            528.37M 100%    6.02MB/s    0:01:23 (xfr#91, to-chk=0/161)  

    Number of files: 161 (reg: 91, dir: 70)
    Number of created files: 161 (reg: 91, dir: 70)
    Number of deleted files: 0
    Number of regular files transferred: 91
    Total file size: 528.37M bytes
    Total transferred file size: 528.37M bytes
    Literal data: 528.37M bytes
    Matched data: 0 bytes
    File list size: 0
    File list generation time: 0.001 seconds
    File list transfer time: 0.000 seconds
    Total bytes sent: 528.51M
    Total bytes received: 2.06K

    sent 528.51M bytes  received 2.06K bytes  6.25M bytes/sec
    total size is 528.37M  speedup is 1.00

    real    1m24.133s
    user    0m7.158s
    sys 0m2.729s
    $SHLVL:1 
    ~/GS/dev$ time rsync -rah --info=progress2 --stats ~/GS/dev/AlfaWiFiAdapterSoftware/.git ~/mnt/toshiba_root~/temp/test5
            528.37M 100%    5.88MB/s    0:01:25 (xfr#91, to-chk=0/161)  

    Number of files: 161 (reg: 91, dir: 70)
    Number of created files: 161 (reg: 91, dir: 70)
    Number of deleted files: 0
    Number of regular files transferred: 91
    Total file size: 528.37M bytes
    Total transferred file size: 528.37M bytes
    Literal data: 528.37M bytes
    Matched data: 0 bytes
    File list size: 0
    File list generation time: 0.001 seconds
    File list transfer time: 0.000 seconds
    Total bytes sent: 528.51M
    Total bytes received: 2.06K

    sent 528.51M bytes  received 2.06K bytes  6.11M bytes/sec
    total size is 528.37M  speedup is 1.00

    real    1m26.001s
    user    0m7.108s
    sys 0m2.564s

    ~/GS/dev$ time rsync -rah --info=progress2 --stats ~/GS/dev/AlfaWiFiAdapterSoftware/.git ~/mnt/toshiba_root~/temp/test6
            528.37M 100%    6.44MB/s    0:01:18 (xfr#91, to-chk=0/161)  

    Number of files: 161 (reg: 91, dir: 70)
    Number of created files: 161 (reg: 91, dir: 70)
    Number of deleted files: 0
    Number of regular files transferred: 91
    Total file size: 528.37M bytes
    Total transferred file size: 528.37M bytes
    Literal data: 528.37M bytes
    Matched data: 0 bytes
    File list size: 0
    File list generation time: 0.001 seconds
    File list transfer time: 0.000 seconds
    Total bytes sent: 528.51M
    Total bytes received: 2.06K

    sent 528.51M bytes  received 2.06K bytes  6.73M bytes/sec
    total size is 528.37M  speedup is 1.00

    real    1m18.523s
    user    0m6.998s
    sys 0m2.266s


version 2.10.0 again (just as fast):

    ~/GS/dev$ time rsync -rah --info=progress2 --stats ~/GS/dev/AlfaWiFiAdapterSoftware/.git ~/mnt/toshiba_root~/temp/test10
            528.37M 100%    6.08MB/s    0:01:22 (xfr#91, to-chk=0/161)  

    Number of files: 161 (reg: 91, dir: 70)
    Number of created files: 161 (reg: 91, dir: 70)
    Number of deleted files: 0
    Number of regular files transferred: 91
    Total file size: 528.37M bytes
    Total transferred file size: 528.37M bytes
    Literal data: 528.37M bytes
    Matched data: 0 bytes
    File list size: 0
    File list generation time: 0.001 seconds
    File list transfer time: 0.000 seconds
    Total bytes sent: 528.51M
    Total bytes received: 2.06K

    sent 528.51M bytes  received 2.06K bytes  6.33M bytes/sec
    total size is 528.37M  speedup is 1.00

    real    1m23.526s
    user    0m8.096s
    sys 0m4.920s
    $SHLVL:1 
    ~/GS/dev$ time rsync -rah --info=progress2 --stats ~/GS/dev/AlfaWiFiAdapterSoftware/.git ~/mnt/toshiba_root~/temp/test11
            528.37M 100%    5.99MB/s    0:01:24 (xfr#91, to-chk=0/161)  

    Number of files: 161 (reg: 91, dir: 70)
    Number of created files: 161 (reg: 91, dir: 70)
    Number of deleted files: 0
    Number of regular files transferred: 91
    Total file size: 528.37M bytes
    Total transferred file size: 528.37M bytes
    Literal data: 528.37M bytes
    Matched data: 0 bytes
    File list size: 0
    File list generation time: 0.001 seconds
    File list transfer time: 0.000 seconds
    Total bytes sent: 528.51M
    Total bytes received: 2.06K

    sent 528.51M bytes  received 2.06K bytes  6.18M bytes/sec
    total size is 528.37M  speedup is 1.00

    real    1m24.791s
    user    0m8.323s
    sys 0m4.680s

    ~/GS/dev$ time rsync -rah --info=progress2 --stats ~/GS/dev/AlfaWiFiAdapterSoftware/.git ~/mnt/toshiba_root~/temp/test12
            528.37M 100%    6.30MB/s    0:01:19 (xfr#91, to-chk=0/161)  

    Number of files: 161 (reg: 91, dir: 70)
    Number of created files: 161 (reg: 91, dir: 70)
    Number of deleted files: 0
    Number of regular files transferred: 91
    Total file size: 528.37M bytes
    Total transferred file size: 528.37M bytes
    Literal data: 528.37M bytes
    Matched data: 0 bytes
    File list size: 0
    File list generation time: 0.001 seconds
    File list transfer time: 0.000 seconds
    Total bytes sent: 528.51M
    Total bytes received: 2.06K

    sent 528.51M bytes  received 2.06K bytes  6.57M bytes/sec
    total size is 528.37M  speedup is 1.00

    real    1m20.192s
    user    0m8.046s
    sys 0m4.783s

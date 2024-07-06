---
published: false  # use "false" while drafting articles just before publishing
title: "Installing Minecraft Mods in Java Edition"
tags: 
    - tutorial
    - computers
    - linux
    - ubuntu
    - gaming
# date: 1999-12-31
# last_modified_at: 2024-01-05  # updates the "Updated" date at the bottom!
# permalink: /test/
# redirect_from: 
# categories: 
toc: true  # (default for Table of Contents is true)
---


_Tested in Linux Ubuntu 22.04._


## Option 1: The manual method

1. Find a mod you want, such as "Dragon Survival [Forge]" on CurseForce.com, here: <https://www.curseforge.com/minecraft/mc-mods/dragons-survival>

1. Click the "Download" button, as shown below:

    <p align="left" width="100%">
        <a href="https://github.com/ElectricRCAircraftGuy/ElectricRCAircraftGuy.github.io/assets/6842199/ecb8e835-f4d9-4fc0-abc5-73d0bffdfc34">
            <img width="100%" src="https://github.com/ElectricRCAircraftGuy/ElectricRCAircraftGuy.github.io/assets/6842199/ecb8e835-f4d9-4fc0-abc5-73d0bffdfc34"> 
        </a>
    </p>

1. Click the "All Game Versions" dropdown menu and select the version of Minecraft you want to install the mod into. If not sure, just choose the latest version available, which is `1.20.1` for this mod at the time of this writing.
1. Click the "All Mod Loaders" dropdown menu and select "Forge". Then, click "Download File", as shown below:

    <p align="left" width="100%">
        <a href="https://github.com/ElectricRCAircraftGuy/ElectricRCAircraftGuy.github.io/assets/6842199/fbc553fc-98ea-4419-be66-35e5d8faa69c">
            <img width="50%" src="https://github.com/ElectricRCAircraftGuy/ElectricRCAircraftGuy.github.io/assets/6842199/fbc553fc-98ea-4419-be66-35e5d8faa69c"> 
        </a>
    </p>

1. Save the `DragonSurvival-1.20.1-09.01.2024.jar` Java .jar mod file into the location of your choosing. I like to save mods into a directory at this path, where `~` means your home directory:

    ```bash
    ~/Downloads/Install_Files/Minecraft/mods/
    
    # (same thing)
    /home/gabriel/Downloads/Install_Files/Minecraft/mods/
    ```

1. _The next 3 steps show you how to **install and configure a new version of the Forge mod loader** into Minecraft. If you already have the required version of Forge you need for your new mod, skip ahead to step 10: installing the Java mod file you downloaded above._

1. Download the version of Minecraft Forge that corresponds to your mod version you downloaded above. In my case, I need Minecraft Forge **1.20.1**.

    Go here: <https://files.minecraftforge.net/net/minecraftforge/forge/> --> click `1.20.1` in the left-hand pane --> under "Download Latest", click "Installer", as shown below.

    <p align="left" width="100%">
        <a href="https://github.com/ElectricRCAircraftGuy/ElectricRCAircraftGuy.github.io/assets/6842199/b7ebe31f-9228-4f44-9959-8a9ae293ff11">
            <img width="75%" src="https://github.com/ElectricRCAircraftGuy/ElectricRCAircraftGuy.github.io/assets/6842199/b7ebe31f-9228-4f44-9959-8a9ae293ff11"> 
        </a>
    </p>

    _Note: I generally like to use the "Download Latest" version. If I have any problems with it, however, then I will try the "Download Recommended" version instead._
    
    On the next page, click "SKIP" to skip the advertisement page and begin the download:

    <p align="left" width="100%">
        <a href="https://github.com/ElectricRCAircraftGuy/ElectricRCAircraftGuy.github.io/assets/6842199/4cdbba5a-0490-4bd2-88eb-f90823b3b3f4">
            <img width="75%" src="https://github.com/ElectricRCAircraftGuy/ElectricRCAircraftGuy.github.io/assets/6842199/4cdbba5a-0490-4bd2-88eb-f90823b3b3f4"> 
        </a>
    </p>

    Save the `forge-1.20.1-47.2.30-installer.jar` into a directory of your choosing, such as:

    ```
    ~/Downloads/Install_Files/Minecraft/forge/
    ```

1. Install the `.jar` Java Forge file you downloaded above. 
    1. Open your file explorer. I prefer Nemo ([my installation instructions are here](https://askubuntu.com/a/1446372/327339)).
    1. Right-click in some empty space in the same directory as the file, and click "Open in Terminal":

        <p align="left" width="100%">
            <a href="https://github.com/ElectricRCAircraftGuy/ElectricRCAircraftGuy.github.io/assets/6842199/90055fc8-e682-4c88-bf84-d52b257d6159">
                <img width="75%" src="https://github.com/ElectricRCAircraftGuy/ElectricRCAircraftGuy.github.io/assets/6842199/90055fc8-e682-4c88-bf84-d52b257d6159"> 
            </a>
        </p>

    1. In the terminal that opens up, run the following commands:

        ```bash
        # Make the Java installation file executable
        chmod +x forge-1.20.1-47.2.30-installer.jar

        # Run the Java installation file
        ./forge-1.20.1-47.2.30-installer.jar
        ```

        _Expert tips and notes:_ 
        1. Lines that begin with `#` above are Bash terminal comments, and do not need to be run.
        1. Once you begin typing a command or path, you can hit <kbd>Tab</kbd> to auto-complete what you are typing. 
            Example: after typing `./for` you can press <kbd>Tab</kbd> to auto-complete `./forge-1.20.1-47.2.30-installer.jar`. 
        1. You can also just copy-paste the commands above. 
            1. To paste in a terminal, either right-click and go to `Paste`, or press <kbd>Ctrl</kbd> + <kbd>Shift</kbd> + <kbd>V</kbd>. 
        1. Instead of running the `./forge-1.20.1-47.2.30-installer.jar` command to run the Java JAR file, you can also just double-click it in your file explorer once you have marked it as "exectuable" (able to be run) with `chmod +x forge-1.20.1-47.2.30-installer.jar`. 

    1. Once you run the `forge-1.20.1-47.2.30-installer.jar` file you will see a GUI installer as shown below. 

        Click "Install client" --> "OK", and let it install this version of Forge: 

        <p align="left" width="100%">
            <a href="https://github.com/ElectricRCAircraftGuy/ElectricRCAircraftGuy.github.io/assets/6842199/353d9c5a-a25b-45f4-a5b7-d345d2fe87ec">
                <img width="50%" src="https://github.com/ElectricRCAircraftGuy/ElectricRCAircraftGuy.github.io/assets/6842199/353d9c5a-a25b-45f4-a5b7-d345d2fe87ec"> 
            </a>
        </p>

        When complete, you'll see something like this. Click "OK":

        <p align="left" width="100%">
            <a href="https://github.com/ElectricRCAircraftGuy/ElectricRCAircraftGuy.github.io/assets/6842199/d64172ac-6d62-4615-9b98-d7529863c284">
                <img width="100%" src="https://github.com/ElectricRCAircraftGuy/ElectricRCAircraftGuy.github.io/assets/6842199/d64172ac-6d62-4615-9b98-d7529863c284"> 
            </a>
        </p>

        This adds the following Forge folder to your computer:
        ```
        ~/.minecraft/versions/1.20.1-forge-47.2.30/
        ```

        We will need this folder in a future step.

1. Open the Minecraft Launcher and configure it to use the Forge version you just installed:
    1. Open the Minecraft Launcher --> click "Installations" in the top menu --> hover over the new "forge" "1.20.1-forge-47.2.30" entry --> click the 3 dots at the right --> "Edit", as shown below:

        <p align="left" width="100%">
            <a href="https://github.com/ElectricRCAircraftGuy/ElectricRCAircraftGuy.github.io/assets/6842199/5b294ffd-3c1f-4022-a13e-9302440be0f0">
                <img width="100%" src="https://github.com/ElectricRCAircraftGuy/ElectricRCAircraftGuy.github.io/assets/6842199/5b294ffd-3c1f-4022-a13e-9302440be0f0"> 
            </a>
        </p>

    1. (Optional, but recommended) Change the "Name" from "forge" to "forge 1.20.1". 
    1. In the "Game Directory" path, add this path by either manually typing it or by clicking the "Browse" button and browsing to it: 
        ```
        /home/gabriel/.minecraft/versions/1.20.1-forge-47.2.30
        ```
    1. You'll now see this:

        <p align="left" width="100%">
            <a href="https://github.com/ElectricRCAircraftGuy/ElectricRCAircraftGuy.github.io/assets/6842199/5fbc0ba0-d40e-4205-a05b-f316935f93c6">
                <img width="100%" src="https://github.com/ElectricRCAircraftGuy/ElectricRCAircraftGuy.github.io/assets/6842199/5fbc0ba0-d40e-4205-a05b-f316935f93c6"> 
            </a>
        </p>
    
    1. Click "Save" when done.

1. "Install" the Java mod file you downloaded above by copying it into the Forge mods folder (at `~/.minecraft/versions/1.20.1-forge-47.2.30/mods/` in my case).
    1. In my case, the Java .jar mod file is called `DragonSurvival-1.20.1-09.01.2024.jar`, and I previously saved it into directory `~/Downloads/Install_Files/Minecraft/mods`.

    1. "Install this mod" now by copying it into the Forge mods folder you just created in the previous step by installing that version of Forge. 

    1. **Technique 1: using the command-line:**

        In a terminal, run the following commands:

        ```bash
        # Make the mods directory if it doesn't already exist
        mkdir -p ~/.minecraft/versions/1.20.1-forge-47.2.30/mods/

        # Copy the mod file into that mods directory
        cp ~/Downloads/Install_Files/Minecraft/mods/DragonSurvival-1.20.1-09.01.2024.jar ~/.minecraft/versions/1.20.1-forge-47.2.30/mods/
        ```

    1. Or **Technique 2: using your GUI file manager:**
    
        1. In your file manager, ensure that you have hidden files turned on:

            In Nautilus, the default file manager with Ubuntu, click the 3-horizontal-bar icon in the top-right --> check the box for "Show Hidden Files". 

            In [Nemo, my preferred file manager](https://askubuntu.com/a/1446372/327339), click View --> Show Hidden Files. 
    
        1. Manually create this new folder if it doesn't already exist: `~/.minecraft/versions/1.20.1-forge-47.2.30/mods/`. 
        1. Now copy the `~/Downloads/Install_Files/Minecraft/mods/DragonSurvival-1.20.1-09.01.2024.jar` file into that directory. 

1. Back at the main Minecraft Launcher, click "Play" at the top --> select the "forge 1.20.1" version via the selection menu at the bottom left --> click "Play" at the bottom, as shown here:

    <p align="left" width="100%">
        <a href="https://github.com/ElectricRCAircraftGuy/ElectricRCAircraftGuy.github.io/assets/6842199/ae5ad54e-ffb2-4da3-af73-13d41b6d94a7">
            <img width="100%" src="https://github.com/ElectricRCAircraftGuy/ElectricRCAircraftGuy.github.io/assets/6842199/ae5ad54e-ffb2-4da3-af73-13d41b6d94a7"> 
        </a>
    </p>

1. You'll now see a warning pop up. Check the "I understand the risks" box and click "Play":

    <p align="left" width="75%">
        <a href="https://github.com/ElectricRCAircraftGuy/ElectricRCAircraftGuy.github.io/assets/6842199/142c8d2d-a511-47d3-8434-d0de882f6783">
            <img width="100%" src="https://github.com/ElectricRCAircraftGuy/ElectricRCAircraftGuy.github.io/assets/6842199/142c8d2d-a511-47d3-8434-d0de882f6783"> 
        </a>
    </p>

    As the game loads, you'll see this: 

    <p align="left" width="75%">
        <a href="https://github.com/ElectricRCAircraftGuy/ElectricRCAircraftGuy.github.io/assets/6842199/4f3a2b13-68cd-4639-b7b3-8582ffeddcac">
            <img width="100%" src="https://github.com/ElectricRCAircraftGuy/ElectricRCAircraftGuy.github.io/assets/6842199/4f3a2b13-68cd-4639-b7b3-8582ffeddcac"> 
        </a>
    </p>

1. If it fails to load, and you get this error: 

    <p align="left" width="75%">
        <a href="https://github.com/ElectricRCAircraftGuy/ElectricRCAircraftGuy.github.io/assets/6842199/7cc8d0e5-669b-4770-930f-8c3dea6736e3">
            <img width="100%" src="https://github.com/ElectricRCAircraftGuy/ElectricRCAircraftGuy.github.io/assets/6842199/7cc8d0e5-669b-4770-930f-8c3dea6736e3"> 
        </a>
    </p>

    > ERROR
    > 
    > ### Game Crashed
    > 
    > The game crashed whilst initializing game  
    > Error: org.spongepowered.asm.mixin.transformer.throwables.MixinTransformerError: An unexpected critical error was encountered
    > 
    > Exit Code: 255

    ...then the problem is a bad mod. Remove the mod you just added and try again and it will launch. 

    To remove the mod, do one of these three options:
    
    1. Option 1 [my preference]: run this command in your terminal to move the bad mod file from the `mods` directory to a `mods/disabled` directory:
        ```bash
        cd ~/.minecraft/versions/1.20.1-forge-47.2.30/mods
        mkdir -p disabled
        mv DragonSurvival-1.20.1-09.01.2024.jar disabled/ 
        ```
    1. Option 2: simply delete the mod file from the mods directory you copied it into earlier. Manually use your file manager to delete the file at `~/.minecraft/versions/1.20.1-forge-47.2.30/mods/DragonSurvival-1.20.1-09.01.2024.jar`.
    1. Option 3: delete the mod file by running this command in your terminal:
        ```bash
        rm ~/.minecraft/versions/1.20.1-forge-47.2.30/mods/DragonSurvival-1.20.1-09.01.2024.jar
        ```

    Then, try launching the game again. It will load just fine now. But, the mod we wanted will be missing, which defeats the whole purpose of this exercise, so let's try again:

    Repeat steps 1-4 above, but this time on the Downloads page...////////////// download an older version of the mod. In our case: 1.19.2, as shown here: ...... 

    //////////

    Try again....

1. Once the game loads.....you will see the mod active here: 

    ////////////

    Start at new game and you will see the mod working.


## Option 2 (recommended, and much easier): using the CurseForce app

TODO

See CurseForge app: <https://www.curseforge.com/minecraft/mc-mods/dragons-survival/download/5371508>

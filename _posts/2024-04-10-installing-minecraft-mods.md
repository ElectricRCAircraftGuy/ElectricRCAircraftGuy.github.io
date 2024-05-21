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

1. Find a mod you want, such as "Dragon Survival [Forge]" on CurseForce.com, here: https://www.curseforge.com/minecraft/mc-mods/dragons-survival

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

    ```
    ~/Downloads/Install_Files/Minecraft/mods/
    ```

1. Download the version of Minecraft Forge that corresponds to your mod version you downloaded above. In my case, I need Minecraft Forge **1.20.1**. 

    Go here: https://files.minecraftforge.net/net/minecraftforge/forge/ --> click `1.20.1` in the left-hand pane --> under "Download Latest", click "Installer", as shown below.

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

1. Install the Java mod file you downloaded above

    ...









## Option 2 (recommended, and much easier): using the CurseForce app

TODO

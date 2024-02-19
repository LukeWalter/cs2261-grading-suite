# cs2261-grading-suite
A few bash scripts to automate the process of preparing CS 2261 assignments for grading

## Setup Instructions

### 1. Setup a WSL terminal
This library uses bash scripts to manipulation files, so having a terminal that allows you to
use UNIX commands will make things a lot simpler. If you're on Windows, make sure you have WSL 2 enabled
and have Ubuntu installed.

### 2. Download or clone the repo
cd into the directory you wish to place the cs2261-grading-suite in and...
`git clone https://github.com/LukeWalter/cs2261-grading-suite.git`

### 3. Get your tasks.json 
I am assuming you have a .vscode folder that contains the tasks.json that works for your computer... Anyway.
Find your tasks.json in your .vscode folder and replace the tasks.json file in the Scripts folder with your own.

### 4. Open up the Scripts folder in VS Code
Open the terminal and it's probably defaulting to the powershell so we need to change that.
Navigate to the drop-down icon that is next to the plus sign on the right hand side of the terminal.
When you click the drop-down icon, there should be a "Ubuntu (WSL)" option. Click on that to open up a WSL terminal.

In your terminal line, there should be a folder path to the directory that you are currently working on -- it should be
the same as the root directory in your project window (basically just the folder you opened). 

If you are not currently in the Scripts folder, use this command to navigate there:
```
cd Scripts
```

If this command does not work, it's most likely because the Scripts folder isn't directly accessible in the directory you're
currently in. You can use this command to check which folders it's possible for you to change to:
```
ls
```

If you don't want to deal with all that, just make sure you're opening the Scripts folder directly in VSCode.

### 4. Test setup.sh

In this repository, there is a folder called Example_Submissions. It contains a ZIP file that mimics the format of a
student submission. In order to unzip it and inject your tasks.json, you'll need to run this command in the terminal:
```
./setup.sh
```

On your first time running this script, you're likely to run into a few issues. Here's the ones we've identified so far
and how to fix them:

#### Permissions Denied

Sometimes, your computer won't give you full read, write, and/or execute access of a file you've just downloaded (especially
with bash scripts!). To make sure all of the scripts have these permissions, run the following command:
```
chmod 777 taskreplacer.sh bulkunzipper.sh setup.sh
```

#### Unzip Script Not Found

bulkunzipper.sh uses a UNIX command that isn't part of the base UNIX language. If your computer doesn't already have it, you'll
need to install that package using the following command:
```
sudo apt-get install zip unzip
```

#### Bad Interpreter

To be completely real, I have no idea why this happens. Truly a mind-boggling occurrence, this one. However, I looked it up on
Stack Overflow and they had an equally perplexing UNIX command that seems to fix the issue:
```
sed -i -e 's/\r$//' taskreplacer.sh bulkunzipper.sh setup.sh
```

#### Any extra UNIX issues that we can find with setup should be posted here to help people in the future!

Keep running the `./setup.sh` command until each of these issues gets solved. Once they have, a new folder will be created in 
Example_Submissions. This folder should contain an unzipped version of the contents of Example_StudentAwesome.zip, except its
tasks.json file will have been replaced with your own! Open this folder in VSCode and attempt to run it as normal. If you've
succeeded in doing that, the setup is complete!

## Regular Usage

Once you've gotten everything set up, the program is fairly straightforward to use! 

### 1. Make a folder for your ZIP submissions

In order to use the grading suite, you'll need a base folder for the scripts to look for submissions in. This diagram shows
where this base folder should be placed for the easiest results:

```
├── cs-2261-grading-suite
│   ├── Example_Submissions
│   │   ├── Example_StudentAwesome.zip
│   ├── [Add folders w/ Canvas ZIPs here]
|   ├── Scripts
│   │   ├── bulkunzipper.sh
│   │   ├── setup.sh
│   │   ├── taskreplacer.sh
|   |   ├── tasks.json
│   ├── README.md (You are here!)
```

You can put them in a different spot if you want, but it would make the next step harder as it would likely require you to
get that folder's absolute filepath.

### 2. Download ZIP submissions from Canvas into your base folder

What you do in this step depends on how you're getting your submissions from Canvas:

- Individually through SpeedGrader: Just go ahead and save them into that base folder!
- All at once: Canvas gives you a ZIP file containing all the submitted ZIPs, so in this case, just download that ZIP
into the cs-2261-grading-suite folder and extract it there.

### 3. Edit your setup.sh

Open up your setup.sh file and focus on these 2 lines.

```
# Relative path to base folder
basefolder="../Example_Submissions/"
```

Go ahead and change the name of "Example_Submissions" (or whatever's there at the time you're doing this) to the name
of the base folder you're using.

> Note: Your basefolder file path is likely changing for every assignment since you are grading in different folders!

### 4. Grading time!

In your WSL terminal, make sure that you're working in the Scripts folder. Then use this command:

```
./setup.sh
```

The script should automatically unzip all of the zip files AND replace their tasks.json with your own tasks.json.
Now you're ready to grade!

![Yippee!](https://media1.tenor.com/m/g16jQZqbvWoAAAAC/yippee-happy.gif)

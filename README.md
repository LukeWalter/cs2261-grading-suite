# cs2261-grading-suite
A couple of bash scripts that make it easier to download and grade assignments for CS 2261

## Note before setup
I recommend that you have a folder for grading where you can store this cs2261-grading-suite folder.
I would also reccomend for whatever item you are grading whether that be a lab or homework. Create a folder for it to store the student's submissions for that assignment in one place. Therefore, an ideal folder structure would look something like this:
```
├── Grading
│   ├── cs2261-grading-suite
│   │   ├── bulkunzipper.sh
│   │   ├── README.md
│   │   ├── setup.sh
│   │   ├── taskreplacer.sh
|   |   ├── tasks.json
│   ├── Lab03_Submissions
│   ├── HW01_Submissions
│   ├── Lab05_Submissions
```
Or don't do that! You have free will.

## Setup Instructions

### 1. Setup a WSL terminal
This library uses bash scripts to manipulation files, so having a terminal that allows you to
use UNIX commands will make things a lot simpler. If you're on Windows, make sure you have WSL 2 enabled
and have Ubuntu installed.

### 1. Download or clone the repo
cd into the directory you wish to place the cs2261-grading-suite in and...
`git clone https://github.com/LukeWalter/cs2261-grading-suite.git`

### 2. Get your tasks.json 
I am assuming you have a .vscode folder that contains the tasks.json that works for your computer... Anyway.
Find your tasks.json in your .vscode folder and copy & paste tasks.json into your cs2261-grading-suite folder.

### 3. Open up the cs2261-grading-suite-folder in VS Code
Open the terminal and it's probably defaulting to the powershell so we need to change that.
Navigate to the drop-down icon that is next to the plus sign on the right hand side of the terminal.
When you click the drop-down icon, there should be a "Ubuntu (WSL)" option. Click on that to open up a WSL terminal.

In your terminal line, there should be a folder path to the directory that you are currently working on (cs2261-grading-suite).
If not, use this command to navigate to that folder. 

```
cd folderName
```

If you can't see the full filepath to the folder you're in in your terminal, use this command to view it:

```
pwd
```

Also, make sure your filepath doesn't have any spaces in it! There's probably a way around this, but as of now we haven't found it.

### 4. Edit your setup.sh
Open up your setup.sh file and focus on these 2 lines.

```
# Absolute path to base folder
basefolder="/mnt/c/Users/lwalt/Desktop/External/CS2261/Grading/Lab_04_Submissions/"

# Absolute path to tasks.json
mytasks="/mnt/c/Users/lwalt/Desktop/External/CS2261/Grading/tasks.json"
```

Remember that folder path we just found? Ctrl+C it.
> Replace "/mnt/c/Users/lwalt/Desktop/External/CS2261/Grading/Lab_04_Submissions/" and "/mnt/c/Users/lwalt/Desktop/External/CS2261/Grading/tasks.json" with filepaths that lead to your basefolder and tasks respectively.

Edit the mytasks file path to lead to your tasks.json file that is inside your cs2261-grading-suite from earlier.

Edit your basefolder file path to lead to where you want the code to work. Aka all of the students' zip files that is hopefully in a neat folder that you can edit your basefolder path to
> Note: Your basefolder file path is likely changing for every assignment since you are grading in different folders!

### 5. Grading time
Alright so you have the downloaded students' zip files in some folder called idk Lab03. Your basefolder should look something like "/mnt.../Lab03". 
Open up your WSL terminal and cd into the cs2261-grading-suite if you haven't already.
In your WSL terminal, type:

```
./setup.sh
```

The script should automatically unzip all of the zip files AND replace their tasks.json with your own tasks.json.
You should be done yay!

### 6. UNIX Troubleshooting
Here's a list of possible issues you may have when trying to run the scripts for the first time:

- Insufficient permissions
  > Use the `chmod 777 scriptName.sh` command on each of the bash scripts to update their permissions to a state where you can read, write, and execute them.
  
- Bulkunzipper.sh script not found
  > This occurs because this script uses commands that aren't included in base UNIX. Use the `sudo apt-get install zip unzip` command to install them on your computer.

- Bad interpreter: No such file or directory
  > Not entirely sure what causes this, but I do know the fix! Use the `sed -i -e 's/\r$//' scriptName.sh` command on each of the bash scripts to fix this issue.
  

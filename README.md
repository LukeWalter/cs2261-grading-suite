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
│   ├── Lab03_Submissions
│   ├── HW01_Submissions
│   ├── Lab05_Submissions
```
Or don't do that! You have free will.

## Setup Instructions

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
If not, cd into that folder.

### 4. Edit your setup.sh
Open up your setup.sh file and focus on these 2 lines.

```
# Absolute path to base folder
basefolder="/mnt/c/Users/lwalt/Desktop/External/CS2261/Grading/Lab_04_Submissions/"

# Absolute path to tasks.json
mytasks="/mnt/c/Users/lwalt/Desktop/External/CS2261/Grading/tasks.json"
```
Remember that folder path earlier in the terminal that starts with /mnt/blah blah blah? Ctrl+C that folder path.
> Replace "/mnt/c/Users/lwalt/Desktop/External/CS2261/Grading/Lab_04_Submissions/" and "/mnt/c/Users/lwalt/Desktop/External/CS2261/Grading/tasks.json" with "/mnt/blah blah blah". It should end with /cs2261-grading-suite.

Edit the mytaks file path to lead to your tasks.json file that is inside your cs2261-grading-suite from earlier.
Your mytasks path should probably look like "/mnt/..../cs2261-grading-suite/tasks.json

Edit your basefolder file path to lead to where you want the code to work. Aka all of the students' zip files that is hopefully in a neat folder that you can edit your basefolder path to
> Note: Your basefolder file path is likely changing for every assignment since you are grading in different folders!

### 5. Grading time
Alright so you have the downloaded students' zip files in some folder called idk Lab03. Your basefolder should look something like "/mnt.../Lab03". 
Open up your WSL terminal and cd into the cs2261-grading-suite if you haven't already.
In your WSL terminal, type:
`./setup.sh`
The script should automatically unzip all of the zip files AND replace their tasks.json with your own tasks.json.
You should be done yay!

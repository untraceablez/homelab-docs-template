# Homelab Docs User Guide

## Table of Contents

* [How to Contribute](#how-to-contribute)
    * [Requirements](#requirements)
        * [Universal Requirements](#universal-requirements)
            * [Python](#python)
            * [Git](#git)
            * [IDE](#ide)
        * [macOS](#macos-requirements)
        * [Windows](#windows-requirements)
        * [Linux](#linux-requirements)
* [First Time Setup](#first-time-setup)
    * [Cloning with Git](#cloning-with-git)
        * [HTTPS](#HTTPS)
        * [SSH](#SSH)
    * [Installing mkdocs](#installing-mkdocs)
* [Working on Documentation](#working-on-documentation)
    * [Activating your Python virtual environment](#activating-your-python-virtual-environment)
    * [Previewing your mkdocs instance](#previewing-your-mkdocs-instance)
* [Tips & Tricks with Markdown](#tips-and-tricks-with-markdown)



## How to Contribute

### Requirements

#### Universal Requirements

##### Python

The only requirement to build documentation locally is having a Python 3 environment, with at least Python **3.6** installed. You can verify what version of Python is installed with this command:

```
$ python --version
Python 3.8.3
```  

If you don't have Python installed, follow the commands below for your OS:  

**macOS**  
```bash  
brew install python3  
```  

If you don't have brew, you can install it following the instructions [here](https://brew.sh/).

**Linux  (assuming Debian-based)**  
You likely already have Python3 installed by default, but if not, run this:
```bash  
sudo apt-get install python3 pip -y  
```  

**CentOS/RHEL**  
You likely already have Python3 installed by default, but if not, run this:
```bash  
sudo dnf install git -y  
```

**Windows**  

Navigate to the [Python Download Page](https://www.python.org/downloads/) and select the **latest *stable* release**. Alternatively, if you have [winget](https://learn.microsoft.com/en-us/windows/package-manager/winget/) you can run the following command in PowerShell (make sure to run as administrator)

```powershell  
winget install -e --id Python.Python.3.10
```
##### Git

To install Git, follow the instructions below for your OS:  

**macOS**  
```bash  
brew install git  
```  

If you don't have brew, you can install it following the instructions [here](https://brew.sh/).

**Linux  (assuming Debian-based)**  
```bash  
sudo apt-get install git -y  
```  

**CentOS/RHEL**  
```bash  
sudo dnf install git -y  
```

**Windows**  

Navigate to the [Git Download Page](https://git-scm.com/download/win) and select the **64-bit Git for Windows Setup** installer. Alternatively, if you have [winget](https://learn.microsoft.com/en-us/windows/package-manager/winget/) you can run the following command in PowerShell (make sure to run as administrator)

```powershell  
winget install --id Git.Git -e --source winget
```

##### IDE

Use of an IDE to preview your Markdown side-by-side with your documentation is best, allows you to confirm proper formatting in real time. IDEs are a personal preference, and as long as the IDE supports Markdown and YAML syntax, you'll be fine, but [Visual Studio Code](https://code.visualstudio.com/) is a solid all-rounder to use. Others are below. To note, XCode is free for *this* kind of coding, a paid Apple Developer account is only required for iOS/iPadOS related programming. 

* *$$$$* [Sublime Text](https://www.sublimetext.com/)
* Free [Xcode](https://developer.apple.com/xcode/)
* Free [Netbeans](https://netbeans.apache.org/front/main/)
* Free [Brackets](https://brackets.io/)
* *$$$$* [Nova (**macOS only**)](https://nova.app/)
* Free [Notepad++ (**Windows only**)](https://notepad-plus-plus.org/)
* Free [Eclipse IDE](https://www.eclipse.org/ide/)

#### macOS Requirements

##### Brew

Brew is a very useful package manager for macOS that is necessary to install the [Universal Requirements](#universal-requirements). To install Brew, simply paste the following command into Terminal: 

```bash
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

#### Windows Requirements

##### Chocolatey

For Windows you'll need to install [Chocolatey Package Manager](https://chocolatey.org/) in order to get the other dependencies in this section, and it can be used as an alternative way to install the [Universal Requirements](#universal-requirements). Chocolatey is a very useful package manager for Windows in general as well. To install Chocolatey, simply follow their instructions, which can be found [here](https://chocolatey.org/install).  

##### Make

Simply run this command:

```powershell
choco install make
```

#### Linux Requirements

At this time, there are no requirements specific to Linux. All hail to the 🐧!

### First Time Setup

First, navigate to your project directory, such as: 

`~/projects/`

If you don't have a projects directory, it's suggested to create one under your home folder, which you can do via the following commands:   

**macOS and Linux**  
```bash
mkdir ~/projects  
```

**Windows**  
```powershell
cd C:\\Users\$USER  
mkdir projects
```

Next, you'll download my repository via Git: 

Before you clone with Git, I you will need to fork the repo and be working off of your forked repository. I don't allow merge requests changes to this repo, it serves only as a template. I recommend reading through GitHub's Docs on [Forking a Repo](https://docs.github.com/en/get-started/quickstart/fork-a-repo)

#### Cloning with Git 

This is the recommended method and uses HTTPS to grab the repo.

##### HTTPS
```bash  
git clone https://github.com/untraceablez/homelab-docs-template.git
```

##### SSH

Using Git's SSH protocol. Make sure you add your SSH public key to your GitHub account:
```bash
git clone git@github.com:untraceablez/homelab-docs-template.git
```

##### GitHub CLI

If you have GitHub CLI, it's even easier!  
```github
gh repo clone untraceablez/homelab-docs-template
```

#### Installing mkdocs

To install `mkdocs` in the current environment, just run this command:  

```bash
make first-install  
```

This command will do the following: 

* It will create Python virtual environment called `homelab-docs` (*Don't worry, this is **seprate** from your git branch name*)  
* It will activate this virtual environment by running this command:
    * `. ~/.python/homelab-docs/bin/activate`
* It will install (via `pip`) all the required python extensions listed in `requirements.txt` *within the virtual environment*.



### Working on documentation

#### Activating your Python virtual environment

To activate the virtual environment created by the `Makefile` simply run this:

```bash  
. ~/.python/homelab-docs/bin/activate
``` 

#### Previewing your mkdocs instance

After making **any** changes to your local branch, run `mkdocs build` it will verify that your syntax is valid. 

Once mkdocs build works, you can run `mkdocs serve` in order to get a live preview of your site. If you're only editing *existing* text, you can leave this running while you make changes. The process **will break** if you change the ```mkdocs.yml``` file or **add** or **delete** files under `/docs`.  In order to view the site in a browser (Chromium-based preferably), navigate to your [localhost](http://127.0.0.1:8000). It should always be presented by `mkdocs serve` as http://127.0.0.1:8000. 

*or*, if you're feeling lazy, you can just run **`make`** which will always run both of these commands for you:  

```bash
mkdocs build
mkdocs serve
```


### Tips & Tricks with Markdown

Markdown is a markup language designed to make formatting your text something you do *as you write* instead of having to interact with your editor's UI to make changes such as **bold**, *italics*, `code strings`, etc. Two of the best resources for Markdown syntax are below: 

* [Markdown Syntax Cheat Sheet](https://www.markdownguide.org/cheat-sheet/)
* [Markdown Extended Syntax](https://www.markdownguide.org/extended-syntax/)

As you go through mkdocs, you'll find mkdocs has a lot of built-in extensions that add on to Markdown syntax, you can find more information about these here: 

* [Material for mkdocs Reference](https://squidfunk.github.io/mkdocs-material/reference/)  

**Other Useful Pages**  
As they're found, useful pages will be added here for our collective reference:

* A list of all supported code highlight options (lexers):  
    * https://pygments.org/docs/lexers/#  

* A markdown table generator (generates an empty table):  
    * https://www.tablesgenerator.com/markdown_tables


# SHPE|UIUC Website Introduction
#### Current Project Manager: Raymond Farias (rayfarias56@gmail.com)

[![Join the chat at https://gitter.im/rayfarias56/shpe](https://badges.gitter.im/Join%20Chat.svg)](https://gitter.im/rayfarias56/shpe?utm_source=badge&utm_medium=badge&utm_campaign=pr-badge&utm_content=badge)

This is the source for the rails based shpe website. There are two focuses of this project. 
  1. To improve the technical skills of those who join SHPE's website development committee. To this end we will follow industry standards in the interest of learning and becoming better professional candidates. This includes scrum/sprint, branching, code reviews, and continous integration.
  2. Provide a useful and attractive website for SHPE|UIUC. 
  
___
### Table of Contents  
1. [New Devs Start Here](#new_devs)
  1. [Setting up a Linux VM](#linux_vm)
  2. [An Introduction to using the Terminal](#terminal_intro)
  3. [Setting up GIT](#git_setup)
  4. [SSH and GIT](#ssh_git)
  5. [An Intro to Rails](#rails_intro)
  6. [Zenhub](#zenhub)
2. [Setting up this Repository](#repo_setup)
3. [Attention Devs](#dev_note)

___

# New Devs Start Here <a name="new_devs"/> 

Although you're free to use whatever tools and dev enviornments you'd like, the SHPE web dev committee will only support a small number of dev enviornments in order to simplifiy the process. 

## Setting up a Linux VM <a name="linux_vm"/> 

Linux and MacOS will be supported by the web dev committee. Windows has its fair share of problems with Rails that of course can be solved, but to avoid the hassle those with windows machines should set up a virtual machine (for more on windows/rails: https://www.quora.com/Is-it-a-bad-idea-to-use-Ruby-on-Rails). First you should choose and download the ISO (a virtual cd image) of the OS you'd like. Its suggested you download either Ubuntu OS (http://www.ubuntu.com/) or Linux Mint (http://www.linuxmint.com/). You can find a guide on how to setup a virtual machine with that operating system here: http://www.psychocats.net/ubuntu/virtualbox.

## An Introduction to using the Terminal <a name="terminal_intro"/> 

You may not have ever used a commandline before. If so you can go through a brief introduction here: http://learnpythonthehardway.org/book/appendixa.html. Which will get you used to using a terminal to navigate your computer. 

Additionally you'll need to understand two more commands. "$ sudo" will ask for your password (for the machine) and give you "root" access. Root is advanced admin privlieges. You'll need this to use "$ apt-get" which is a package manager that allows you to install additionall software packages. You'll use these as so: "$ sudo apt-get install [package-name]". 

## Setting up GIT <a name="git_setup"/> 

We realize that some of you may be completely new to git and that it may seem daunting at first. To get you started you should read and follow along with chatper one from this book: https://git-scm.com/book/en/v2. Most important is to do sections 1.5 and 1.6 which will install and setup GIT for you. 

## SSH and GIT <a name="ssh_git"/> 

In order to authenticate to GitHub and make a copy of a repository you'll need to use "$ git clone [url]" which can be done either through https or ssh. If you clone through https you can cache your password (see here: https://help.github.com/articles/caching-your-github-password-in-git/). If you connect through ssh you'll need to generate SSH keys: https://help.github.com/articles/generating-ssh-keys/. 

## An Intro to Rails <a name="rails_intro"/> 

For a wonderful introduction to Rails you should look at Hartl's book: https://www.railstutorial.org/book/. As is stated in the book it's advised you use the provided cloud platform to work through the book. Furthermore, it is suggested that you work through Chapter 6 and then pick up a small content/style related bug that the current PM can pick out for you. Then, before working on any database/sign-in related issues you should work through Chapter 6-12.

## ZenHub <a name="zenhub"/> 

The web dev committee uses ZenHub as a project management tool. This tool allows us to assign work more similiarly to a Sprint format. You'll simply need to install a Chrome extension (and use chrome) from this website https://www.zenhub.io/. Then visit this repository again. From there you'll see new pages such as Boards and Burndown on the right hand side. 

# Setting up this Repository <a name="repo_setup"/> 

Open a terminal and navigate to where you would like to store your copy of the project. Then clone the project using either: 

For SSH:
$ git clone git@github.com:rayfarias56/shpe.git

For HTTPS:
$ git clone https://github.com/rayfarias56/shpe.git

Then to move into the SHPE folder, allow execute permissions on the setup script and then run the project's setup script execute the following three commands. 

$ cd shpe

$ chmod 777 setup/setup_shpe_dev.sh

$ setup/setup_shpe_dev.sh

The setup script sets up necessary dependencies, node.js, Rails, RVM, Ruby, creates and seeds a development datebase and then starts a test server with "$ rails s". 

Test by going to 0.0.0.0:3000 (localhost, i.e. your computer, port 3000) in your browser. You should see the shpe website load!

ctrl-c to close the dev server

Now lets create a local branch to work on.  

$ git branch --track develop origin/develop

$ git checkout develop

And then we will change your settings so that you only push your develop branch to the repository when you're finished adding changes. 

$ git config --global push.default upstream

Contact Sean Freiburg(seanfreiburg@gmail.com) or Ray Farias (rayfarias56@gmail.com) for support.


# Attention Devs <a name="dev_note"/> 

Please commit to develop. Merging of branches and releases will be controlled by the lead developer on the project.

##### PLEASE PLEASE PLEASE If you see an issue, file it under issues. Keeping track of fixes will keep us much more organized.

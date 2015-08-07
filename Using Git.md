## What is Git?
Git is a version control system, so the whole idea is that instead of editing files directly and uploading them right on the server, you instead tell GIT to look at your changes and compare them with a repository. Your server will pull all the changes from that repository to stay up-to-date. 

To modify a project you will need access to the repository (GitHub or BitBucket for example)

## Install SourceTree

https://www.sourcetreeapp.com

Run through the installer. Once it's done installing you can run the program. You'll need to click the checkbox for the license agreement and click continue. The cool thing about this program is it automatically installs Git and any other dependencies you would have needed to install manually. If it says something about a global ignore file you can just click No.

It will then ask you your bitbucket username and password, so you can fill that in with what you setup from the invite email.

Once you're logged in, it should ask you to "Clone your first repo". Cloning is basically just pulling all the files from the online repository of files, so select the project you want to work on. It will also tell you where it's going to download the files if you want to change the folder it will go in. (Click No if it asks about an SSH key)

Before anything else, there's actually one thing that it doesn't look like SourceTree does, click the "Terminal" button at the top and just type in this to identify yourself to Git, otherwise you'll see some errors later on:

```
git config --global user.email "youremail@email.com"
```
(press enter)
```
git config --global user.name "Your Name"
```
(press enter)

Once that's done, close the little terminal window. You'll see an open to in explorer window where you can view all the files and edit them or change whatever you need. Before you ever start to make changes though, you always want to refresh your version to make sure nobody else made any changes to the repository. So whenever you're going to work on the site you can download any new changes just by clicking the "Pull" button at the top and then just click the Ok box.

After you've made some changes to the files, go back to sourcetree, you should see that Sourcetree will show all of the new changes you just made. You will see an area called "Unstaged files". What you want to do is tell Git that these files you changed are ready to be commited, so just check the checkbox next to "Unstaged files" and this will move all the files you worked on from Unstaged to Staged. The next step is to "Commit" your changes.

To commit your changes just click the "Commit" button at the top,  a little textbox will appear. Just describe what changes you made, ie: "Cleaned up text" and click the commit button.

The last step is to push all of your commits to the server. So finally, click the little "Push" button at the top and click Ok. And you are done.

### So here are the main steps to editing

- Pull -> download any new changes from the server
- [Edit your files like you normally would]
- Stage -> files you've changed
- Commit -> Pack all your staged files with a message about what you did
- Push -> Upload your changes to the server

So what all of this does is updates the files in the repository, but it doesn't actually update the web server which is an additional step:

## Deploy your code

On a shared server, without using a paid service like beanstalkapp.com, you can use a program like DPloy to take all your changes and update the live server, but it takes a few steps to get running:

### Install NodeJS
- Download from https://nodejs.org and run the installer

### Install DPloy
Open up a new terminal window and run:

```
npm install dploy -g
```

### Run DPloy on your project

Once DPloy has installed, you will need to create a file to give it instructions on deploying your app.

Create a new file in your project folder called "dploy.yaml" and add the following code to that file:

```
live:
    scheme: ftp
    host: 111.111.111.111
    port: 21
    user: FTPUSERNAME
    pass: FTPPASSWORD
    check: true
    path:
        local:
        remote: webspace/httpdocs/website.com
```

Replace:
- 111.111.111.111 with your host's IP address
- FTPUSERNAME with your username
- FTPPASSWORD with your password
- webspace/httpdocs/website.com with the path to your website directory from the server

Once the file is saved, in a terminal go to your web directory:

```
cd C:\website\path
```

Then deploy your project

```
dploy live
```

You should see any changed files uploaded to the server!

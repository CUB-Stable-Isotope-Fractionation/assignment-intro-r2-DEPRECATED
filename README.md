# R Intro (part 2)

[![status](
  https://travis-ci.com/ORGANIZATION/REPOSITORY.svg?token=G1bSzEvMAupn3uUudqbz&branch=master
)](
  https://travis-ci.com/ORGANIZATION/REPOSITORY
)

 1. Complete the exercises in [`assignment.Rmd`](assignment.Rmd)
 2. Make sure that the code in `assignment.Rmd` passes linting checks and renders/knits successfully to HTML
 3. Submit by creating a pull request with `submit` as the **base branch** and your instructor as the reviewer

## Setup

 1. Login: log into the RStudio Server with your username and password
 2. Clone repository (with git previously configured in the [RMarkdown introduction](../assignment-rmarkdown-intro/)):
   - if you have an open project in your RStudio Server, close it by choosing **Close Project** from the **Project** dropdown button in the upper right corner (it should say `Project: (None)` afterwards)
   - at the top of this repository, click on the green **Clone or download** button and copy the shown link to the clipboard
   - in your R Server terminal (not the console), type `git clone ` and paste the copied link right after (so it says something to the effect `git clone https://github.com/......git`), then execute the command to creates a local copy of your GitHub repository (the new folder should show up in the files list on the right)
 3. Load project:
  - click the **Project** dropdown button again and choose **Open Project**
  - navigate to the new project folder and select the `project.Rproj` file inside it
  - this will load a new R session rooted in the new project folder (you will see this project now selected in the **Project** dropdown)

## Code checking badge (optional)

 1. To add a badge that shows the status of the code checks:
  - open this file (`README.md`) in your RStudio Server and in the **status** link above, replace each instance of `ORGANIZATION/REPOSITORY` with the **GitHub name of your classroom** `/` **name of your repository**: these are both shown in big letters at the top of the repository page on GitHub, or alternatively, can be copied from everything after `https://github.com/` in the web address of the repository main page
  - click **Preview** to confirm that you get an image that looks like this for the status badge: ![build unknown](https://raw.githubusercontent.com/travis-ci/travis-api/master/public/images/result/unknown.png)
  - commit this change to the `README.md` and push it to GitHub
  - as soon as your instructor activates the automatic code checking and the first check completes (usually within a few hours), the code checking will run automatically after every single commit (typically within 2-5 minutes) and show you in red if there are problems (`build failing`) or in green if your code has run without any trouble (`build passing`)
  - if you want to see details about the status of the code check after a commit, you should be able to click on the status badge to get to Travis CI (click **Sign in with GitHub** and enter your GitHub credentials, you may have to sign out and back in if you access it for the first time on a new repository)

## Resources

 - [dplyr cheat sheet](https://github.com/rstudio/cheatsheets/raw/master/data-transformation.pdf)

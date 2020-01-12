# Tech Team Onboarding 2019
Welcome to the HackGT Tech Team! Today you'll learn about our in house deployment system, [Beehive](https://github.com/HackGT/beehive) and how we make our live sites! Make sure that you have [jekyll](https://jekyllrb.com/docs/installation/) installed.

## Step 0, Cloning

Clone the repository to your local machine by running `git clone https://github.com/HackGT/onboarding-2019.git`.

## Step 1, Branching
Make a branch of this code named with your first name. 

On the command line, this can be done with the `git branch` command. For example, I would run `git branch stephanie`. Then, checkout your new branch with `git checkout <branchname>`.

## Step 2, Personalize your website!
[Read the wiki](https://github.com/HackGT/live-site/wiki) to learn how to add content to your live site. Our system utilizes *blocks*. In order to edit the content in each block, edit the corresponding markdown file. Use `_event_pages` to edit the navigation of your site. You can also edit the themeing of your website (i.e. font, color, assets, etc.) using the files in `_sass` and `assets`. Look at some of the other branches for inspiration!

## Step 3, View your website!
Before you start this step, make sure you have Jekyll installed. Jekyll will read the markup that you just wrote and convert it to a real website. To view your website as you develop, run `bundle exec jekyll serve`. This command will give you an address where the website is being hosted on (Usually `http://127.0.0.1:4000/`).

## Step 4, Docker!
[Docker](docker.com) is a container system for our applications. Each Docker container can be thought of as a lightweight virtual machine, which comes with the application and all it's dependencies built in.
### Building
 Docker containers must first be built. The build process is where we specify how to run our application and tell Docker what dependencies to include. At the root directory of each of our repositories is a `Dockerfile`, which uses Docker-specific scripting lanaguage to define how the Docker container is built. There already is a Docker file in this repo from previous deployments, so this is just an fyi

## Step 5, deployment.yaml
At the root of each of our applications there's a `deployment.yaml`. This contains options related to deployment into our cluster. For now, we only need to specify that our application will be listening on port `80`. This is what the `deployment.yaml` file in the repository does.

## Step 5.5, Push IT!

Now you're ready to get your ducks in a row and push to GitHub!

Add all the files you want to commit to the _staging area_:
```
git add <file one> <file two> ...
```

Check to see that all the changes you want to commit are written in green in:
```
git status
```

Commit everything:
```
git commit -m 'My commit message here!'
```

Finally, push:
```
git push origin <branch name>
```

If your push failed, make sure your in-sync with GitHub by pulling any possibly new changes:
```
git pull -r origin <branch name>
```

## Step 6, Deployment
That's all you need to build an application in our cluster! Let's discuss deployment.


[Beehive](https://github.com/hackgt/biodomes) is our repository for managing deployments of our applications. Each `yaml` file in the repository corresponds to an application hosted on a subdomain of `hack.gt`. For example, `registration.yaml` specifies the file to be hosted on `registration.hack.gt` and `dev/registration.yaml` specifies the application hosted on `registration.dev.hack.gt`. 

To deploy your application, create a `yaml` file with your name in the `onboarding2019/` folder. This will be deployed to `<yourname>.onboarding2019.hack.gt`. In the yaml file, we simply specify the git url and branch of our application.

Create the file `onboarding2019/<yourname>.yaml` with the following content:
```yaml
 git:
    remote: https://github.com/HackGT/onboarding-2019.git
    branch: <branch_you_made_earlier>
```

Once you push this file to the `Beehive` repository, `Beehive` will immediately begin deploying your website. In a few minutes, you should see it live at `<yourname>.onboarding2019.hack.gt`!

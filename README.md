# Dockerized GitKraken v6.5.1

## Why?

GitKraken is a great tool for visualization and to interact with GIT repos. What i especially like about GitKraken is the ability of stage per line and the graphical interactive rebase mechanism.
Opening private repos on Github was only allowed till v6.5.1. However, v6.5.1 isn't installable anymore in recent distributions like Ubuntu 24.04. 
So this repo packs this version up in a OCI image and let's you run this version in more recent linux distributions.

## How to run

There is a script called `run` in this repository. Download it to a directory that is within your $PATH, e.g. `~/bin`

```bash
$ curl -L https://raw.githubusercontent.com/siredmar/docker-gitkraken/master/run -o ~/bin/gitkraken
$ chmod +x ~/bin/gitkraken
```

Run gitkraken by providing it a directory containing some repos you want to open, e.g.

```bash
$ gitkraken /home/user/myrepos
```


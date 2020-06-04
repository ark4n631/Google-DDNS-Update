# Google-DDNS-Update Docker version
Simple Google Domains DDNS Public IP Updater

A simple tool that keeps dynamic dns records updated
on Google Domains.

This is a fork from [jcruse03/Google-DDNS-Update](https://github.com/jcruse03/Google-DDNS-Update.git)

All the credits goes to him and his python code, this is just a small wrapper to run it through docker, i've created this project because i required to update a google DNS through a NAT network. I found really nice the implementantion but i wanted to have it OS agnostic that's why i decided to make a docker version.

## Requirements:

- [Docker](https://docs.docker.com/install/) service.
- git.


## Installation
First you need to clone the repo:

```sh
git clone git@github.com:ark4n631/Google-DDNS-Update.git
cd Google-DDNS-Update
```

## Docker

Make sure you have docker installed and your user is able to manipulate the docker service.

First make sure you configure  your DNS entries in `ddns-update.conf` there is an example in the file.

### Build the image
Then you need to build the image simply do:

```sh
docker build -t google-ddns-updated:latest .
```

### Run the image
You can run the image and atttach to the logs, make sure it works (ctrl+c to stop):

```sh
docker run --rm -it --name google-ddns google-ddns-updated:latest
```


### Run the container as service

**Run** the image in detach (`-d`) mode to do this simply run:

```sh
docker run -d --name google-ddns --restart always google-ddns-updated:latest
```

To see the **LOGS** use:

```sh
docker logs -f google-ddns
```

To **STOP** the service, this will delete the image (since we used `--rm`):

```sh
docker stop gogole-ddns
```

---
*Happy Hacking* :-)

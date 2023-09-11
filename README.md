# Drupal
An environment for drupal development where you choose the repository for the `composer create` command.

## *Prerequisites*
An understanding of:
- [Docker](https://docs.docker.com/)
- [Git](https://git-scm.com/doc)
- [Drupal](https://www.drupal.org/documentation)

## Installation
***SSH***
```
git clone git@github.com:everynameistaken1/drupal-composer.git CHOOSE_FOLDER_LOCATION
```

***HTTPS***
```
git clone https://github.com/everynameistaken1/drupal-composer.git CHOOSE_FOLDER_LOCATION
```

After it's been cloned, change the values in the *.env* file at the root of folder. Make sure to follow the advice in the comments of that file, do not keep passwords inside that file but set them in your environment.

Run `docker compose up -d` and wait for everything to download and install. This may take some time.

## ***NOTE***
This repository requires **YOU** to configure drupal, since it allows you to choose which repository to use when running `composer create`. This repository provides you with two shell scripts inside the [Drupal-Composer](https://github.com/everynameistaken1/drupal-composer/tree/main/Drupal-Composer) folder. These are run in either the build process or as part of the container entrypoint.

You can run `docker logs drupal` to see if the *drupal* container is ready. You know it's ready when you see this:
> NOTICE: ready to handle connections

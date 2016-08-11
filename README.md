# d7leangitacquiaexample
Example of a Drupal 7 Lean Git Repository structure for Acquia hosting.

This example reponsitory shows how you can build and maintain a Drupal 7
site that will be hosted on Acquia while storing only the custom code and
project specific files in your git repository.

A separate build task handles building a deployment package containing
the full production source tree and pushes that to the Acquia environment.

This approach has several benefits:
* It keeps your git repository small.
* It keeps your git repository clean in that it doesn't contain anything
  that can be downloaded from an external source.
* Allows you to independently control the presence of development specific
  files.  For example, you can have the script download the devel module
  in your local environment, but have that module excluded in the production
  deployment.

# What gets setup
Running ```compoer install``` and ```vagrant up``` creates the following:
* A local development copy of Drupal 7, several contrib modules, and the project custom code.
* A DrupalVM instance supporting both www and non-www URLs.
* A DrupalVM instance supporting SSL on the www URL.
* A script for automatically syncing the DrupalVM DB with the Acquia Dev environment DB.



# Prerequisites
* vagrant 1.8.4+ (https://www.vagrantup.com/)
* Composer installed globally (https://getcomposer.org/)

The following vagrant plugins are recommended:
```
vagrant plugin install vagrant-auto_network
vagrant plugin install vagrant-cachier
vagrant plugin install vagrant-gatling-rsync
vagrant plugin install vagrant-hostsupdater
vagrant plugin install vagrant-rsync-back
vagrant plugin install vagrant-vbguest
```

NOTE: The plugins "vagrant-auto_network" and "vagrant-hostsupdater" are required.  The others are recommended.

# Development Setup

1. Clone this git repository.
1. Run ```composer install```
1. Run ```vagrant up```
1. Run ```vagrant provision``` to ensure all dependencies have been met.
1. Run ```vagrant reload``` to ensure the correct host file entries have been created.

```
cd ~/vagrant/projects
git clone git@github.com:shawnachieve/d7leangitacquiaexample.git
cd d7leangitacquiaexample
composer install
vagrant up
vagrant reload
./scripts/sync_db.sh
```

Running ```vagrant reload``` at the end is necessary in order to generate the
appropriate drush aliases and host file entries on your host computer.

# Production build
To build a version of the project for deployment to a live hosting environment:

```
composer install --prefer-dist --no-dev --no-interaction
```

# References

* http://www.ifdattic.com/how-to-use-composer/
* https://www.vagrantup.com/
* https://www.drupal.org/node/2718229
* http://www.drupalvm.com/
* https://getcomposer.org/

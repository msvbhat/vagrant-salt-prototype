# vagrant-salt-test

This repo contains a sample project using vagrant and salt. The purpose of
this repo is to simply learn and explore [salt stack](https://saltstack.com/)
and [Sensu](https://sensuapp.org/).


So here I use [vagrant](https://www.vagrantup.com/) with
[virtualbox](https://www.vagrantup.com/docs/virtualbox/) provider to launch
the vms. And use [salt provisioner](https://www.vagrantup.com/docs/provisioning/salt.html)
to provision a mysql database and a [sample webapp](https://github.com/josephspurrier/gowebapp)
which uses the mysql database. Once the webapp is running, I setup a monitoring system
using Sensu to monitor system metrics and our application. The monitoring setup is
also done by the salt.

Here I run the salt in the guest vms in masterless mode. The reason is to
simply avoid setting up salt-master in the host machine.

## prerequisites

This project needs below two packages to be installed and configured on the
host machine.

* vagrant 1.2 or higher.
* Virtualbox 5.0.20 or higher

I have used vagrant-1.9.5 and virtualbox-5.0.20 for developement and testing this project.

Since we need to access the webapp and monitoring dashboard which are running
in the vms from the host machine, I have set the port forwarding to access them.
So please make sure that below ports on your host machine is free.

* 8081 - To access the sample webapp
* 8082 - To access the monitoring dashboard


## Running the project

To run this project clone this repo, navigate to the root of the repo which contains
the file `Vagrantfile` and simply run the command `vagrant up`.

```bash
git clone https://github.com/msvbhat/vagrant-salt-prototype.git
cd vagrant-salt-prototype
vagrant up
```

The `vagrant up` command spawns three vms one after the other. The first
one runs mysql, second one runs sample webapp and third vm runs the monitoring
service. And depending on your host machine it may take anywhere around 30 minutes.

Note that I have used `ubuntu/trusty64` vagrant box image for vms. So if this box
is not available in your host machine, it will be downloaded from the
Hashicorp Atlas. And this may take a while depending on your host machine and
network speed.

## Checking the sample webapp and monitoring

To access the sample webapp, simply open your favorite browser in your host machine
and navigate to http://localhost:8081/. This will open a login page. Click on the
login page and create a new account. Once you have logged in with newly created
account, you can simply create some notes and access it later.

To check the monitoring system navigate to the URL http://localhost:8082/ in
your browser. This opens up a [Uchiwa dashboard](https://uchiwa.io/#/). There
you can check the health of the all three vms.

The monitoring should also display if mysql and webapp are running. To test this
monitoring system, you can login into *Database* vm by running `vagrant ssh Database`
and killing the mysql service ( `sudo service mysql stop`). Within 30 seconds, the
sensu dashboard should show a critical event displaying that mysql is not running.

The same strategy can be used to test gowebapp monitoring. You can login to Webapp
vm (`vagrant ssh Webapp`) and kill gowebapp process (`sudo pkill gowebapp`). This
shoudl result in a critical event in sensu uchiwa dashboard within 30 seconds.

## Cleaning up the project

Once you are done with meddling about the sample webapp and monitoring (and maybe
vagrant), you can terminate all the vms and cleanup the system using below command.

```bash
vagrant destroy -f
```

That will force shutdown all the vms and clean up your environment. Note that this
will not delete the vagrant box `ubuntu/trusty64` which was used in launching the
vms.

## Potential improvements to make

* Use SSL for communication to rabbitmq and uchiwa.
* Secure the mysql installation
* Add authentication to redis and uchiwa
* Add handlers to the check events sending mail/pagerDuty notification upon critical events
* Use non-root user to run the webapp (and wherever else possible)

That's it, thank you for exploring this project.

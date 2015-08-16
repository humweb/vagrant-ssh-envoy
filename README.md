# Vagrant SSH Envoy Setup

This will enable you to run `Envoy` (SSH Task Runner) on a local vagrant box.
Tasks like `composer update` and `composer install` so you dont have to ssh into the VM to run tasks.


## Setup

**Run**
```
./setup.sh
```
This appends the vagrant ssh config settings to your ~/.ssh/config


## Usage

```
./envoy.phar run <task>
```

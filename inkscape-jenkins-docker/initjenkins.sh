#!/bin/sh

mkdir /var/jenkins_home/plugins
cd /var/jenkins_home/plugins && curl -O https://updates.jenkins-ci.org/latest/bazaar.hpi

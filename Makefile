shared:
	sudo mkdir /var/inkscape-jenkins
	sudo chown 1000:1000 /var/inkscape-jenkins/

dockers: inkscape_jenkins/jenkins inkscape_jenkins/fedora inkscape_jenkins/ubuntu


inkscape_jenkins/fedora:
	cd   inkscape-fedora-docker && \
	docker build -t inkscape_jenkins/fedora .

inkscape_jenkins/ubuntu:
	cd   inkscape-ubuntu-docker && \
	docker build -t inkscape_jenkins/ubuntu .

inkscape_jenkins/jenkins:
	cd   inkscape-jenkins-docker && \
	docker build --tag=inkscape_jenkins/jenkins . 

run:	dockers
	docker run  -d  --name inkscape_jenkins_fedora  -v /var/inkscape-jenkins:/var/jenkins_home  inkscape_jenkins/fedora 
	docker run  -d  --name inkscape_jenkins_ubuntu  -v /var/inkscape-jenkins:/var/jenkins_home  inkscape_jenkins/ubuntu 
	docker run  -d  --name inkscape-jenkins -p 18080:8080 -v /var/inkscape-jenkins:/var/jenkins_home \
	--link=inkscape_jenkins_fedora:inkscape_fedora \
	--link=inkscape_jenkins_ubuntu:inkscape_ubuntu \
	jenkins

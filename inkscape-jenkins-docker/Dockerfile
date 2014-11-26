FROM jenkins
USER root
RUN apt-get -y update
RUN apt-get -y install curl
RUN apt-get -y install bzr
ADD initjenkins.sh /bin/initjenkins.sh
USER jenkins



FROM ubuntu
RUN apt-get -y update
RUN apt-get -y build-dep inkscape
RUN apt-get -y install autopoint


# Add user & group "jenkins" to the image and set its password
RUN groupadd jenkins
RUN useradd -m -g jenkins -s /bin/bash jenkins
RUN echo "jenkins:jenkins" | chpasswd

RUN apt-get -y install openssh-server
# Create the ssh host keys needed for sshd
RUN ssh-keygen -A

RUN sed -i -e 's/^UsePAM .*/UsePAM no/' /etc/ssh/sshd_config
RUN sed -i -e 's/^PasswordAuthentication .*/PasswordAuthentication yes/' /etc/ssh/sshd_config

RUN mkdir /var/run/sshd
RUN chmod 0755 /var/run/sshd
# Expose the standard SSH port
EXPOSE 22
RUN apt-get -y install default-jre
RUN apt-get -y install bzr
# Start the ssh daemon
CMD ["/usr/sbin/sshd", "-D"]

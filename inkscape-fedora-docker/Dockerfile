FROM fedora:20

RUN yum -y install ImageMagick-c++-devel ImageMagick-c++ ImageMagick-devel ImageMagick glibmm24-devel libsigc++-devel gtkmm24-devel glibmm24 libsigc++ gtkmm24 intltool gc gc-devel lcms lcms-devel gsl gsl-devel libxml2-devel libxslt-devel boost-devel popt-static poppler-devel inkscape gcc gcc-g++ libtool  libtool-ltdl-devel which


# for ssh
RUN yum -y install openssh-server
RUN ssh-keygen -A

# Add user & group "jenkins" to the image and set its password
RUN groupadd jenkins
RUN useradd -m -g jenkins -s /bin/bash jenkins
RUN echo "jenkins:jenkins" | chpasswd

# so it seems you need a jre for a jenkins slave
RUN yum -y install java-1.7.0-openjdk-headless
# Expose the standard SSH port
EXPOSE 22

RUN yum -y install bzr
RUN yum -y install gcc-c++
# RUN yum -y install boost* #boost-devel didnt seem enough? or was just gcc-c++?


# Start the ssh daemon
CMD ["/usr/sbin/sshd", "-D"]


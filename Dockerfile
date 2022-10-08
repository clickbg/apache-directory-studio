FROM ubuntu:22.04

RUN ln -s /usr/bin/dpkg-split /usr/sbin/dpkg-split
RUN ln -s /usr/bin/dpkg-deb /usr/sbin/dpkg-deb
RUN ln -s /bin/rm /usr/sbin/rm
RUN ln -s /bin/tar /usr/sbin/tar

# Install packages that we need
ENV DEBIAN_FRONTEND=noninteractive
RUN apt-get update \
    && apt-get install -y xserver-xorg \
    && apt-get install -y tightvncserver \
    && apt-get install -y default-jre \
    && apt-get install -y wget \
    && apt-get install -y libswt-gtk-4-java \
    && apt-get install -y libswt-gtk-4-jni \
    && apt-get clean \
    && rm -rf /tmp/* /var/lib/apt/lists/* /var/tmp/*

# Setup VNC with password root
ENV USER=root
RUN mkdir -p /root/.vnc \
    && chmod 700 /root/.vnc
RUN printf "root" | vncpasswd -f > /root/.vnc/passwd \
    && chmod 600 /root/.vnc/passwd
RUN touch /root/.xsession

# Download and install Apache Directory Studio
ADD download_directory_studio.sh /root/
WORKDIR /root
RUN chmod 700 ./download_directory_studio.sh
RUN ./download_directory_studio.sh

ADD entrypoint.sh /
ENTRYPOINT ["/entrypoint.sh"]

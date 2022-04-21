FROM ubuntu:latest

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
WORKDIR /root
RUN wget --no-check-certificate -r --accept-regex='2.*' --reject-regex 'update' -A 'ApacheDirectoryStudio*linux*.tar.gz' https://dlcdn.apache.org/directory/studio/
RUN tar -xf $(find ~+ ./dlcdn.apache.org -name '*linux*tar.gz') -C /root/
RUN rm -rf /root/dlcdn.apache.org

ADD entrypoint.sh /
ENTRYPOINT ["/entrypoint.sh"]

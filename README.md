
# apache-directory-studio


[![CICD](https://github.com/clickbg/homekit-monitord/workflows/CICD/badge.svg?branch=main)](https://github.com/clickbg/homekit-monitord/actions/workflows/cicd.yaml)
[![UPDATE](https://github.com/clickbg/homekit-monitord/workflows/UPDATE/badge.svg?branch=main)](https://github.com/clickbg/homekit-monitord/actions/workflows/update.yaml)
[![PUBLISH](https://github.com/clickbg/homekit-monitord/workflows/PUBLISH/badge.svg)](https://github.com/clickbg/homekit-monitord/actions/workflows/publish.yaml)

<img src="https://www.docker.com/wp-content/uploads/2022/03/vertical-logo-monochromatic.png" width="20" height="20"> [Avaliable on DockerHub](https://hub.docker.com/r/clickbg/apache-directory-studio)

<img src="https://www.apache.org/img/support-apache.jpg" width="20" height="20"> [Donate to Apache Fondation](https://donate.apache.org/)

This project packages [Apache Directory Studio](https://directory.apache.org/studio/) in Ubuntu Latest container with TightVNC.   

This image is set to automatically rebuild with every Ubuntu release and download the latest version of Apache Directory Studio - during build time.

Apache Directory Studio is a complete directory tooling platform intended to be used with any LDAP server however it is particularly designed for use with ApacheDS. It is an Eclipse RCP application, composed of several Eclipse (OSGi) plugins, that can be easily upgraded with additional ones.  

**Requirements**
--
Docker host running on amd64, armv7 or arm64 - Raspberry Pi or any modern Intel/AMD powered computer or VM

**Usage**
--
Command Line:  

    docker run --name apache-directory-studio -d -p '127.0.0.1:5901:5901' clickbg/apache-directory-studio:latest   
  

Using [Docker Compose](https://docs.docker.com/compose/):

    version: '3.6'
    services:
    
      apache-directory-studio:
        container_name: apache-directory-studio
        image: clickbg/apache-directory-studio:latest 
        ports:
          - "127.0.0.1:5901:5901"

**Connecting**   
--
**VNC password:** root   
**VNC host:** 127.0.0.1:5901   
   
**Linux**  
--
Install a VNC client (if your distro doesn't provide one). 

Debian/Ubuntu

    apt-get install xtightvncviewer
 
1. Open the VNC client app 
2. Navigate to `vnc://127.0.0.1:5901`
3. Enter password: **root**


**MacOS**   
--
MacOS has built-in VNC viewer which works great

1. Open Safari
2. Navigate to `vnc://127.0.0.1:5901`
3. Enter password: **root**

Or execute in terminal:

    open -a safari 'vnc://127.0.0.1:5901'   

   
**Windows**
--
Install [TightVNC for Windows](https://www.tightvnc.com/download.php) or [RealVNC Viewer](https://www.realvnc.com/en/connect/download/viewer/)

1. Open the VNC client app 
2. Navigate to `vnc://127.0.0.1:5901`
3. Enter password: **root**



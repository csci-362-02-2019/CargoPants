## How we set up Contrast-Finder

We built Contrast-Finder on Ubuntu 18.0.4

Tanaguru's own instructions for installing Contrast-Finder can be found on its
[wiki](https://github.com/Tanaguru/Contrast-Finder/wiki/Howto-build-&-install).
Note that there are some differences between their instructions and how I ended up setting things up.
This is mostly due to outdated instructions or conflicting versions of technologies.

### Prerequesites

The version of tanaguru Contrast Finder we have is 0.3.5.
This version was built with JDK 1.7 and the current release of Maven.
It also uses Apache Tomcat as its web service API.

Java 1.7 must be downloaded manually from
[Oracle's Java archive](https://www.oracle.com/technetwork/java/javase/downloads/java-archive-downloads-javase7-521261.html).

Maven can be installed via apt:

    sudo apt update
    sudo apt install maven

Contrast Finder uses Apache Tomcat. The latest version of Tomcat which supports Java 1.7 is Tomcat 8.5.45.
My steps for installing Tomcat may be found [here](/csci-362-02-2019/CargoPants/wiki/Installing-Tomcat).

### Installation

To get Contrast Finder running, first clone the repository, then build it with Maven.

    git clone https://github.com/Tanaguru/Contrast-Finder.git
    cd Contrast-finder
    mvn clean && mvn package

---

*Everything up to this point works.* After this point, the instructions as noted in Contrast-Finder's wiki **do not work**. I have attempted the following in hopes that it would, but so far have not had much luck.

---

Next, the resulting package should be moved and given to tomcat so it can run as a local web service.
Some directory file structure needs to be made in the process.

    sudo mkdir /var/lib/tomcat/
    sudo mkdir /var/lib/tomcat/webapps/
    sudo cp contrast-finder-webapp/target/contrast-finder-webapp-0.3.5.war /var/lib/tomcat/webapps/
    sudo mkdir /var/log/contrast-finder/
    sudo chown -R tomcat: /var/lib/tomcat
    sudo chown -R tomcat: /var/log/contrast-finder
    sudo invoke-rc.d tomcat restart

Contrast-Finder should now be available at http://localhost:8080/contrast-finder-webapp-0.3.5/
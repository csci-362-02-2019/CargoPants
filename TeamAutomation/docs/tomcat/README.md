## Installing Tomcat

Tomcat is required for the front end of Tanaguru.
Setting it up is a bit involved, but this sequence of commands should do the trick.

The original guide I followed is at https://linuxize.com/post/how-to-install-tomcat-8-5-on-ubuntu-18.04/  
Note that some commands are different, since the above guide is somewhat outdated.

The version of Tomcat I installed is 8.5, since it is the last version documented as supporting Java 1.7.

    sudo apt update
    sudo apt install unzip wget

Both should already be installed, but the instructions I followed mentioned them, so best be safe.

    cd /Downloads
    wget http://www.gtlib.gatech.edu/pub/apache/tomcat/tomcat-8/v8.5.45/bin/apache-tomcat-8.5.45.zip

*(This link was working as of 09/17/2019 7:30PM.)*

    unzip apache-tomcat-8.5.45.zip
    sudo mkdir -p /opt/tomcat
    sudo mv apache-tomcat-8.5.45 /opt/tomcat/

By default, tomcat will look in a `latest/` folder, which we can link to the current version with a symbolic link.

    sudo ln -s /opt/tomcat/apache-tomcat-8.5.45 /opt/tomcat/latest

Tomcat is now where it needs to be, but it needs to have its own user account to run properly.
The next few commands will create a new user for tomcat and give the new folder to said user.

    sudo useradd -m -U -d /opt/tomcat -s /bin/false tomcat
    sudo chown -R tomcat: /opt/tomcat
    sudo sh -c 'chmod +x /opt/tomcat/latest/bin/*.sh'

Next, a systemd .service file named `tomcat.service` needs to be created and added to the `/etc/systmd/system/` directory.
The original guide had the file in print, but I saved a backup of it in `docs/tomcat/` directory for ease of access. (The name is slightly different for added security.)

These commands should take the existing file and move it to the system folder in-tact.

    cd <project-directory>/TeamAutomation/docs/tomcat/
    mv tomcat.service.bak tomcat.service
    sudo mv tomcat.service /etc/systemd/system/

Now that the service is in place, we should tell systemd to start running it.

    sudo systemctl daemon-reload
    sudo systemctl start tomcat

We can check to see if it is running with the following command

    sudo systemctl status tomcat

Output from that command should look like the following:

    ● tomcat.service - Tomcat 8.5 servlet container
       Loaded: loaded (/etc/systemd/system/tomcat.service; disabled; vendor preset: enabled)
       Active: active (running) since Sat 2018-05-05 11:04:40 UTC; 5s ago
      Process: 13478 ExecStart=/opt/tomcat/latest/bin/startup.sh (code=exited, status=0/SUCCESS)
     Main PID: 13499 (java)
        Tasks: 45 (limit: 507)
       CGroup: /system.slice/tomcat.service
               └─13499 /usr/lib/jvm/default-java/bin/java -Djava.util.logging.config.file=/opt/tomcat/latest/conf/logging.properties -Djava.util.logging.manager=org.apache.juli.ClassLoaderLogManager -Djava.security.

And tomcat is running properly! Visiting http://localhost:8080/ should show the initial tomcat webpage.
_(Pressing Q will exit the status screen.)_

Optional: tomcat can be instructed to start up automatically with the command:

    sudo systemctl enable tomcat

Without this, tomcat will need to be manually started after each reboot.
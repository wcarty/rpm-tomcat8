rpm-tomcat
===========

An RPM spec file to install Tomcat 10.x.

To Build:

`sudo dnf -y install rpmdevtools && rpmdev-setuptree`

`wget https://raw.github.com/wcarty/rpm-tomcat8/master/tomcat.spec -O ~/rpmbuild/SPECS/tomcat.spec`

`wget https://raw.github.com/wcarty/rpm-tomcat8/master/tomcat.init -O ~/rpmbuild/SOURCES/tomcat.init`

`wget https://raw.github.com/wcarty/rpm-tomcat8/master/tomcat.sysconfig -O ~/rpmbuild/SOURCES/tomcat.sysconfig`

`wget https://raw.github.com/wcarty/rpm-tomcat8/master/tomcat.logrotate -O ~/rpmbuild/SOURCES/tomcat.logrotate`

`wget https://downloads.apache.org/tomcat/tomcat-10/v10.1.34/bin/apache-tomcat-10.1.34.tar.gz -O ~/rpmbuild/SOURCES/apache-tomcat-10.1.34.tar.gz`

`rpmbuild -bb ~/rpmbuild/SPECS/tomcat.spec`

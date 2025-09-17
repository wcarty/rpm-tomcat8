rpm-tomcat8
===========

An RPM spec file to install Tomcat 8.5.

To Build:

`sudo yum -y install rpmdevtools && rpmdev-setuptree`

`wget https://raw.github.com/wcarty/rpm-tomcat8/master/tomcat8.spec -O ~/rpmbuild/SPECS/tomcat8.spec`

`wget https://raw.github.com/wcarty/rpm-tomcat8/master/tomcat8.init -O ~/rpmbuild/SOURCES/tomcat8.init`

`wget https://raw.github.com/wcarty/rpm-tomcat8/master/tomcat8.sysconfig -O ~/rpmbuild/SOURCES/tomcat8.sysconfig`

`wget https://raw.github.com/wcarty/rpm-tomcat8/master/tomcat8.logrotate -O ~/rpmbuild/SOURCES/tomcat8.logrotate`

`wget https://archive.apache.org/dist/tomcat/tomcat-8/v8.5.95/bin/apache-tomcat-8.5.95.tar.gz -O ~/rpmbuild/SOURCES/apache-tomcat-8.5.95.tar.gz`

`rpmbuild -bb ~/rpmbuild/SPECS/tomcat8.spec`

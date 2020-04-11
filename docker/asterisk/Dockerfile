FROM centos:7

LABEL ru.lamoda.project.version=2.0.0 \
      ru.lamoda.project.name=callcenter \
      ru.lamoda.project.domain=* \
      ru.lamoda.project.component=asterisk


RUN rpm -Uvh https://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm

RUN yum groupinstall -y core && yum -y --skip-broken groupinstall base && yum -y groupinstall web-server \
    && yum -y groupinstall --disablerepo=\* --enablerepo=base,updates,cr "Development Tools"

#todo некоторые пакеты дублируются, некоторые непонятно зачем, например: php - непонятно зачем он нужен

RUN yum -y --skip-broken install gcc gcc-c++ lynx bison libedit-devel mysql-devel e2fsprogs-devel \
    keyutils-libs-devel krb5-devel libogg libselinux-devel libsepol-devel mariadb-server \
    gmp php-gd php-pdo gnutls-devel libogg-devel openssl-devel zlib-devel perl-DateManip \
    php php-mysql php-pear php-mbstring tftp-server httpd make ncurses-devel libtermcap-devel \
    sendmail sendmail-cf caching-nameserver sox newt-devel libxml2-devel libtiff-devel audiofile-devel \
    gtk2-devel subversion kernel-devel git php-process crontabs cronie cronie-anacron wget vim \
    php-xml uuid-devel libtool libtool-ltdl-devel sqlite-devel libuuid-devel sqlite unixODBC \
    unixODBC-devel mysql-connector-odbc texinfo curl-devel net-snmp-devel neon-devel speex-devel \
    gsm-devel iksemel-devel spandsp-devel mc htopdoxygen path svn

RUN yum -y --skip-broken install lynx mysql-devel e2fsprogs-devel keyutils-libs-devel krb5-devel libogg libselinux-devel \
    libsepol-devel gmp php-gd php-pdo gnutls-devel libogg-devel openssl-devel zlib-devel perl-DateManip php \
    php-mysql php-pear php-mbstring tftp-server httpd make ncurses-devel libtermcap-devel sendmail sendmail-cf \
    caching-nameserver sox newt-devel libxml2-devel libtiff-devel audiofile-devel gtk2-devel kernel-devel \
    php-process crontabs cronie cronie-anacron wget vim php-xml uuid-devel libtool-ltdl-devel sqlite-devel \
    libuuid-devel sqlite unixODBC unixODBC-devel mysql-connector-odbc texinfo curl-devel net-snmp-devel neon-devel \
    speex-devel gsm-devel spandsp-devel mc htop patch perl automake* kernel kernel-headers-`uname -r` \
    kernel-devel-`uname -r` glibc-headers ipset.x86_64 ipset-devel.x86_64 nmap

RUN yum -y install libpcap-devel pcre-devel

# get link here: http://downloads.asterisk.org/pub/telephony/asterisk/
# was removed/clean older :(


#RUN cd /usr/src/ && wget http://downloads.asterisk.org/pub/telephony/asterisk/asterisk-16.9.0.tar.gz && tar zxvf asterisk-16.9.0.tar.gz \
#    && cd asterisk-16.9.0 && ./configure --with-jansson-bundled --prefix=/usr --libdir=/usr/lib64 \
#    && make && make install && make samples && ldconfig

RUN cd /usr/src/ && wget http://downloads.asterisk.org/pub/telephony/asterisk/asterisk-17.3.0.tar.gz && tar zxvf asterisk-17.3.0.tar.gz \
    && cd asterisk-17.3.0 && ./configure --with-jansson-bundled --prefix=/usr --libdir=/usr/lib64 \
    && make && make install && make samples && ldconfig


RUN cd /usr/src && \
    git clone https://github.com/irontec/sngrep && \
    cd sngrep && \
    ./bootstrap.sh && \
    ./configure && \
    make && \
    make install


COPY asterisk/config/modules.conf /etc/asterisk/modules.conf
COPY asterisk/config/pjsip.conf /etc/asterisk/pjsip.conf
COPY asterisk/config/extensions.conf /etc/asterisk/extensions.conf
COPY asterisk/config/rtp.conf /etc/asterisk/rtp.conf

CMD ["sleep", "2000m"]
#/usr/sbin/asterisk -f
#CMD ["/usr/sbin/asterisk", "-f"]
FROM centos:7

LABEL ru.lamoda.project.version=2.0.0 \
      ru.lamoda.project.name=callcenter \
      ru.lamoda.project.domain=* \
      ru.lamoda.project.component=asterisk


RUN rpm -Uvh https://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm

RUN yum groupinstall -y core && yum -y --skip-broken groupinstall base && yum -y groupinstall web-server \
    && yum -y groupinstall --disablerepo=\* --enablerepo=base,updates,cr "Development Tools"

#todo некоторые пакеты дублируются, некоторые непонятно зачем, например: php - непонятно зачем он нужен
# php-gd php-pdo php php-mysql php-pear php-mbstring php-process php-xml php-mysql php-pear php-mbstring
RUN yum -y --skip-broken install gcc gcc-c++ lynx bison libedit-devel mysql-devel e2fsprogs-devel \
    keyutils-libs-devel krb5-devel libogg libselinux-devel libsepol-devel mariadb-server \
    gmp gnutls-devel libogg-devel openssl-devel zlib-devel perl-DateManip \
    tftp-server httpd make ncurses-devel libtermcap-devel \
    sendmail sendmail-cf caching-nameserver sox newt-devel libxml2-devel libtiff-devel audiofile-devel \
    gtk2-devel subversion kernel-devel git crontabs cronie cronie-anacron wget vim \
    uuid-devel libtool libtool-ltdl-devel sqlite-devel libuuid-devel sqlite unixODBC \
    unixODBC-devel mysql-connector-odbc texinfo curl-devel net-snmp-devel neon-devel speex-devel \
    gsm-devel iksemel-devel spandsp-devel mc htopdoxygen path svn srtp libsrtp-devel

RUN yum -y --skip-broken install lynx mysql-devel e2fsprogs-devel keyutils-libs-devel krb5-devel libogg libselinux-devel \
    libsepol-devel gmp  gnutls-devel libogg-devel openssl-devel zlib-devel perl-DateManip \
    tftp-server httpd ncurses-devel libtermcap-devel sendmail sendmail-cf \
    caching-nameserver sox newt-devel libxml2-devel libtiff-devel audiofile-devel gtk2-devel kernel-devel \
    crontabs cronie cronie-anacron wget vim uuid-devel libtool-ltdl-devel sqlite-devel \
    libuuid-devel sqlite unixODBC unixODBC-devel mysql-connector-odbc texinfo curl-devel net-snmp-devel neon-devel \
    speex-devel gsm-devel spandsp-devel mc htop patch perl automake* kernel kernel-headers-`uname -r` \
    kernel-devel-`uname -r` glibc-headers ipset.x86_64 ipset-devel.x86_64 nmap

RUN yum -y install libpcap-devel pcre-devel telnet


RUN cd /usr/src/ && wget http://downloads.asterisk.org/pub/telephony/asterisk/asterisk-17-current.tar.gz && tar zxvf asterisk-17-current.tar.gz \
    && export astdir=`ls -d asterisk-*/` && cd $astdir && ./configure --with-jansson-bundled --prefix=/usr --libdir=/usr/lib64 \
    && make && make install && make samples && ldconfig


RUN cd /usr/src && \
    git clone https://github.com/irontec/sngrep && \
    cd sngrep && \
    ./bootstrap.sh && \
    ./configure && \
    make && \
    make install


RUN yum -y install http://rpms.remirepo.net/enterprise/remi-release-7.rpm
RUN yum-config-manager --disable remi-php54
RUN yum-config-manager --enable remi-php73
RUN yum -y install php php-cli php-fpm php-mysqlnd php-zip php-devel php-gd php-mcrypt php-mbstring php-curl php-xml php-pear php-bcmath php-json

RUN curl --silent --location https://rpm.nodesource.com/setup_10.x | sudo bash - && \
    yum -y install nodejs && npm install -g wscat

COPY asterisk/config/ /etc/asterisk/

CMD ["/usr/sbin/asterisk", "-f"]
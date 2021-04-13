FROM centos:centos7

RUN \
mkdir -p /cvmfs /etc/cvmfs /var/lib/cvmfs && \
yum fs filter languages en && yum fs filter documentation && \
yum -y install \
https://linuxsoft.cern.ch/wlcg/centos7/x86_64/wlcg-repo-1.0.0-1.el7.noarch.rpm \
https://ecsft.cern.ch/dist/cvmfs/cvmfs-release/cvmfs-release-latest.noarch.rpm \
https://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm \
 && \
yum -y install \
bash bash-completion bash-completion-extras util-linux coreutils gawk sudo curl environment-modules \
fuse fuse-libs fuse3 fuse3-libs bindfs  \
git python mariadb maridb-devel curl curl-devel bzip2 bzip2-devel unzip make autoconf automake texinfo libtool \
gettext gettext-devel freetype freetype-devel libpng libpng-devel sqlite sqlite-devel ncurses ncurses-devel \
mesa-libGLU-devel libX11-devel libXpm-devel libXext-devel libXft-devel libxml2 libxml2-devel tk-devel glfw-devel motif motif-devel \
pciutils-devel bison flex perl-ExtUtils-Embed which gcc-gfortran gcc-c++ swig rsync \
python3 python3-libs python3-devel python3-pip python3-wheel python3-setuptools python3-rpm-macros python3-other-rpm-macros \
centos-release-scl HEP_OSlibs && \
yum install -y --disablerepo=UMD* cvmfs cvmfs-fuse3 cvmfs-config-none && \
yum -y update && \
rm -rf /var/cache/yum/*

COPY etc_cvmfs /etc/cvmfs/

ENTRYPOINT [ "/usr/bin/bash", "-i", "-l" ]
CMD ["-c"]

LABEL maintainer="Adrian.Sevcenco@spacescience.ro"
LABEL description="EL7 image to run HEP/CERN oriented software distributed through cvmfs"

# yum install -y http://repository.egi.eu/sw/production/umd/4/centos7/x86_64/updates/umd-release-4.1.3-1.el7.centos.noarch.rpm && \
# yum install -y cvmfs-x509-helper && \

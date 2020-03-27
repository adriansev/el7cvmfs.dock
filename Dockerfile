FROM centos:centos7

RUN \
mkdir -p /cvmfs /etc/cvmfs /var/lib/cvmfs && \
yum -y update && \
yum -y install bash gawk bash-completion util-linux coreutils sudo curl fuse fuse-libs fuse3 fuse3-libs bindfs \
https://ecsft.cern.ch/dist/cvmfs/cvmfs-release/cvmfs-release-latest.noarch.rpm \
https://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm \
https://linuxsoft.cern.ch/wlcg/centos7/x86_64/wlcg-repo-1.0.0-1.el7.noarch.rpm \
http://repository.egi.eu/sw/production/umd/4/centos7/x86_64/updates/umd-release-4.1.3-1.el7.centos.noarch.rpm && \
yum install -y HEP_OSlibs cvmfs cvmfs-fuse3 --disablerepo=UMD* && \
yum install -y cvmfs-x509-helper --enablerepo=UMD* && \
yum clean all && rm -rf /var/cache/yum

SHELL ["/usr/bin/bash", "-c"]
CMD ["/usr/bin/bash"]

LABEL maintainer="Adrian.Sevcenco@spacescience.ro"


#!/bin/sh
# Script to add side repos to image and install packages therefrom

cat <<'EOF' > /etc/yum.repos.d/EMI2-base.repo
[EMI2-base]
name=EMI2-base
baseurl=http://emisoft.web.cern.ch/emisoft/dist/EMI/2/sl5/$basearch/base
enabled=1
EOF

cat <<'EOF' > /etc/yum.repos.d/EMI2-updates.repo
[EMI2-updates]
name=EMI2-updates
baseurl=http://emisoft.web.cern.ch/emisoft/dist/EMI/2/sl5/$basearch/updates
enabled=1
EOF

cat <<'EOF' > /etc/yum.repos.d/EMI2-third-party.repo
[EMI2-third-party]
name=EMI2-third-party
baseurl=http://emisoft.web.cern.ch/emisoft/dist/EMI/2/sl5/$basearch/third-party
enabled=1
EOF

cat <<'EOF' > /etc/yum.repos.d/CVMFS.repo
[CVMFS]
name=CVMFS
baseurl=http://cvmrepo.web.cern.ch/cvmrepo/yum/cvmfs/$basearch
enabled=1
EOF

#cat <<'EOF' > /etc/yum.repos.d/glideinwms-vm.repo
#[glideinWMS-vm]
#name=glideinWMS-vm
#baseurl=http://www.hep.ph.ic.ac.uk/~mhuffman/cloud/glideinwms/el5
#enabled=1
#EOF

cat <<'EOF' > /etc/yum.repos.d/EMI1-trustanchors.repo
[EMI1-trustanchors]
name=EMI1-trustanchors
baseurl=http://repository.egi.eu/sw/production/cas/1/current/
enabled=1
EOF

rpm --import http://emisoft.web.cern.ch/emisoft/dist/EMI/2/RPM-GPG-KEY-emi 
rpm --import http://repository.egi.eu/sw/production/cas/1/GPG-KEY-EUGridPMA-RPM-3

yum -y install curl dhclient fuse iputils libxslt ntp openssh openssh-server openssh-clients \
puppet python sysklogd tar vim-enhanced util-linux wget xterm xorg-x11-xauth \
yum yum-priorities xrootd-client xrootd-fuse
yum -y install ca-policy-egi-core fetch-crl emi-wn
#yum -y install cvmfs glideinwms-vm-core glideinwms-vm-openstack emi-wn ganglia-gmond


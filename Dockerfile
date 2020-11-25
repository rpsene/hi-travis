FROM registry.redhat.io/ubi8/ubi-minimal:latest

RUN microdnf install -y --nodocs git python3 python3-pip gcc python3-devel gcc-c++ atlas-devel gcc-gfortran  && microdnf clean all
#COPY snafu/image_resources/centos8-appstream.repo /etc/yum.repos.d/centos8-appstream.repo
RUN microdnf install -y --nodocs redis && microdnf clean all
RUN microdnf install -y --nodocs hostname procps-ng iproute net-tools ethtool nmap iputils && microdnf clean all
RUN microdnf install -y uperf && microdnf clean all
RUN ln -s /usr/bin/python3 /usr/bin/python
RUN python3 -m pip install --upgrade cython numpy importlib_metadata 'urllib3!=1.25.0,!=1.25.1,<1.26,>=1.21.1' && python3 -m pip install --upgrade scipy
#RUN mkdir -p /opt/snafu/
#COPY . /opt/snafu/
#RUN pip3 install -e /opt/snafu/
#https://dl.fedoraproject.org/pub/epel/epel-release-latest-8.noarch.rpm
#--enablerepo=centos8-appstream 

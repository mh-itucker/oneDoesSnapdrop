FROM centos:7.2.1511

RUN yum install -y git \
&& yum install -y epel-release \
&& yum install -y nodejs

RUN cd / \
&& git clone https://github.com/person896/oneDoesSnapdrop.git

RUN cd /oneDoesSnapdrop/packages/pwa && npm install -g gulp bower
RUN cd /oneDoesSnapdrop/packages/pwa && npm install && bower install --allow-root
RUN cd /oneDoesSnapdrop && npm install -g yarn
RUN cd /oneDoesSnapdrop && yarn run lerna publish --skip-npm --conventional-commits

EXPOSE 3002
EXPOSE 443

WORKDIR /oneDoesSnapdrop
FROM drecom/centos-base:latest

RUN yum install -y git \
&& yum install -y epel-release \
&& yum install -y nodejs \
&& yum install -y initscripts

RUN cd / \
&& git clone https://github.com/person896/oneDoesSnapdrop.git

RUN cd /oneDoesSnapdrop/packages/pwa && npm install -g gulp bower
RUN cd /oneDoesSnapdrop/packages/pwa && npm install && bower install --allow-root

EXPOSE 3002

WORKDIR /oneDoesSnapdrop

CMD [ "bash", "start.sh" ]

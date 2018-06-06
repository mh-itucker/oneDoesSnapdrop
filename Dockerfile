FROM centos:7.2.1511

RUN yum install -y git \
&& yum install -y epel-release \
&& yum install -y nodejs

RUN cd / \
&& git clone https://github.com/person896/oneDoesSnapdrop.git

RUN cd /oneDoesSnapdrop && npm install -g yarn
RUN cd /oneDoesSnapdrop && npm install && yarn start
RUN cd /oneDoesSnapdrop && yarn run lerna -- run wct --stream -- -- -p
RUN cd /oneDoesSnapdrop && yarn run lerna publish --skip-npm --conventional-commits
RUN cd /oneDoesSnapdrop && git push --follow-tags

EXPOSE 3002

WORKDIR /oneDoesSnapdrop

CMD [ "bash", "start.sh" ]